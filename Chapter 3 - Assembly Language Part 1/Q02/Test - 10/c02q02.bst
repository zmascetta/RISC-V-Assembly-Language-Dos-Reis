rv Version 3.5                        Fri Oct  3 16:04:49 2025
Zach Mascetta

Header
R
A 00000020
A 00000040
C

Loc         Instruction in Binary                   Source Code

                                              # t0 = number
                                              # t1 = name
                                              # t2 = prompt

0000  0000 0100 0000 0001 1010 0011 0000 0011         lw t1, aname        # load name
0004  0000 0010 0000 0001 1010 0011 1000 0011         lw t2, aprompt      # load prompt
0008  0000 1100 0000 0011 1000 0000 0000 0000         sout t2             # prompt user for num
000c  0000 1110 0000 0000 0000 0010 1000 0000         din t0              # get number

0010  0000 1100 0000 0011 0000 0000 0000 0000 loop:   sout t1             # print name
0014  1111 1111 1111 0010 1000 0010 1001 0011         addi t0, t0, -1     # decrement counter
0018  1111 1110 0101 0000 0001 1100 1110 0011         bne x0, t0, loop    # compare, brach if c
001c  0000 0000 0000 0000 0000 0000 0000 0000         halt                # end program

0020  0000 0000 0000 0000 0000 0000 0010 0100 aprompt:    .word prompt
0024  0110 0101 0111 0100 0110 1110 0100 0101 prompt:     .asciz "Enter a positive number: "
0028  0010 0000 0110 0001 0010 0000 0111 0010 
002c  0110 1001 0111 0011 0110 1111 0111 0000 
0030  0110 0101 0111 0110 0110 1001 0111 0100 
0034  0110 1101 0111 0101 0110 1110 0010 0000 
0038  0011 1010 0111 0010 0110 0101 0110 0010 
003c  0000 0000 0000 0000 0000 0000 0010 0000 

0040  0000 0000 0000 0000 0000 0000 0100 0100 aname:      .word name     
0044  0110 1000 0110 0011 0110 0001 0101 1010 name:       .asciz "Zach Mascetta\n"
0048  0111 0011 0110 0001 0100 1101 0010 0000 
004c  0111 0100 0111 0100 0110 0101 0110 0011 
0050  0000 0000 0000 0000 0000 1010 0110 0001 
======================================================= Output
Enter a positive number: 10
Zach Mascetta
Zach Mascetta
Zach Mascetta
Zach Mascetta
Zach Mascetta
Zach Mascetta
Zach Mascetta
Zach Mascetta
Zach Mascetta
Zach Mascetta

=========================================== Program statistics
Input file name       = c02q02.a
Instructions executed = 35 (decimal)
Program size          = 54 (hex) 84 (decimal)
Load point            = 0 (hex) 0 (decimal)
Programmer            = Zach Mascetta
