# Class 8 - L-systems; Formal grammars

## In-class

- Grammars

    ```
    // Lindenmayer's original L-system for modelling the growth of algae.
    Axiom: A
    A = AB
    B = A

    // contains a single B
    Axiom: S
    S = TBT
    T = AT
    T = TA
    T = 

    // starts w/ a ends w/ b
    Axiom: S
    S=ATB
    T=AT,BT,

    // equal #s of a's & b's
    Axiom: S
    S = ASB,BSA,SS, 
    ```

    - Parsing...

- Lindenmayer systems (l-systems)

    ```
    F = draw forward
    + = turn right by <angle>
    - = turn left by <angle>
    [ = push location (save)
    ] = pop location (return to last saved/undo)
    ```

    example: `A=F+F++F+F-F--F-F`
  
    - Try at: https://piratefsh.github.io/p5js-art/public/lsystems/




## Assignment

-  [Grammars & L-system design [LSY]](lsy/lsy.md)



## Resources

- https://en.wikipedia.org/wiki/L-system
- https://paulbourke.net/fractals/lsys/ (examples)
- https://algorithmicbotany.org/
- https://web.stanford.edu/class/archive/cs/cs103/cs103.1156/tools/cfg/


<!-- https://www.russellgordon.ca/cemc/2017/lindenmayer-systems/ -->
