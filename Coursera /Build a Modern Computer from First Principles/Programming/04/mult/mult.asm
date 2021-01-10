// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
  @R2
  M=0

  // Check if R0 is zero
  @R0
  D=M
  @END
  D;JEQ

  // Check if R1 is zero
  @R1
  D=M
  @END
  D;JEQ

  // Setting counter as R0 + 1
  @R0
  D=M
  @COUNTER 
  M=D+1

(SUM)
  // Exit Condition
  @COUNTER
  D=M-1
  
  // Update counter with new value
  M=D

  @END
  D;JEQ

  // Summation
  // Move partial mutliple to data registry
  @R2
  D=M

  // Add value of R0 to data registry
  @R1
  D=D+M
  
  // Move new value of multi to memory
  @R2
  M=D

  // Continue Looping
  @SUM
  0;JMP

(END)
  @END
  0;JMP
  