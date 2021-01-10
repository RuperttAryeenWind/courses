// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(LOOP)
  // Fetch keyboard field
  @KBD 
  D=M

  @IS_PRESSED
  D;JGT
  @NOT_PRESSED
  D;JEQ

// Function to execute when pressed
(IS_PRESSED)
  @R0
  M=-1

  // Continue to fill routine
  @FILL
  0;JMP

// Function to execute when not pressed
(NOT_PRESSED)
  @R0
  M=0

  // Continue to fill routine
  @FILL
  0;JMP
  
(FILL)
  @R0
  D=M

  // Fetch and store screen location
  @SCREEN
  D=A

  @LOCATION
  M=D

(FLIP)
  // Find target value to set pixel to
  @R0
  D=M

  // Flip the pixel to target
  @LOCATION
  A=M
  M=D

  //Increment pixel
  @LOCATION
  D=M+1
  @KBD
  D=A-D

  // Return to outer loop
  @LOOP
  D;JEQ

  //Increment pixel
  @LOCATION
  M=M+1
  A=M

  // Continue flipping pixels
  @FLIP
  0;JMP