rv Version 3.5                        Sat Oct  4 13:51:58 2025
Zach Mascetta

Header
R
A 00000034
A 00000048
A 00000050
C

Loc         Instruction in Binary                   Source Code
                                              # Write and run an assembly language program that

                                              # t0 = current num
                                              # t1 = 127
                                              # t2 = header string
                                              # t3 = spacer
                                              # t4 = header
                                              # t5 = newline

0000  0000 0010 0000 0000 0000 0010 1001 0011         addi t0, x0, 32     # init current num. w
0004  0000 0111 1111 0000 0000 0011 0001 0011         addi t1, x0, 127    # init 127
0008  0000 0100 1000 0001 1010 1110 0000 0011         lw t3, aspacer      # load spacer
000c  0000 0011 0100 0001 1010 1110 1000 0011         lw t4, aheader      # load header
0010  0000 0101 0000 0001 1010 1111 0000 0011         lw t5, anewline     # load newline
0014  0000 1100 0000 1110 1000 0000 0000 0000         sout t4             # print header

0018  0000 0100 0000 0010 1000 0000 0000 0000 loop:   dout t0             # print decimal numbe
001c  0000 1100 0000 1110 0000 0000 0000 0000         sout t3             # print spacer
0020  0000 1010 0000 0010 1000 0000 0000 0000         aout t0             # print ASCII
0024  0000 1100 0000 1111 0000 0000 0000 0000         sout t5             # print newline
0028  0000 0000 0001 0010 1000 0010 1001 0011         addi t0, t0, 1      # increment current n
002c  1111 1110 0110 0010 1001 0110 1110 0011         bne t0, t1, loop    # loop

0030  0000 0000 0000 0000 0000 0000 0000 0000         halt                # end program



0034  0000 0000 0000 0000 0000 0000 0011 1000 aheader:       .word    header
0038  0110 1001 0110 0011 0110 0101 0100 0100 header:        .asciz   "Decimal\t\tASCII\n"
003c  0000 1001 0110 1100 0110 0001 0110 1101 
0040  0100 0011 0101 0011 0100 0001 0000 1001 
0044  0000 0000 0000 1010 0100 1001 0100 1001 

0048  0000 0000 0000 0000 0000 0000 0100 1100 aspacer:        .word   spacer
004c  0000 0000 0000 0000 0000 1001 0000 1001 spacer:         .asciz  "\t\t"

0050  0000 0000 0000 0000 0000 0000 0101 0100 anewline:       .word   newline
0054  0000 0000 0000 0000 0000 0000 0000 1010 newline:        .asciz  "\n"
======================================================= Output
Decimal		ASCII
32		 
33		!
34		"
35		#
36		$
37		%
38		&
39		'
40		(
41		)
42		*
43		+
44		,
45		-
46		.
47		/
48		0
49		1
50		2
51		3
52		4
53		5
54		6
55		7
56		8
57		9
58		:
59		;
60		<
61		=
62		>
63		?
64		@
65		A
66		B
67		C
68		D
69		E
70		F
71		G
72		H
73		I
74		J
75		K
76		L
77		M
78		N
79		O
80		P
81		Q
82		R
83		S
84		T
85		U
86		V
87		W
88		X
89		Y
90		Z
91		[
92		\
93		]
94		^
95		_
96		`
97		a
98		b
99		c
100		d
101		e
102		f
103		g
104		h
105		i
106		j
107		k
108		l
109		m
110		n
111		o
112		p
113		q
114		r
115		s
116		t
117		u
118		v
119		w
120		x
121		y
122		z
123		{
124		|
125		}
126		~

=========================================== Program statistics
Input file name       = c03q05.a
Instructions executed = 577 (decimal)
Program size          = 58 (hex) 88 (decimal)
Load point            = 0 (hex) 0 (decimal)
Programmer            = Zach Mascetta
