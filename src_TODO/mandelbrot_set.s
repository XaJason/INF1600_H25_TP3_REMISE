/*
INF1600 - TP3 - Visualisation de la serie de Mandelbrot
Matricules: 2348245, 2371915
Date: 16 mars 2025
Version: 1.0
Description: Implémentation en assembleur de la fonction récursive de la série de Mandelbrot

Vous devrez utiliser la fonction 
fisttpl qui prend le registre ST(0) de la pile FPU (valeur le plus récemment chargée) 
et le met à l'emplacement mémoire spécifié.  Puisque vous ne pouvez pas spécifier
directement un registre vous devrez faire comme suit (en utilisant le dessus de la pile)
si vous voulez de mettre dans le registre %eax
fisttpl (%esp)                      
movl    (%esp), %eax

*/

.data

maxIterations: 
.int   100

# Vous avez le choix de considerer la variable escapeRadius comme un float ou un int, dependament de votre implementation
# Les deux variables sont fournies pour vous faciliter la vie
escapeRadiusFloat:  
.float 2.0
escapeRadiusInt:  
.int 2

.text

.globl _Z13mandelbrotSetRK7ComplexS1_i  # mangling vous est fourni

_Z13mandelbrotSetRK7ComplexS1_i:        # mangling vous est fourni
    # prologue
    push    %ebp
    movl    %esp, %ebp

    movl 16(%ebp), %ecx

    # cas de base 1
    flds escapeRadiusFloat
    push 8(%ebp)
    call _ZNK7Complex7modulusEv
    add $4, %esp
    fcomip %st(1), %st
    jae case

    # cas de base 2
    cmpl maxIterations, %ecx
    jae case

    

    # cas recursif
    incl %ecx
    pushl %ecx
    push 12(%ebp)

    push 8(%ebp)
    push 8(%ebp)
    call _ZmlRK7ComplexS1_
    add $8, %esp

    push %eax
    push 12(%ebp)
    call _ZplRK7ComplexS1_
    add $8, %esp

    push %eax
    call _Z13mandelbrotSetRK7ComplexS1_i
    add $12, %esp
    jmp end

    case:
    movl %ecx, %eax
    end:
    # epilogue
    leave
    ret