Lab2_Bapty
==========

##PRELAB

### Truth Table

|   A   |   B   |  Cin  |  Cout  |   S   |
|-------|-------|-------|--------|-------|
| 0     | 0     | 0     | 0      | 0     |
| 0     | 1     | 0     | 0      | 1     |
| 1     | 0     | 0     | 0      | 1     |
| 1     | 1     | 0     | 1      | 0     |
| 0     | 0     | 1     | 0      | 1     |
| 0     | 1     | 1     | 1      | 0     |
| 1     | 0     | 1     | 1      | 0     |
| 1     | 1     | 1     | 1      | 1     |

### Circuit Schematic

![alt tag](https://raw2.github.com/seanbapty/Lab2_Bapty/master/1%20bit%20adder%20schematic%20labbokpages.co.uk.jpg)
![alt tag](https://raw2.github.com/seanbapty/Lab2_Bapty/master/circuitInterface.JPG)

### Circuit Output

![alt tag](https://raw2.github.com/seanbapty/Lab2_Bapty/master/1%20Bit%20Adder%20Output.JPG)

##Main Lab

### Final Circuit Schematic

![alt tag](https://raw2.github.com/seanbapty/Lab2_Bapty/master/fourbitadderschematic.JPG)

### Error Log
None so far.

#### Documentation
The prelab schematic was taken from labbokpages.co.uk. Additionally, the truth table was verified using a truthtable from njau.edu. The final schematic was taken from izatxamir.com. The looping testbench was modeled after an example from seas.upenn.edu. However, my testbench and this testbench greatly in how they report the specific value at which the error occured because this testbench only accounts for unsigned addition. The logic equation describing the xor relationship for overflow detection was taken from c-jump.com. A brief oral description of the syntax for the when statement used to implement the subtraction was provided my Daniel Eichman.
