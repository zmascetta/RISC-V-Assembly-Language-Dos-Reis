rv Version 3.5                        Fri Oct  3 18:58:02 2025
Zach Mascetta

Header
R
A 00000038
A 00000060
C

Loc         Instruction in Binary                   Source Code
                                              # t0 = number
                                              # t1 = running total
                                              # t2 = loop counter
                                              # t3 = prompt
                                              # t4 = total string

0000  0000 0000 0000 0000 0000 0011 0001 0011                 addi t1, x0, 0          # init ru
0004  0000 0000 0000 0000 0000 0011 1001 0011                 addi t2, x0, 0          # init lo

0008  0000 0011 1000 0001 1010 1110 0000 0011                 lw t3, aprompt          # init pr
000c  0000 1100 0000 1110 0000 0000 0000 0000                 sout t3                 # print p
0010  0000 1110 0000 0000 0000 0010 1000 0000                 din t0                  # capture
0014  0000 0000 0101 0000 0100 0100 0110 0011                 blt x0, t0, loop
0018  0000 0000 0000 0000 0000 0000 0000 0000                 halt

001c  0000 0000 0001 0011 1000 0011 1001 0011 loop:           addi t2, t2, 1          # increme
0020  0000 0000 0111 0011 0000 0011 0011 0011                 add t1, t1, t2         # add curr
0024  1111 1110 0111 0010 1001 1100 1110 0011                 bne t0, t2, loop

0028  0000 0110 0000 0001 1010 1110 1000 0011 print_total:    lw t4, atotal
002c  0000 1100 0000 1110 1000 0000 0000 0000                 sout t4                 # print t
0030  0000 0100 0000 0011 0000 0000 0000 0000                 dout t1                 # print t
0034  0000 0000 0000 0000 0000 0000 0000 0000                 halt

0038  0000 0000 0000 0000 0000 0000 0011 1100 aprompt:    .word   prompt
003c  0110 0001 0110 0101 0110 1100 0101 0000 prompt:     .asciz  "Please enter a positive numb
0040  0110 0101 0010 0000 0110 0101 0111 0011 
0044  0111 0010 0110 0101 0111 0100 0110 1110 
0048  0111 0000 0010 0000 0110 0001 0010 0000 
004c  0111 0100 0110 1001 0111 0011 0110 1111 
0050  0010 0000 0110 0101 0111 0110 0110 1001 
0054  0110 0010 0110 1101 0111 0101 0110 1110 
0058  0010 0000 0011 1010 0111 0010 0110 0101 
005c  0000 0000 0000 0000 0000 0000 0000 0000 

0060  0000 0000 0000 0000 0000 0000 0110 0100 atotal:     .word   total
0064  0110 0001 0111 0100 0110 1111 0101 0100 total:      .asciz "Total: "
0068  0000 0000 0010 0000 0011 1010 0110 1100 
======================================================= Output
Please enter a positive number: 10
Total: 55
=========================================== Program statistics
Input file name       = c03q04.a
Instructions executed = 40 (decimal)
Program size          = 6c (hex) 108 (decimal)
Load point            = 0 (hex) 0 (decimal)
Programmer            = Zach Mascetta
