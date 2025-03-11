/*
INF1600 - TP3 - Visualisation de la serie de Mandelbrot
Matricules: 2348245, 2371915
Date: 16 mars 2025
Version: 1.0
Description: Implémentation du calcul du module en assembleur de la classe Complex

/* Attention, ici il faudra utiliser les instructions
l'instruction faddp, fmulp et fsqrt (pour faire dea opérations sur
2 nombres de la pile flottante et met le résultat sur le dessus de la pile.
Ex : fmulp ST(1), ST(0) → multiplie ST(1) = ST(1) * ST(0))
*/ 

.data

.text
.globl _ZNK7Complex7modulusEv

_ZNK7Complex7modulusEv:
    # prologue
    push    %ebp
    movl    %esp, %ebp

    # TODO

    # epilogue
    leave
    ret
