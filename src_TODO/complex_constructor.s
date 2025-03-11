/*
INF1600 - TP3 - Visualisation de la serie de Mandelbrot
Matricules: 2348245, 2371915
Date: 16 mars 2025
Version: 1.0
Description: Implémentation du constructeur en assembleur de la classe Complex
*** Attention, c'est une methode, donc le parametre this est implicite:
*/

.data

.text

.globl _ZN7ComplexC1Eff

_ZN7ComplexC1Eff:
    # prologue
    push    %ebp
    movl    %esp, %ebp

    movl 8(%ebp), %eax
    movl 12(%ebp), %ecx
    movl 16(%ebp), %edx
    movl %ecx, (%eax)
    movl %edx, 4(%eax)

    #epilogue                   
    leave
    ret