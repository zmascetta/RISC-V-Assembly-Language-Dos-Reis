rv Version 3.5                        Tue Oct 28 17:45:49 2025
Zach Mascetta

Header
R
A 00000098
A 000000b4
A 000000d0
A 000000ec
C

Loc         Instruction in Binary                   Source Code
                                              # Write and run an assembly language program that
                                              # It should then call subroutine 1, passing it th
                                              # Subroutine 1 should display the string whose ad
                                              # and then call subroutine 2, passing it the addr
                                              # Subroutine 2 should then display the string who
                                              # Test your program with "Aa1Bb2Cc3{+".

                                              #   a0 = buffer
                                              #   t0 = character from buffer
                                              #   t1 = lower bound for character check
                                              #   t2 = upper bound for character check
                                              #   t3 = 10 check for newline 
                                              #   t4 = prompt
                                              #   t5 = label

0000  0000 0100 0001 0000 0000 0011 0001 0011                 addi t1, x0, 65                 #
0004  0000 0101 1011 0000 0000 0011 1001 0011                 addi t2, x0, 91                 #
0008  0000 0000 1010 0000 0000 1110 0001 0011                 addi t3, x0, 10                 #
000c  0000 1001 1000 0001 1010 1110 1000 0011                 lw t4, aprompt                  #
0010  0000 1100 0000 1110 1000 0000 0000 0000                 sout t4                         #
0014  0000 1110 1100 0001 1010 0101 0000 0011                 lw a0, abuffer                  #
0018  0001 0100 0000 0101 0000 0000 0000 0000                 sin a0                          #

001c  0000 0000 0000 0101 0000 0010 1000 0011                 lb t0, 0(a0)                    #
0020  0000 0011 1000 0000 0000 0000 1110 1111                 jal ra, subroutine_1            #
0024  0000 1110 1100 0001 1010 0101 0000 0011                 lw a0, abuffer                  #
0028  0000 1011 0100 0001 1010 1111 0000 0011                 lw t5, asr1_label               #
002c  0000 1100 0000 1111 0000 0000 0000 0000                 sout t5                         #
0030  0000 1100 0000 0101 0000 0000 0000 0000                 sout a0                         #

0034  0000 0000 0000 0101 0000 0010 1000 0011                 lb t0, 0(a0)                    #
0038  0000 0110 0001 0000 0000 0011 0001 0011                 addi t1, x0, 97                 #
003c  0000 0111 1010 0000 0000 0011 1001 0011                 addi t2, x0, 122                #
0040  0000 0011 1000 0000 0000 0000 1110 1111                 jal ra, subroutine_2            #
0044  0000 1110 1100 0001 1010 0101 0000 0011                 lw a0, abuffer                  #
0048  0000 1101 0000 0001 1010 1111 0000 0011                 lw t5, asr2_label               #
004c  0000 1100 0000 1111 0000 0000 0000 0000                 sout t5                         #
0050  0000 1100 0000 0101 0000 0000 0000 0000                 sout a0                         #

0054  0000 0000 0000 0000 0000 0000 0000 0000                 halt                            #

0058  0000 0000 0110 0010 1100 1000 0110 0011 subroutine_1:   blt t0, t1, 16(subroutine_1)    #
005c  0000 0000 0111 0010 1101 0110 0110 0011                 bge t0, t2, 16(subroutine_1)    #
0060  0000 0010 0000 0010 1110 0010 1001 0011                 ori t0, t0, 0x20                #
0064  0000 0000 0101 0101 0000 0000 0010 0011                 sb t0, 0(a0)                    #
0068  0000 0000 0001 0101 0000 0101 0001 0011                 addi a0, a0, 1                  #
006c  0000 0000 0000 0101 0000 0010 1000 0011                 lb t0, 0(a0)                    #
0070  1111 1111 1100 0010 1001 0100 1110 0011                 bne t0, t3, 0(subroutine_1)     #
0074  0000 0000 0000 0000 1000 0000 0110 0111                 jalr x0, 0(ra)                  #

0078  0000 0000 0110 0010 1100 1000 0110 0011 subroutine_2:   blt t0, t1, 16(subroutine_2)    #
007c  0000 0000 0111 0010 1101 0110 0110 0011                 bge t0, t2, 16(subroutine_2)    #
0080  0000 1101 1111 0010 1111 0010 1001 0011                 andi t0, t0, 0xdf               #
0084  0000 0000 0101 0101 0000 0000 0010 0011                 sb t0, 0(a0)                    #
0088  0000 0000 0001 0101 0000 0101 0001 0011                 addi a0, a0, 1                  #
008c  0000 0000 0000 0101 0000 0010 1000 0011                 lb t0, 0(a0)                    #
0090  1111 1111 1100 0010 1001 0100 1110 0011                 bne t0, t3, 0(subroutine_2)     #
0094  0000 0000 0000 0000 1000 0000 0110 0111                 jalr x0, 0(ra)                  #


