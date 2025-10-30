rv Version 3.5                        Thu Oct 30 15:16:19 2025
Zach Mascetta

Header
R
A 00000044
A 00000068
C

Loc         Instruction in Binary                   Source Code
                                              # Wirte and run an assembly language program whic
                                              # (with spaces separating the bits) and displays 
                                              # Test your program by entering 0 1 0 1.

                                              # a0 = buffer
                                              # t0 = current character
                                              # t1 = shift amount
                                              # t2 = running total
                                              # s0 = prompt
                                              # s1 = label

0000  0000 0000 0011 0000 0000 0011 0001 0011                     addi t1, x0, 3              #
0004  0000 0000 0000 0000 0000 0011 1001 0011                     addi t2, x0, 0              #
0008  0000 0110 1000 0001 1010 0101 0000 0011                     lw a0, abuffer              #
000c  0000 0100 0100 0001 1010 0100 0000 0011                     lw s0, aprompt              #
0010  0000 1100 0000 0100 0000 0000 0000 0000                     sout s0                     #
0014  0001 0100 0000 0101 0000 0000 0000 0000                     sin a0                      #
0018  0000 0000 1000 0000 0000 0000 1110 1111                     jal ra, subroutine          #
001c  0000 0000 0000 0000 0000 0000 0000 0000                     halt                        #

0020  0000 0000 0000 0101 0000 0010 1000 0011 subroutine:         lb t0, 0(a0)                #
0024  1111 1101 0000 0010 1000 0010 1001 0011                     addi t0, t0, -48            #
0028  0000 0000 0110 0010 1001 0010 1011 0011                     sll t0, t0, t1              #
002c  0000 0000 0111 0010 1000 0011 1011 0011                     add t2, t0, t2              #
0030  0000 0000 0010 0101 0000 0101 0001 0011                     addi a0, a0, 2              #
0034  1111 1111 1111 0011 0000 0011 0001 0011                     addi t1, t1, -1             #
0038  1111 1110 0000 0011 0101 0100 1110 0011                     bge t1, x0, 0(subroutine)   #
003c  0000 1000 0000 0011 1000 0000 0000 0000                     hout t2                     #
0040  0000 0000 0000 0000 1000 0000 0110 0111                     jalr x0, 0(ra)              #


0044  0000 0000 0000 0000 0000 0000 0100 1000 aprompt:        .word   prompt
0048  0110 0001 0110 0101 0110 1100 0101 0000 prompt:         .asciz  "Please enter a binary va
004c  0110 0101 0010 0000 0110 0101 0111 0011 
0050  0111 0010 0110 0101 0111 0100 0110 1110 
0054  0110 0010 0010 0000 0110 0001 0010 0000 
0058  0111 0010 0110 0001 0110 1110 0110 1001 
005c  0110 0001 0111 0110 0010 0000 0111 1001 
0060  0011 1010 0110 0101 0111 0101 0110 1100 
0064  0000 0000 0000 0000 0000 0000 0010 0000 

0068  0000 0000 0000 0000 0000 0000 0110 1000 abuffer:        .word   abuffer
006c  0000 0000 0000 0000 0000 0000 0000 0000 buffer:         .zero   10
0074  0000 0000 0000 0000 0000 0000 0000 0000 
======================================================= Output
Please enter a binary value: 0 1 0 1
5
=========================================== Program statistics
Input file name       = c03q10.a
Instructions executed = 38 (decimal)
Program size          = 78 (hex) 120 (decimal)
Load point            = 0 (hex) 0 (decimal)
Programmer            = Zach Mascetta
