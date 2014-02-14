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

### Final Output
![alt tag](https://raw2.github.com/seanbapty/Lab2_Bapty/master/FinalOutput.JPG)

### Design Process

First a "full adder" was created using behavioral VHDL programming. This was easily checked using a non-looping testbench that check all 6 possibilities for inputs A, B, and Carry. Once this was completed, structural programming was used to combine 4 full adders in series with signals C between them and an output S at each stage. Implementing a testbench for this design was more challenging. In order to handle the vast number of possible inputs, nested loops were used, with the outer loop checking all inputs A and the inner checking all inputs B. Once it was confirmed that four bit addition of input vector A and B could be accomplished, subtraction of B from A was implemented. To do this a new logic input "NegIndicator" was created. When this input was true, the vector B was assigned a negative value in twos compliment using behavioral programming before addition (B was notted and then added to 0001). Unfortunately, with successful implementation of subtraction, there became even more possibilities to check. Therefore, 2 self-checking nested looping testbenches were implemented where the first nested loop checked addition and the second checked subtraction. The self-checking came from the command assert (see Error Log for guidance). Finally, overflow detection was implemented. In twos complement, an overflow occurs if the carry in for the final full adder does not equal the carry out for the final full adder. In standard logic an overflow occurs when Cin XOR Cout. Once this was implemented, full functionality was achieved and a .ucf file was generated where A and B had four input switches and NegIndicator had an input button. Also, the output Sum was assigned to four LEDs and the overflow detection assigned an LED. Finally, a bit file was created, and the four bit adder was loaded onto the FPGA.

Full funtionality including subtraction and overflow detection was checked and confirmed by Capt. Silva on 14 December, 2014.

### Error Log

When implementing the looping testbench, the assert statement must be followed by a string. This was problematic because the image command only works with scalar types i.e. not std_logic_vector. This was solved by reporting each vector element seperately and & them together.

Initially the overflow detection was too complicated. The original command only checked for overflow detection during subtraction. This did not account for instances such as 7 summed with 1. This was corrected by removing the when statement specifying to check overflow during subtraction.

#### Documentation
The prelab schematic was taken from labbokpages.co.uk. Additionally, the truth table was verified using a truthtable from njau.edu. The final schematic was taken from izatxamir.com. The looping testbench was modeled after an example from seas.upenn.edu. However, my testbench and this testbench greatly in how they report the specific value at which the error occured because this testbench only accounts for unsigned addition. The logic equation describing the xor relationship for overflow detection was taken from c-jump.com. A brief oral description of the syntax for the when statement used to implement the subtraction was provided my Daniel Eichman.
