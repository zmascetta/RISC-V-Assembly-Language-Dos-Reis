rv Version 3.5                        Thu Oct 30 14:46:08 2025
Zach Mascetta

Header
R
A 0000008c
A 000000dc
A 000000f0
A 000000f8
C

Loc         Instruction in Binary                   Source Code
                                              # Write and run an assembly language program that
                                              # Your subroutine should display the number in bi
                                              # Test your program by entered 3210BCD.
                                              # Display the binary number with a space between 

                                              # NOTE: there are obviously more error checks tha
                                              # but for the sake of brevity, I'm only checking 
                                              # from A through F has been entered.

                                              # a0 = buffer

                                              # t0 = character from buffer
                                              # t1 = logic result for lower bound
                                              # t2 = logic result for upper bound
                                              # t3 = result of logic check

                                              # s0 = prompt
                                              # s1 = label
                                              # s2 = space
                                              # s3 = sentinel value for subroutine
0000  0000 0000 1010 0000 0000 1001 1001 0011                 addi s3, x0, 10                 #
0004  0000 1111 0000 0001 1010 1001 0000 0011                 lw s2, aspace                   #
0008  0000 1000 1100 0001 1010 0100 0000 0011                 lw s0, aprompt                  #
000c  0000 1100 0000 0100 0000 0000 0000 0000                 sout s0                         #
0010  0000 1111 1000 0001 1010 0101 0000 0011                 lw a0, abuffer                  #
0014  0001 0100 0000 0101 0000 0000 0000 0000                 sin a0                          #
0018  0000 1101 1100 0001 1010 0100 1000 0011                 lw s1, alabel
001c  0000 1100 0000 0100 1000 0000 0000 0000                 sout s1
0020  0000 0000 0000 0101 0000 0010 1000 0011                 lb t0, 0(a0)                    #

0024  0000 0000 1000 0000 0000 0000 1110 1111                 jal ra, subroutine              #

0028  0000 0000 0000 0000 0000 0000 0000 0000                 halt 

                                              # the logic here can be a bit confusing as the re
                                              # First check to see if it is less than 59/71. Sh
                                              # Second check to see if less than 48/65. Should 
                                              # Branch if t2 >= t1. there are 3 scenarios where
                                              # and only 1 where it is false.
                                              # If character is a digit, it will fail the first
                                              # If character is an uppercase letter, it will fa

002c  0000 0011 1011 0010 1010 0011 0001 0011 subroutine:     slti t1, t0, 59                 #
0030  0000 0011 0000 0010 1010 0011 1001 0011                 slti t2, t0, 48                 #
0034  0000 0000 0110 0011 1101 0100 0110 0011                 bge t2, t1, 16(subroutine)      #
0038  1111 1101 0000 0010 1000 0010 1001 0011                 addi t0, t0, -48                #

003c  0000 0100 0111 0010 1010 0011 0001 0011                 slti t1, t0, 71                 #
0040  0000 0100 0001 0010 1010 0011 1001 0011                 slti t2, t0, 65                 #
0044  0000 0000 0110 0011 1101 0100 0110 0011                 bge t2, t1, 32(subroutine)       
0048  1111 1100 1001 0010 1000 0010 1001 0011                 addi t0, t0, -55                #

004c  0000 0000 1000 0010 1111 1110 0001 0011                 andi t3, t0, 0x8                #
0050  0000 0000 0011 1110 0101 1110 0001 0011                 srli t3, t3, 3                  #
0054  0000 0100 0000 1110 0000 0000 0000 0000                 dout t3                         #

0058  0000 0000 0100 0010 1111 1110 0001 0011                 andi t3, t0, 0x4                #
005c  0000 0000 0010 1110 0101 1110 0001 0011                 srli t3, t3, 2                  #
0060  0000 0100 0000 1110 0000 0000 0000 0000                 dout t3                         #

0064  0000 0000 0010 0010 1111 1110 0001 0011                 andi t3, t0, 0x2                #
0068  0000 0000 0001 1110 0101 1110 0001 0011                 srli t3, t3, 1                  #
006c  0000 0100 0000 1110 0000 0000 0000 0000                 dout t3                         #

0070  0000 0000 0001 0010 1111 1110 0001 0011                 andi t3, t0, 0x1                #
0074  0000 0100 0000 1110 0000 0000 0000 0000                 dout t3                         #
0078  0000 1100 0000 1001 0000 0000 0000 0000                 sout s2                         #

007c  0000 0000 0001 0101 0000 0101 0001 0011                 addi a0, a0, 1                  #
0080  0000 0000 0000 0101 0000 0010 1000 0011                 lb t0, 0(a0)                    #
0084  1111 1011 0011 0010 1001 0100 1110 0011                 bne t0, s3, 0(subroutine)       #
0088  0000 0000 0000 0000 1000 0000 0110 0111                 jalr x0, 0(ra)                  #



008c  0000 0000 0000 0000 0000 0000 1001 0000 aprompt:        .word   prompt
0090  0110 0101 0111 0100 0110 1110 0100 0101 prompt:         .asciz  "Enter a hex number (plea
0094  0010 0000 0110 0001 0010 0000 0111 0010 
0098  0010 0000 0111 1000 0110 0101 0110 1000 
009c  0110 0010 0110 1101 0111 0101 0110 1110 
00a0  0010 1000 0010 0000 0111 0010 0110 0101 
00a4  0110 0001 0110 0101 0110 1100 0111 0000 
00a8  0111 0101 0010 0000 0110 0101 0111 0011 
00ac  0110 0001 0010 0000 0110 0101 0111 0011 
00b0  0111 0000 0110 0001 0110 0011 0010 0000 
00b4  0110 1100 0110 0001 0111 0100 0110 1001 
00b8  0111 0100 0110 0101 0110 1100 0010 0000 
00bc  0010 0000 0111 0010 0110 0101 0111 0100 
00c0  0110 0101 0010 0000 0110 0110 0110 1001 
00c4  0111 0010 0110 0101 0111 0100 0110 1110 
00c8  0010 0000 0110 0111 0110 1110 0110 1001 
00cc  0110 1001 0110 0111 0110 1001 0110 0100 
00d0  0011 0001 0010 0000 0111 0011 0111 0100 
00d4  0011 0101 0011 0001 0010 1101 0011 0000 
00d8  0000 0000 0010 0000 0011 1010 0010 1001 

00dc  0000 0000 0000 0000 0000 0000 1110 0000 alabel:         .word   label
00e0  0110 0001 0110 1110 0110 1001 0100 0010 label:          .asciz "Binary Value: "
00e4  0101 0110 0010 0000 0111 1001 0111 0010 
00e8  0110 0101 0111 0101 0110 1100 0110 0001 
00ec  0000 0000 0000 0000 0010 0000 0011 1010 

00f0  0000 0000 0000 0000 0000 0000 1111 0100 aspace:         .word   space
00f4  0000 0000 0000 0000 0000 0000 0010 0000 space:          .asciz  " "

00f8  0000 0000 0000 0000 0000 0000 1111 1100 abuffer:        .word   buffer
00fc  0000 0000 0000 0000 0000 0000 0000 0000 buffer:         .zero   100
015c  0000 0000 0000 0000 0000 0000 0000 0000 
======================================================= Output
Enter a hex number (please use a capital letter if entering digits 10-15): 3210BCD
Binary Value: 0011 0010 0001 0000 1011 1100 1101 
=========================================== Program statistics
Input file name       = c03q09.a
Instructions executed = 166 (decimal)
Program size          = 160 (hex) 352 (decimal)
Load point            = 0 (hex) 0 (decimal)
Programmer            = Zach Mascetta