0098  0000 0000 0000 0000 0000 0000 1001 1100 aprompt:        .word   prompt
009c  0110 0001 0110 0101 0110 1100 0101 0000 prompt:         .asciz  "Please enter a string: "
00a0  0110 0101 0010 0000 0110 0101 0111 0011 
00a4  0111 0010 0110 0101 0111 0100 0110 1110 
00a8  0111 0011 0010 0000 0110 0001 0010 0000 
00ac  0110 1110 0110 1001 0111 0010 0111 0100 
00b0  0000 0000 0010 0000 0011 1010 0110 0111 

00b4  0000 0000 0000 0000 0000 0000 1011 1000 asr1_label:     .word   sr1_label
00b8  0110 1001 0111 0010 0111 0100 0101 0011 sr1_label:      .asciz  "String (subroutine_1): "
00bc  0010 1000 0010 0000 0110 0111 0110 1110 
00c0  0111 0010 0110 0010 0111 0101 0111 0011 
00c4  0110 1001 0111 0100 0111 0101 0110 1111 
00c8  0011 0001 0101 1111 0110 0101 0110 1110 
00cc  0000 0000 0010 0000 0011 1010 0010 1001 

00d0  0000 0000 0000 0000 0000 0000 1101 0100 asr2_label:     .word   sr2_label
00d4  0110 1001 0111 0010 0111 0100 0101 0011 sr2_label:      .asciz  "String (subroutine_2): "
00d8  0010 1000 0010 0000 0110 0111 0110 1110 
00dc  0111 0010 0110 0010 0111 0101 0111 0011 
00e0  0110 1001 0111 0100 0111 0101 0110 1111 
00e4  0011 0010 0101 1111 0110 0101 0110 1110 
00e8  0000 0000 0010 0000 0011 1010 0010 1001 

00ec  0000 0000 0000 0000 0000 0000 1111 0000 abuffer:        .word   buffer
00f0  0000 0000 0000 0000 0000 0000 0000 0000 buffer:         .zero   100
0150  0000 0000 0000 0000 0000 0000 0000 0000 
======================================================= Output
addi>>>
   0:                 addi t1, x0, 65                 # set lower bound for comparison to check for uppercase
     <t1 = 0/41>
addi>>>
   4:                 addi t2, x0, 91                 # set upper bound for comparison to check for uppercase
     <t2 = 0/5b>
addi>>>
   8:                 addi t3, x0, 10                 # set value to check if end of string
     <t3 = 0/a>
lw>>>
   c:                 lw t4, aprompt                  # load prompt
     <t4 = 0/9c>
sout>>>
  10:                 sout t4                         # display prompt

Please enter a string: 
lw>>>
  14:                 lw a0, abuffer                  # load buffer for string
     <a0 = 0/f0>
sin>>>
  18:                 sin a0                          # get string

1aA
lb>>>
  1c:                 lb t0, 0(a0)                    # load first character of string
     <t0 = 0/31>
jal>>>
  20:                 jal ra, subroutine_1            # jump to subr_1
     <ra = 0/24>
     <pc = 24/58>
blt>>>
  58: subroutine_1:   blt t0, t1, 16(subroutine_1)    # branch if less than/equal 65 +20
addi>>>
  68:                 addi a0, a0, 1                  # increment address by 1 byte
     <a0 = f0/f1>
lb>>>
  6c:                 lb t0, 0(a0)                    # load new value
     <t0 = 31/61>
bne>>>
  70:                 bne t0, t3, 0(subroutine_1)     # if value not 10 (newline), branch to beginning of subroutine
blt>>>
  58: subroutine_1:   blt t0, t1, 16(subroutine_1)    # branch if less than/equal 65 +20
bge>>>
  5c:                 bge t0, t2, 16(subroutine_1)    # branch if greater than 90 + 16
addi>>>
  68:                 addi a0, a0, 1                  # increment address by 1 byte
     <a0 = f1/f2>
lb>>>
  6c:                 lb t0, 0(a0)                    # load new value
     <t0 = 61/41>
bne>>>
  70:                 bne t0, t3, 0(subroutine_1)     # if value not 10 (newline), branch to beginning of subroutine
blt>>>
  58: subroutine_1:   blt t0, t1, 16(subroutine_1)    # branch if less than/equal 65 +20
