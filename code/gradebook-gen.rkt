#lang racket

(require math/distributions)
(require 2htdp/batch-io)


;; String Distribution
(define (generate-student-row name distrs)
  (cons name
          (for/list ([d distrs]) (min 100 (round (sample d))))))


(define (make-distribution max)
  (define mean (* max (/ (+ 60 (random 15 30)) 100)))
  (define stddev (- max mean))

  (normal-dist mean stddev))



(define (generate-student-table names hw-min# hw-max#)
  (define hw-count (random hw-min# hw-max#))
  (define hw-maxs  (for/list ([i hw-count])  (* 5 (random 4 15))))
  (define hw-distrs (map make-distribution hw-maxs))

  (define all-distrs (append hw-distrs
                             (for/list ([i 4]) (make-distribution 100))))
  (define all-maxs (append hw-maxs '(100 100 100 100)))

  (define header-row
    `( "Name" ,@(for/list ([i (in-range 1 (add1 hw-count))]) (format "HW~a" i))
                      ,@(for/list ([i (in-range 1 4)]) (format "Exam~a" i))
                      "Project"
                      "Final Grade"))
  (define maxes-row
    `("Total points:" ,@(for/list ([m hw-maxs]) (number->string m))
         "100" "100" "100" "100" ""))
  
  `(,header-row
    ,maxes-row
    ,@(for/list ([n names])
        `(,n ,@(for/list ([d all-distrs] [m all-maxs])
                 (number->string (inexact->exact (min m (round (sample d))))))
             ""))))


(define (write-csv-table rows)
  (write-string
   (string-join (for/list ([row rows])
                  (string-join row ","))
               "\n")))


(generate-student-table '("Nadeem" "Maryam") 5 9)


(define FAKE-NAMES (read-lines "names.txt"))
(define NAMES-TABLE (make-hash))
; setup:
(for ([n FAKE-NAMES])
  (hash-set! NAMES-TABLE (string-ref n 0)
             (cons n (hash-ref NAMES-TABLE (string-ref n 0) '()))))

(define (acronym-of str)
  (for/fold ([names '()]) ([c (string-upcase str)])
    (define choices (hash-ref NAMES-TABLE c))
    (define (pick-a)
      (define choice (list-ref choices (random (length choices))))
      (if (member choice names)
          (pick-a)
          choice))
    (append names (list (pick-a)))))

(acronym-of "Nadeem")


(define REAL-NAMES (read-lines "students.txt"))


(define (generate-student-sheets)
  (for ([student REAL-NAMES])
    (with-output-to-file (format "../xgb/files/~a.csv" student)
      #:exists 'replace
      (λ()
        (write-csv-table (generate-student-table (acronym-of student) 5 9))))

    (system (format "~a  -o ../xgb/files/~a.xlsx ../xgb/files/~a.csv"
                    "../../csv2xlsx_Darwin_all/csv2xlsx"
                    student student))

    (delete-file (format "../xgb/files/~a.csv" student))))





