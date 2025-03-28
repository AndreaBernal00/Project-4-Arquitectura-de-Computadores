// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.

// Fill.asm - Llena la pantalla dependiendo del estado del teclado
// Fill.asm - Versión corregida basada en Fill.vm funcional
// Lógica:
// 1. Verificar estado del teclado (KBD)
// 2. Si tecla presionada (valor ≠ 0), llenar pantalla de negro (-1)
// 3. Si no hay tecla presionada, llenar pantalla de blanco (0)
// 4. Repetir infinitamente

(LOOP)
    @KBD                // Dirección 24576 (teclado)
    D=M                 // Leer valor del teclado
    @FILL_BLACK
    D;JNE               // Si KBD ≠ 0, ir a FILL_BLACK
    @FILL_WHITE
    0;JMP               // Si KBD == 0, ir a FILL_WHITE

(FILL_BLACK)
    @SCREEN             // Dirección 16384 (pantalla)
    D=A
    @current            // Variable para posición actual
    M=D                 // current = SCREEN

(BLACK_LOOP)
    @current            // Cargar posición actual
    A=M                 // Acceder a la dirección
    M=-1                // Escribir -1 (todos los píxeles negros)
    
    @current            // Incrementar posición
    M=M+1
    
    @current            // Verificar si llegamos al final
    D=M
    @KBD                // KBD está justo después de la pantalla
    D=D-A
    @BLACK_LOOP
    D;JLT               // Si current < KBD, continuar
    
    @LOOP
    0;JMP               // Volver a verificar teclado

(FILL_WHITE)
    @SCREEN             // Dirección 16384 (pantalla)
    D=A
    @current            // Variable para posición actual
    M=D                 // current = SCREEN

(WHITE_LOOP)
    @current            // Cargar posición actual
    A=M                 // Acceder a la dirección
    M=0                 // Escribir 0 (todos los píxeles blancos)
    
    @current            // Incrementar posición
    M=M+1
    
    @current            // Verificar si llegamos al final
    D=M
    @KBD                // KBD está justo después de la pantalla
    D=D-A
    @WHITE_LOOP
    D;JLT               // Si current < KBD, continuar
    
    @LOOP
    0;JMP               // Volver a verificar teclado