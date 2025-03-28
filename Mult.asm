// Mult.asm - Multiplicar R0 y R1, guardar resultado en R2
// Asumir R0 >= 0, R1 >= 0, y R0 * R1 < 32768

// Inicializar R2 (resultado) a 0
@0
D=A
@R2
M=D

// Inicializar contador (R3) con R0
@R0
D=M
@R3
M=D

// Verificar si R0 es 0 (si es así, resultado es 0)
@R3
D=M
@END
D;JEQ

// Ciclo de multiplicación
(LOOP)
    // Cargar R1 en D
    @R1
    D=M
    
    // Sumar D a R2 (R0 veces)
    @R2
    M=D+M
    
    // Decrementar contador
    @R3
    M=M-1
    D=M
    
    // Continuar ciclo si contador > 0
    @LOOP
    D;JGT

(END)
    // Ciclo infinito para detener el programa
    @END
    0;JMP