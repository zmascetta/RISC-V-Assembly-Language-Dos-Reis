rv Version 3.5                        Fri Oct  3 18:08:34 2025
Zach Mascetta

Header
R
A 00000034
A 0000005c
C

Loc         Instruction in Binary                   Source Code
                                              # t0 = current number
                                              # t1 = running total
                                              # t2 = prompt
                                              # t4 = total string

0000  0000 0000 0000 0000 0000 0011 0001 0011                 addi t1, x0, 0          # init ru
0004  0000 0011 0100 0001 1010 0011 1000 0011                 lw t2, aprompt          # init pr
0008  0000 1100 0000 0011 1000 0000 0000 0000                 sout t2                 # print p
000c  0000 1110 0000 0000 0000 0010 1000 0000                 din t0                 # capture 
0010  0000 0000 0000 0010 1100 1010 0110 0011                 blt t0, x0, print_total # jump to

0014  0000 0000 0101 0011 0000 0011 0011 0011 loop:           add t1, t1, t0           # add nu
0018  0000 1100 0000 0011 1000 0000 0000 0000                 sout t2                 # print p
001c  0000 1110 0000 0000 0000 0010 1000 0000                 din t0                 # capture 
0020  1111 1110 0000 0010 1101 1010 1110 0011                 bge t0, x0, loop        # repeat 

0024  0000 0101 1100 0001 1010 1110 1000 0011 print_total:    lw t4, atotal           # load to
0028  0000 1100 0000 1110 1000 0000 0000 0000                 sout t4                 # print t
002c  0000 0100 0000 0011 0000 0000 0000 0000                 dout t1                 # print t
0030  0000 0000 0000 0000 0000 0000 0000 0000                 halt                    # end pro

0034  0000 0000 0000 0000 0000 0000 0011 1000 aprompt:    .word prompt
0038  0110 0001 0110 0101 0110 1100 0101 0000 prompt:     .asciz "Please enter a positive numbe
003c  0110 0101 0010 0000 0110 0101 0111 0011 
0040  0111 0010 0110 0101 0111 0100 0110 1110 
0044  0111 0000 0010 0000 0110 0001 0010 0000 
0048  0111 0100 0110 1001 0111 0011 0110 1111 
004c  0010 0000 0110 0101 0111 0110 0110 1001 
0050  0110 0010 0110 1101 0111 0101 0110 1110 
0054  0010 0000 0011 1010 0111 0010 0110 0101 
0058  0000 0000 0000 0000 0000 0000 0000 0000 

005c  0000 0000 0000 0000 0000 0000 0110 0000 atotal:     .word total
0060  0110 0001 0111 0100 0110 1111 0101 0100 total:      .asciz "Total: "
0064  0000 0000 0010 0000 0011 1010 0110 1100 
======================================================= Output
Please enter a positive number: 1
Please enter a positive number: 2
Please enter a positive number: 3
Please enter a positive number: -1
Total: 6
=========================================== Program statistics
Input file name       = c03q03.a
Instructions executed = 21 (decimal)
Program size          = 68 (hex) 104 (decimal)
Load point            = 0 (hex) 0 (decimal)
Programmer            = Zach Mascetta
