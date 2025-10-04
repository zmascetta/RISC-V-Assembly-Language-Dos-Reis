rv Version 3.5                        Sat Oct  4 14:22:31 2025
Zach Mascetta

Header
R
A 00000040
A 0000005c
C

Loc         Instruction in Binary                   Source Code
                                              # Write and run an assembly language program that
                                              # Test your program by entering, 3, 100, -30, -50

                                              # t0 = current number
                                              # t1 = highest number
                                              # t2 = count
                                              # t3 = prompt
                                              # t4 = largest num. label


0000  0000 0000 1001 0000 0000 0011 1001 0011                 addi t2, x0, 9         # init cou
0004  0000 0100 0000 0001 1010 1110 0000 0011                 lw t3, aprompt          # init pr
0008  0000 0101 1100 0001 1010 1110 1000 0011                 lw t4, alabel           # init nu
000c  0000 1100 0000 1110 0000 0000 0000 0000                 sout t3                 # prompt 
0010  0000 1110 0000 0000 0000 0010 1000 0000                 din t0                  # input n
0014  0000 0000 0000 0010 1000 0011 0001 0011                 addi t1, t0, 0          # set ini


0018  0000 1100 0000 1110 0000 0000 0000 0000 loop:           sout t3                 # prompt 
001c  0000 1110 0000 0000 0000 0010 1000 0000                 din t0                  # input n
0020  0000 0000 0101 0011 0100 1100 0110 0011                 blt t1, t0, update_num  # branch 

0024  1111 1111 1111 0011 1000 0011 1001 0011 update_count:   addi t2, t2, -1         # decreme
0028  1111 1110 0111 0000 0001 1000 1110 0011                 bne x0, t2, loop        # loop

002c  0000 1100 0000 1110 1000 0000 0000 0000                 sout t4                 # print l
0030  0000 0100 0000 0011 0000 0000 0000 0000                 dout t1                 # print l
0034  0000 0000 0000 0000 0000 0000 0000 0000                 halt                    # end pro

0038  0000 0000 0000 0010 1000 0011 0001 0011 update_num:     addi t1, t0, 0              # upd
003c  1111 1110 1001 1111 1111 0000 1110 1111                 jal ra, update_count





0040  0000 0000 0000 0000 0000 0000 0100 0100 aprompt:    .word   prompt
0044  0110 0001 0110 0101 0110 1100 0101 0000 prompt:     .asciz  "Please enter a number: "
0048  0110 0101 0010 0000 0110 0101 0111 0011 
004c  0111 0010 0110 0101 0111 0100 0110 1110 
0050  0110 1110 0010 0000 0110 0001 0010 0000 
0054  0110 0101 0110 0010 0110 1101 0111 0101 
0058  0000 0000 0010 0000 0011 1010 0111 0010 

005c  0000 0000 0000 0000 0000 0000 0110 0000 alabel:     .word   label
0060  0110 0111 0111 0010 0110 0001 0100 1100 label:      .asciz  "Largest number: "
0064  0010 0000 0111 0100 0111 0011 0110 0101 
0068  0110 0010 0110 1101 0111 0101 0110 1110 
006c  0010 0000 0011 1010 0111 0010 0110 0101 
0070  0000 0000 0000 0000 0000 0000 0000 0000 
======================================================= Output
Please enter a number: 3
Please enter a number: 100
Please enter a number: -30
Please enter a number: -50
Please enter a number: 101
Please enter a number: 99
Please enter a number: 0
Please enter a number: -1
Please enter a number: 5
Please enter a number: 77
Largest number: 101
=========================================== Program statistics
Input file name       = c03q06.a
Instructions executed = 58 (decimal)
Program size          = 74 (hex) 116 (decimal)
Load point            = 0 (hex) 0 (decimal)
Programmer            = Zach Mascetta
