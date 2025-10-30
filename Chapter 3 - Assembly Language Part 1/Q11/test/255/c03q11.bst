rv Version 3.5                        Thu Oct 30 16:33:11 2025
Zach Mascetta

Header
R
A 00000048
A 00000064
C

Loc         Instruction in Binary                   Source Code
                                              # Write and run an assembly language program whic
                                              # and displays the number of 1-bits in its 32-bit
                                              # Test your program with 0, 1, -1, 255, and -5000

                                              # a0 = number
                                              # t0 = current digit
                                              # t1 = mask
                                              # t2 = counter/shift amount
                                              # t3 = running total
                                              # s0 = prompt
                                              # s1 = label

0000  1000 0000 0000 0000 0000 0011 0011 0111                     lui t1, 0x80000             #
0004  0000 0001 1111 0000 0000 0011 1001 0011                     addi t2, x0, 31             #
0008  0000 0000 0000 0000 0000 1110 0001 0011                     addi t3, x0, 0              #
000c  0000 0100 1000 0001 1010 0100 0000 0011                     lw s0, aprompt              #
0010  0000 1100 0000 0100 0000 0000 0000 0000                     sout s0                     #
0014  0000 1110 0000 0000 0000 0101 0000 0000                     din a0                      #
0018  0000 0001 0100 0000 0000 0000 1110 1111                     jal ra, subroutine          #

001c  0000 0110 0100 0001 1010 0100 1000 0011                     lw s1, alabel               #
0020  0000 1100 0000 0100 1000 0000 0000 0000                     sout s1                     #
0024  0000 0100 0000 1110 0000 0000 0000 0000                     dout t3                     #
0028  0000 0000 0000 0000 0000 0000 0000 0000                     halt                        #

002c  0000 0000 1010 0011 0111 0010 1011 0011  subroutine:        and t0, t1, a0              #
0030  0000 0000 0111 0010 1101 0010 1011 0011                     srl t0, t0, t2              #
0034  0000 0000 0101 1110 0000 1110 0011 0011                     add t3, t3, t0              #
0038  0000 0000 0001 0011 0101 0011 0001 0011                     srli t1, t1, 1              #
003c  1111 1111 1111 0011 1000 0011 1001 0011                     addi t2, t2, -1             #
0040  1111 1110 0000 0011 1101 0110 1110 0011                     bge t2, x0, 0(subroutine)   #
0044  0000 0000 0000 0000 1000 0000 0110 0111                     jalr x0, 0(ra)              #


0048  0000 0000 0000 0000 0000 0000 0100 1100 aprompt:        .word       prompt
004c  0110 0001 0110 0101 0110 1100 0101 0000 prompt:         .asciz      "Please enter a numbe
0050  0110 0101 0010 0000 0110 0101 0111 0011 
0054  0111 0010 0110 0101 0111 0100 0110 1110 
0058  0110 1110 0010 0000 0110 0001 0010 0000 
005c  0110 0101 0110 0010 0110 1101 0111 0101 
0060  0000 0000 0010 0000 0011 1010 0111 0010 

0064  0000 0000 0000 0000 0000 0000 0110 1000 alabel:         .word       label
0068  0110 0010 0110 1101 0111 0101 0100 1110 label:          .asciz      "Number of 1's: "
006c  0110 1111 0010 0000 0111 0010 0110 0101 
0070  0010 0111 0011 0001 0010 0000 0110 0110 
0074  0000 0000 0010 0000 0011 1010 0111 0011 
======================================================= Output
Please enter a number: 255
Number of 1's: 8
=========================================== Program statistics
Input file name       = c03q11.a
Instructions executed = 204 (decimal)
Program size          = 78 (hex) 120 (decimal)
Load point            = 0 (hex) 0 (decimal)
Programmer            = Zach Mascetta
