rv Version 3.5                        Tue Oct 28 17:47:26 2025
Zach Mascetta

Header
R
A 0000004c
A 00000068
A 00000080
C

Loc         Instruction in Binary                   Source Code
                                              # Write and run an assembly language program that
                                              # and passes its address to a subroutine via a0. 
                                              # Your subroutine should then display all and onl
                                              # Test your program with "Aa1Bb2Cc3{+".

                                              #   a0 = buffer
                                              #   t0 = character from buffer
                                              #   t1 = lower bound for character check
                                              #   t2 = upper bound for character check
                                              #   t3 = 10 check for newline 
                                              #   t4 = prompt
                                              #   t5 = label

0000  0000 0011 0000 0000 0000 0011 0001 0011                 addi t1, x0, 48                 #
0004  0000 0011 1001 0000 0000 0011 1001 0011                 addi t2, x0, 57                 #
0008  0000 0000 1010 0000 0000 1110 0001 0011                 addi t3, x0, 10                 #
000c  0000 0100 1100 0001 1010 1110 1000 0011                 lw t4, aprompt                  #
0010  0000 1100 0000 1110 1000 0000 0000 0000                 sout t4                         #
0014  0000 1000 0000 0001 1010 0101 0000 0011                 lw a0, abuffer                  #
0018  0001 0100 0000 0101 0000 0000 0000 0000                 sin a0                          #

001c  0000 0000 0000 0101 0000 0010 1000 0011                 lb t0, 0(a0)                    #
0020  0000 0110 1000 0001 1010 1111 0000 0011                 lw t5, alabel               # loa
0024  0000 1100 0000 1111 0000 0000 0000 0000                 sout t5                         #
0028  0000 0000 1000 0000 0000 0000 1110 1111                 jal ra, subroutine              #

002c  0000 0000 0000 0000 0000 0000 0000 0000                 halt                            #

0030  0000 0000 0110 0010 1100 0110 0110 0011 subroutine:     blt t0, t1, 12(subroutine)       
0034  0000 0000 0111 0010 1101 0100 0110 0011                 bge t0, t2, 12(subroutine)       
0038  0000 1010 0000 0010 1000 0000 0000 0000                 aout t0                         #
003c  0000 0000 0001 0101 0000 0101 0001 0011                 addi a0, a0, 1                  #
0040  0000 0000 0000 0101 0000 0010 1000 0011                 lb t0, 0(a0)                    #
0044  1111 1111 1100 0010 1001 0110 1110 0011                 bne t0, t3, 0(subroutine)       #
0048  0000 0000 0000 0000 1000 0000 0110 0111                 jalr x0, 0(ra)                  #


004c  0000 0000 0000 0000 0000 0000 0101 0000 aprompt:        .word   prompt
0050  0110 0001 0110 0101 0110 1100 0101 0000 prompt:         .asciz  "Please enter a string: "
0054  0110 0101 0010 0000 0110 0101 0111 0011 
0058  0111 0010 0110 0101 0111 0100 0110 1110 
005c  0111 0011 0010 0000 0110 0001 0010 0000 
0060  0110 1110 0110 1001 0111 0010 0111 0100 
0064  0000 0000 0010 0000 0011 1010 0110 0111 

0068  0000 0000 0000 0000 0000 0000 0110 1100 alabel:         .word   label
006c  0110 1001 0110 0011 0110 0101 0100 0100 label:          .asciz  "Decimal Digits: "
0070  0010 0000 0110 1100 0110 0001 0110 1101 
0074  0110 1001 0110 0111 0110 1001 0100 0100 
0078  0010 0000 0011 1010 0111 0011 0111 0100 
007c  0000 0000 0000 0000 0000 0000 0000 0000 

0080  0000 0000 0000 0000 0000 0000 1000 0100 abuffer:        .word   buffer
0084  0000 0000 0000 0000 0000 0000 0000 0000 buffer:         .zero   100
00e4  0000 0000 0000 0000 0000 0000 0000 0000 
======================================================= Output
Please enter a string: Aa1Bb2Cc3{+
Decimal Digits: 123
=========================================== Program statistics
Input file name       = c03q08.a
Instructions executed = 70 (decimal)
Program size          = e8 (hex) 232 (decimal)
Load point            = 0 (hex) 0 (decimal)
Programmer            = Zach Mascetta
