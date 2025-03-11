/*
INF1600 - TP3 - Visualisation de la serie de Mandelbrot
Matricules: 2348245, 2371915
Date: 16 mars 2025
Version: 1.0
Description: Implémentation de la surcharge de l'opérateur d'addition à deux paramètres en assembleur de la classe Complex


*/

/* Attention, ici il faudra utiliser les opérateurs surchargés : _ZNK7Complex8realPartEv et _ZNK7Complex8imagPartEv 
ainsi que l'instruction faddp (pour additionner 2 nombres de la pile flottante et met le résultat sur le dessus de la pile.
Ex : ADDP ST(1), ST(0) → Additionne ST(1) = ST(1) + ST(0))
et l'instruction fstps pour dépile la dernière valeur de la pile flottante et mets la valeur dans l'adresse indiquée

L'opérateur plus doit appeler un constructeur pour créer le nombre complexe résultat de l'addition (retour de la fonction)
*/


.data

.text
.globl _ZplRK7ComplexS1_            # mangling vous est fourni

_ZplRK7ComplexS1_:                  
     # Prologue : Sauvegarder EBP et sauvegarder %ebx et %edi sur la pile
    push    %ebp                    
    movl    %esp, %ebp               # Initialisation de la pile de la fonction
    push    %ebx                     # Sauvegarder %ebx (callee-saved)
    push    %edi                     # Sauvegarder %edi (callee-saved)

    # Addition
    push 12(%ebp)
    call _ZNK7Complex8imagPartEv
    add $4, %esp

    push 16(%ebp)
    call _ZNK7Complex8imagPartEv
    add $4, %esp

    faddp
    subl $4, %esp
    fstps (%esp)
    
    push 12(%ebp)
    call _ZNK7Complex8realPartEv
    add $4, %esp

    push 16(%ebp)
    call _ZNK7Complex8realPartEv
    add $4, %esp

    faddp

    subl $4, %esp
    fstps (%esp)

    push 8(%ebp)
    call _ZN7ComplexC1Eff

    addl $12, %esp

     # Épilogue : Restaurer les registres et revenir
    popl    %edi                     # Restaurer %edi
    popl    %ebx                     # Restaurer %ebx
    leave                            # Restaurer %ebp et %esp
    ret