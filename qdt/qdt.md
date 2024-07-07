# CSC 101 - Challenge: Quadtree Decoding

![Overall 32x32 quad tree](qdt-tree.png)

For this activity, you need to decode a portion of a quadtree data structure to fill in the pixels of a 32x32 image. Everyone is in charge of a particular 8x8 subportion (`A` ... `P` in the tree above) of the overall image. In some cases, a couple of people are assigned to a particular 8x8 piece - you should each decode the portion and check and consolidate your answer with each other.

Once you have determined what the pixels of your portion of the tree are, you can fill them in [this shared Excel spreadsheet](https://berrycollege2-my.sharepoint.com/:x:/g/personal/nhamid_berry_edu/ESJ73OasrfpCjHDc14IDmmUB0FY5QCHyxHJ7jXF5qztxlw?e=Ii9zul). As I went over in class, you can copy the entire spreadsheet contents into a *plain text file* with a ".pbm" extension and view the resulting bitmap image. (Use an online converter if your OS doesn't come with an application to view PBM format images.)

## Image portion text codes

You will need to translate the encoded string to a quadtree diagram. And then convert the quadtree into the 8x8 pixel block.

|Part|Encoding|
|-|----------------|
A | -0-001-0110--01101100
B | --0-001111--0011-001111-1-1100-00100-11-11011
C | --1-1001-10011-0-0110-01100--00010-00100-1-1011-10001
D | -0-0110-01100
E | ---0011-001111--0011-000111--1100-1100-00110--1100-11000-0011
F | --0011-000-000101
G | -1001
H | --1001-0110-0110-000-0011
I | --1001-0110-0011-0011
J | -10--000100-10001
K | --1-100000000
L | -1-11-110010--1101-110000
M | -0-011-0010--011011-01100
N | --1001-0-0110-01100-0011-1-101111
O | --11-1110-01001--0100-1100000
P | -0-0-01000000


## Image portion assignments

|Part|Name|
|-|----------------|
A | Will	and Catie
B | Anthony	and Owen
C | Orlando	and Zach
D |    (already done)
E | Ethan
F | Ashlyn
G |    (already done)
H | Luke	and Oluwatofunmi
I | Evan	and Kayla
J | Caylen	and Paul
K | Mereck
L | Kason	and Cooper
M | Avery	and Kaitlyn
N | Daniel	and Gabriel
O | Jake	and Soli
P | Sacha

