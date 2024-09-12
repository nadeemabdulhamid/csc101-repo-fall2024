# Class 3 - Boolean logic; OS basics

## In-class

### Operating Systems (OS)

- https://e115.engr.ncsu.edu/operating-systems/operating-systems-os/
    - [Mac cheatsheet](https://www.tri-c.edu/learning-commons/metro/documents/mac-os-x-cheat-sheet.pdf)
    - [Windows cheatsheet](https://it.ufsa.ufl.edu/win10/resources/UFSAIT-Windows10-CheatSheet.pdf)

### Boolean logic/satisfiability 

- Boolean logic
- [Boolean satisfiability problem](https://en.wikipedia.org/wiki/Boolean_satisfiability_problem)

- [Logic Puzzles and SAT Solvers: A match made in heaven](https://sabhijit.medium.com/logic-puzzles-and-sat-solvers-a-match-made-in-heaven-5e0a7a64c04b)
    - [Logic calculator](https://www.erpelstolz.at/gateway/formular-uk-zentral.html) - formula conversion
    - [MiniSat in your browser](https://www.msoos.org/2013/09/minisat-in-your-browser/)

    <details>
        <summary>Demo</summary>

    ```
    45  <--- the number

    74  one correct, wrong place  =>  (27 /\ -14 /\ -24 /\ -17) \/ (14 /\ -17 /\ -27 /\ -24)
    93  no			      =>  -19 ∧ -29 ∧ -13 ∧ -23
    55  one correct place	      =>  (15 ∧ -25) v (-15 ∧ 25)
    17  no			      =>  -11 ∧ -21 ∧ -17 ∧ -27

    https://www.erpelstolz.at/gateway/formular-uk-zentral.html

    #1: (s27 ∧ -s14 ∧ -s24 ∧ -s17) ∨ (s14 ∧ -s17 ∧ -s27 ∧ -s24)
            CNF: (S14 ∨ S27) ∧ (¬S27 ∨ ¬S14) ∧ ¬S24 ∧ ¬S17
    #2: -s19 ∧ -s29 ∧ -s13 ∧ -s23
    #3: (S25 ∨ S15) ∧ (¬S15 ∨ ¬S25)
    #4: -s11 ∧ -s21 ∧ -s17 ∧ -s27

    https://www.inf.ufpr.br/dpasqualin/d3-dpll/

    s14   s27
    -s27 -s14
    -s24 -s17
    -s19 
    -s29
    -s13
    -s23
    s25 s15
    -s15 -s25
    -s11
    -s21
    -s17
    -s27

    Solution: SATISFIABLE 14 25 -24 -17 -19 -29 -13 -23 -11 -21 -27 -15
    ```

    </details>


## Assignment

- Complete at least [Day 1] to [Day 5] of [**Advent of Cyber** 2023](https://tryhackme.com/r/room/adventofcyber2023) (see the syllabus - you may complete more days for additional points up to 10)

- [**Boolean Satisfiability Challenge**](./sat.md)

- Continue skill practice: [Typing](https://typing.com)



## References and Links

- https://en.wikipedia.org/wiki/Boolean_algebra

- https://introcs.cs.princeton.edu/java/71boolean/

- https://web.stanford.edu/class/cs103/tools/truth-table-tool/
- https://www.msoos.org/2013/09/minisat-in-your-browser/ (another solver)

- https://booleangame.com/

~

- [Think OS: A Brief Introduction to Operating Systems](https://greenteapress.com/wp/think-os/)