bge>>>
  5c:                 bge t0, t2, 16(subroutine_1)    # branch if greater than 90 + 16
ori>>>
  60:                 ori t0, t0, 0x20                # transform to lowercase
     <t0 = 41/61>
sb>>>
  64:                 sb t0, 0(a0)                    # store new value 
     mem[f0] = a416131/a616131
addi>>>
  68:                 addi a0, a0, 1                  # increment address by 1 byte
     <a0 = f2/f3>
lb>>>
  6c:                 lb t0, 0(a0)                    # load new value
     <t0 = 61/a>
bne>>>
  70:                 bne t0, t3, 0(subroutine_1)     # if value not 10 (newline), branch to beginning of subroutine
jalr>>>
  74:                 jalr x0, 0(ra)                  # return to main
     <x0 = 0/0>
     <pc = 78/24>
lw>>>
  24:                 lw a0, abuffer                  # set a0 back to address of first char of string
     <a0 = f3/f0>
lw>>>
  28:                 lw t5, asr1_label               # load label
     <t5 = 0/b8>
sout>>>
  2c:                 sout t5                         # print label

String (subroutine_1): 
sout>>>
  30:                 sout a0                         # print string

1aa

lb>>>
  34:                 lb t0, 0(a0)                    # load first character of string
     <t0 = a/31>
addi>>>
  38:                 addi t1, x0, 97                 # set lower bound for comparison to check for lowercase
     <t1 = 41/61>
addi>>>
  3c:                 addi t2, x0, 122                # set upper bound for comparison to check for lowercase
     <t2 = 5b/7a>
jal>>>
  40:                 jal ra, subroutine_2            # jump to subr_2
     <ra = 24/44>
     <pc = 44/78>
blt>>>
  78: subroutine_2:   blt t0, t1, 16(subroutine_2)    # branch if less than/equal 97, +20
addi>>>
  88:                 addi a0, a0, 1                  # increment address by 1 byte
     <a0 = f0/f1>
lb>>>
  8c:                 lb t0, 0(a0)                    # load new value
     <t0 = 31/61>
bne>>>
  90:                 bne t0, t3, 0(subroutine_2)     # if value not 10 (newline), branch to beginning of subroutine
blt>>>
  78: subroutine_2:   blt t0, t1, 16(subroutine_2)    # branch if less than/equal 97, +20
bge>>>
  7c:                 bge t0, t2, 16(subroutine_2)    # branch if greater than 112, +16
andi>>>
  80:                 andi t0, t0, 0xdf               # transform to uppercase
     <t0 = 61/41>
sb>>>
  84:                 sb t0, 0(a0)                    # store new value 
     mem[f0] = a616131/a614131
addi>>>
  88:                 addi a0, a0, 1                  # increment address by 1 byte
     <a0 = f1/f2>
lb>>>
  8c:                 lb t0, 0(a0)                    # load new value
     <t0 = 41/61>
bne>>>
  90:                 bne t0, t3, 0(subroutine_2)     # if value not 10 (newline), branch to beginning of subroutine
blt>>>
  78: subroutine_2:   blt t0, t1, 16(subroutine_2)    # branch if less than/equal 97, +20
bge>>>
  7c:                 bge t0, t2, 16(subroutine_2)    # branch if greater than 112, +16
andi>>>
  80:                 andi t0, t0, 0xdf               # transform to uppercase
     <t0 = 61/41>
sb>>>
  84:                 sb t0, 0(a0)                    # store new value 
     mem[f0] = a614131/a414131
addi>>>
  88:                 addi a0, a0, 1                  # increment address by 1 byte
     <a0 = f2/f3>
lb>>>
  8c:                 lb t0, 0(a0)                    # load new value
     <t0 = 41/a>
bne>>>
  90:                 bne t0, t3, 0(subroutine_2)     # if value not 10 (newline), branch to beginning of subroutine
jalr>>>
  94:                 jalr x0, 0(ra)                  # return to main
     <x0 = 0/0>
     <pc = 98/44>
lw>>>
  44:                 lw a0, abuffer                  # set a0 back to address of first char of string
     <a0 = f3/f0>
lw>>>
  48:                 lw t5, asr2_label               # load label
     <t5 = b8/d4>
sout>>>
  4c:                 sout t5                         # print label

String (subroutine_2): 
sout>>>
  50:                 sout a0                         # print string

1AA

halt>>>
  54:                 halt                            # end program

=========================================== Program statistics
Input file name       = c03q07.a
Instructions executed = 58 (decimal)
Program size          = 154 (hex) 340 (decimal)
Load point            = 0 (hex) 0 (decimal)
Programmer            = Zach Mascetta
