# [SAT] Boolean Satisfiability Challenge

Use an SAT solver to figure out the two-digit code given the following statements:

```
71   neither of the digits is correct
83   one digit is correct and in the right place
19   one digit is correct but in the wrong place
80   neither of the digits is correct
```

Show all the intermediate steps of your work, like we did in [class](./class03.md).

> Hint:
> In addition to the constraints you get from the clues above, you should also add:
> ```
> s10 s11 s12 s13 s14 s15 s16 s17 s18 s19
> s20 s21 s22 s23 s24 s25 s26 s27 s28 s29
> ```
> Which means there has to be some first digit and some second digit.
> 
