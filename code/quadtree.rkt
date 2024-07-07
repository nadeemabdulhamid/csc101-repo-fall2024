#lang racket

(require pict
         racket/draw)

 (require framework)

(module+ test
  (require rackunit))


; A Dim is `(Nat Nat Nat)

;; (quad Nat Nat Nat (U Boolean (list quad quad quad quad)))
(struct quad (x y sz tr) #:transparent)  

(define QT0 (quad 0 0 32 #f))
(define BLACK (send the-color-database find-color "black"))
(define WHITE (send the-color-database find-color "white"))


(module+ test
  (check-equal? (dim-split (list 0 0 32))
                (list (list 16 0 16 )
                      (list 0 0 16 )
                      (list 0 16 16 )
                      (list 16 16 16 ))))


(define (dim-split d) ; : Dim -> [Listof Dim]
  (match-define (list x y sz) d)
  (define new-sz (floor (/ sz 2)))
  
  (list 
   (list (floor (+ x new-sz)) y new-sz )
   (list x y new-sz )
   (list x (floor (+ y new-sz)) new-sz )
   (list (floor (+ x new-sz)) (floor (+ y new-sz)) new-sz )))


;;; NO MORE:
;(define-type Quadtree (U (List quad Boolean)
;                         (List Quadtree Quadtree Quadtree Quadtree)))

(define QT1 ; : Quadtree
  (quad 0 0 16
        (list (quad 8 0 8 #f)
              (quad 0 0 8 #f)
              (quad 0 8 8 (list (quad 4 8 4 #f)
                                (quad 0 8 4 #t)
                                (quad 0 12 4 #t)
                                (quad 4 12 4 #f)))
              (quad 8 8 8 #t))))


(module+ test
  (check-equal? (quadtree->string (quad 0 0 32 #f))
                "32 0")
  (check-equal? (quadtree->string QT1)
                "16 -00-01101")
  (check-equal? (quadtree->string (string->quadtree "16 -00-01101"))
                "16 -00-01101"))
                

(define (quadtree->string q)
  (define (q->s q)
    (match (quad-tr q)
      [#t "1"]
      [#f "0"]
      [qs (for/fold ([s "-"])
                    ([qt qs])
            (string-append s (q->s qt)))]))
  (format "~a ~a" (quad-sz q) (q->s q)))

(define (string->quadtree s )
  (define (s->q x y sz sp)   ; nat nat nat port
    (match (read-char sp)
      [#\0 (quad x y sz #f)]
      [#\1 (quad x y sz #t)]
      [#\- (quad x y sz (for/list ([dim (dim-split (list x y sz))])
                          (s->q (first dim) (second dim) (third dim) sp)))]))
  
  (match-define (list sz/str qs) (string-split s))
  (s->q 0 0 (string->number sz/str) (open-input-string qs)))





(define (quadtree->bmp q)
  (define (quad-draw q dc) 
    (cond
      [(boolean? (quad-tr q))
       (send dc set-pen (if (quad-tr q) "black" "white") 0 'solid)
       ;(print (format "Handling ~a~n" q))
       (for* ([x (in-range (quad-x q) (+ (quad-x q) (quad-sz q)))]
              [y (in-range (quad-y q) (+ (quad-y q) (quad-sz q)))])
         (send dc draw-point x y))
       ]

      [else
       (for ([subtree (quad-tr q)])
         (quad-draw subtree dc))
       ]))
  
  (define bmp (make-monochrome-bitmap (quad-sz q) (quad-sz q)))
  (define dc (send bmp make-dc))
  (quad-draw q dc)
  bmp)

(quadtree->bmp QT1)


;; Number Number Number Dc -> Color or #f
;; produce a color if the entire block region is the same, otherwise false
(define (bmp-is-solid? x-left y-top sz dc)
  (define ref-col (make-object color%))
  (send dc get-pixel x-left y-top ref-col)

  (define chk
    (for*/last ([x (in-range x-left (+ x-left sz))]
                [y (in-range y-top (+ y-top sz))])
     (define chk-col (make-object color%))
     (send dc get-pixel x y chk-col)
     (define match? (equal? ref-col chk-col))
     #:final (not match?)
     match?))
  ;(display chk)

  (and 
   chk
   ref-col))


(module+ test
  (define bmp (quadtree->bmp QT1))
  (define dc (send bmp make-dc))
    
  (check-equal? (bmp-is-solid? 0 0 8 dc)
                (make-color 255 255 255))
  (check-equal? (bmp-is-solid? 8 8 4 dc)
                (make-color 0 0 0))
  (check-equal? (bmp-is-solid? 0 0 16 dc)
                #f))


(define (is-black? col)
    (< (color-model:rgb-color-distance (send col red) (send col green) (send col blue)
                                       (send BLACK red) (send BLACK green) (send BLACK blue))
       (color-model:rgb-color-distance (send col red) (send col green) (send col blue)
                                       (send WHITE red) (send WHITE green) (send WHITE blue))))

;; Nat Nat Nat>0 Dc -> quad
(define (bmp->quadtree/dc x y sz dc)
  (define chk-col (bmp-is-solid? x y sz dc))

  

  (cond
    [chk-col
     ;  chk should be the one and only color
     ;(define ref-col (make-object color%))
     ;(send dc get-pixel x y ref-col)
     (quad x y sz (is-black? chk-col))]

    [else
     (quad x y sz (map (λ(d)
                         (match-define (list x y sz) d)
                         (bmp->quadtree/dc x y sz dc))
                       (dim-split (list x y sz))) )]))

(module+ test
  (check-equal? (bmp->quadtree/dc 0 0 16 dc)
                QT1))


(define (bmp->quadtree bmp)
  (define sz (min (send bmp get-width) (send bmp get-height)))
  (bmp->quadtree/dc 0 0 sz (send bmp make-dc)))


(define (bw bmp)
  (define dc (send bmp make-dc))
  (define ref-col (make-object color%))

  (for* ([x (send bmp get-width)]
         [y (send bmp get-height)])
    (send dc get-pixel x y ref-col)
    ;(display (format "~a ~a ~a~n" x y (is-black? ref-col)))
    (send dc set-pixel x y (if (is-black? ref-col) BLACK WHITE)))
  bmp)


(define P1
  (bw (pict->bitmap
   (cc-superimpose
     (filled-rectangle 16 16 #:color "black")
     (inset (text "2" (cons WHITE 'default) 12) -40)))))
P1


(define P2/bmp
  (make-monochrome-bitmap 1 1))
(send P2/bmp load-file "berry-logo-square.png")
(define P2 (bw (pict->bitmap (scale (bitmap (bw P2/bmp)) 1/12))))








(require pict/tree-layout)

(define (node/sz sz/str) (cc-superimpose (circle 15)
                                     (text sz/str (cons BLACK 'default) 10)))
(define (b-leaf/sz sz) (vc-append (filled-rectangle 15 15 #:color "black")
                                  (text (number->string sz) (cons BLACK 'default) 10)))
(define W-LEAF (filled-rectangle 15 15 #:color "white"))

(naive-layered (tree-layout #:pict (node/sz "16") (tree-edge (tree-layout  #:pict (b-leaf/sz 8)))
                            (tree-edge (tree-layout))))


;; quad -> values pict [hash 1str->str]
(define (quadtree->tree q sz-lim s-map)
  (cond
    [(boolean? (quad-tr q))
     (tree-layout #:pict (if (quad-tr q) (b-leaf/sz (quad-sz q)) W-LEAF))]

    [(and sz-lim (<= (quad-sz q) sz-lim))
     (define next-letter (format "~a"
                                 (for/last ([c "ABCDEFGHIJKLMNOPQRSTUVWXYZ"]
                                            #:final (not (hash-has-key? s-map (format "~a" c))))
                                   c)))
     
     (hash-set! s-map next-letter (quadtree->string q))
     (tree-layout #:pict (node/sz next-letter))]

    [else
     (apply tree-layout (map (λ(sub-q) (quadtree->tree sub-q sz-lim s-map))
                             (quad-tr q))
            #:pict (node/sz (number->string (quad-sz q))))]))

(define (quadtree->pict q [sz-lim #f])
  (define s-map (make-hash))
  (values (naive-layered (quadtree->tree q sz-lim s-map))
          s-map))


(define-values (P2-pict P2-hash) (quadtree->pict (bmp->quadtree P2) 8))
P2-pict
P2-hash




#| ================= |#


