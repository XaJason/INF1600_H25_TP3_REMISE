/*
INF1600 - TP3 - Visualisation de la serie de Mandelbrot
Matricules: 2348245, 2371915
Date: 16 mars 2025
Version: 1.0
Description:



/* Attention, ici il faudra utiliser les opérateurs surchargés : _ZNK7Complex8realPartEv et _ZNK7Complex8imagPartEv 
ainsi que l'instruction faddp (pour multiplier 2 nombres de la pile flottante et met le résultat sur le dessus de la pile.
Ex : fmulp ST(1), ST(0) → multiplie ST(1) = ST(1) * ST(0))
l'instruction fsubrp et l'instructions  faddp  pour soustraire et additionner
et l'instruction fstps pour dépile la dernière valeur de la pile flottante et mets la valeur dans l'adresse indiquée

L'opérateur plus doit appeler un constructeur pour créer le nombre complexe résultat de l'addition (retour de la fonction)
*/

.data

.text
.globl _ZmlRK7ComplexS1_            # mangling vous est fourni

_ZmlRK7ComplexS1_  :
    # Prologue : Sauvegarder EBP et sauvegarder %ebx et %edi sur la pile
    push    %ebp                    
    movl    %esp, %ebp               # Initialisation de la pile de la fonction
    push    %ebx                     # Sauvegarder %ebx (callee-saved)
    push    %edi                     # Sauvegarder %edi (callee-saved)

    # Left Part
    push 12(%ebp)
    call _ZNK7Complex8realPartEv
    add $4, %esp

    push 16(%ebp)
    call _ZNK7Complex8realPartEv
    add $4, %esp

    fmulp

    push 12(%ebp)
    call _ZNK7Complex8imagPartEv
    add $4, %esp

    push 16(%ebp)
    call _ZNK7Complex8imagPartEv
    add $4, %esp

    fmulp

    fsubrp


    push 12(%ebp)
    call _ZNK7Complex8realPartEv
    add $4, %esp

    push 16(%ebp)
    call _ZNK7Complex8imagPartEv
    add $4, %esp

    fmulp

    push 12(%ebp)
    call _ZNK7Complex8imagPartEv
    add $4, %esp

    push 16(%ebp)
    call _ZNK7Complex8realPartEv
    add $4, %esp

    fmulp

    faddp


    subl $4, %esp
    fstps (%esp)

    subl $4, %esp
    fstps (%esp)

    push 8(%ebp)
    call _ZN7ComplexC1Eff

    addl $12, %esp



    # epilogue
    popl    %edi                     # Restaurer %edi
    popl    %ebx                     # Restaurer %ebx
    leave
    ret
