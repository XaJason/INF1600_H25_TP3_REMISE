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
start:
    # prologue
    push    %ebp
    movl    %esp, %ebp

    pushl %ebx
    pushl %edi
    pushl %esi

    movl 16(%ebp), %ebx

    # cas de base 1
    push 8(%ebp)
    call _ZNK7Complex7modulusEv
    fisttpl (%esp)
    movl (%esp), %eax
    add $4, %esp
    cmpl escapeRadiusInt, %eax
    jae finCasBase

    # cas de base 2
    cmpl maxIterations, %ebx
    jae finCasBase

    # cas recursif
    incl %ebx

    subl $4, %esp
    movl %esp, %edi
    push 8(%ebp)
    push 8(%ebp)
    push %edi
    call _ZmlRK7ComplexS1_
    add $12, %esp

    subl $4, %esp
    movl %esp, %esi
    push 12(%ebp)
    pushl %edi
    pushl %esi
    call _ZplRK7ComplexS1_
    add $12, %esp

    pushl %ebx
    push 12(%ebp)
    push %esi
    call _Z13mandelbrotSetRK7ComplexS1_i
    add $12, %esp
    jmp fin

    finCasBase:
    movl %ebx, %eax

    fin:
    popl %esi
    popl %edi
    popl %ebx

    # epilogue
    leave
    ret