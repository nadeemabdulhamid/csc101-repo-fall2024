# CSC 101 - Challenge: Grammars & L-Systems

## Part 1 - Grammar Detective

Consider these grammars:

```
// GRAMMAR #1
Start: S
S=AS
S=ASB
S=SS
S=


// GRAMMAR #2
Start: S
S=ATB
T=AT,BT,


// GRAMMAR #3
Start: S
S = ASB,BSA,SS, 


// GRAMMAR #4
Start: S
S=ASB, 


// GRAMMAR #5
Start: S
S=ASA,BSB,A,B,
```

<!-- 
    1: # a's  >=  # b's
    2: starts with a, ends with b
    3: equal #s of a's and b's
    4: some number of a's followed by the same number of b's
    5: palindrome
-->


For each of the following strings, determine which of the grammars above can be used to parse the string. You should indicate *all* grammars by which the string could be parsed. 

```
STRING #1:   AAABBB
STRING #2:   AAAAA
STRING #3:   ABAABABAABAAB
STRING #4:   ABABAB
STRING #5:   BABABA
STRING #6:   ABBBBA
STRING #7:   ABAABAA
```

> I will post a "quiz" on Canvas where you can record your answers for Part 1.

<!--
1/1,2,3,4
2/1,5
3/1,2
4/1,2,3
5/1,3
6/5
7/1
-->



## Part 2 - Designing L-systems

Design two L-systems that can be rendered using the tool at: https://piratefsh.github.io/p5js-art/public/lsystems/

1. Find an example of an L-system on the internet (you can search for pages [like this one](https://paulbourke.net/fractals/lsys/)) and produce a modified version. You should submit a text file containing:
    - a link to the original source,
    - your complete modified set of rules
    - a description of what you change, why, and how it changed the rendered image.


2. Design an completely original L-system of your own. You should submit the following in your text file:
    - a complete set of rules for your system
    - a description of the process you went through to create the design, 

