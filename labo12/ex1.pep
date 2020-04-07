;Ex1 Lab12 
;Philippe Soucy

         CALL    enterNbr
         STOP

;
; ****** enterNbr
nbrEntre:.EQUATE 0           ; #2d
result:  .EQUATE 2           ; #2d
;
enterNbr:SUBSP   4,i         ; #result #nbrEntre
         DECI    nbrEntre,s
         CALL    fib
         STA     result,s
         DECO    result,s
         
         RET4                ; #result #nbrEntre

;
; ****** fib
; IN:    nbr=nombre de depart
; OUT:   A=nombre suivant
j:       .EQUATE 0           ; #2d
nbrPrec: .EQUATE 2           ; #2d
i:       .EQUATE 6           ; #2d
;
fib:     SUBSP   4,i         ; #nbrPrec #j 
         LDA     i,s
         CPA     2,i
         BRLT    returnI

         SUBA    1,i
         STA     j,s
         CALL    fib
         STA     nbrPrec,s 

         LDA     i,s
         SUBA    2,i
         STA     j,s
         CALL    fib
         ADDA    nbrPrec,s

returnI: RET4                ; #nbrPrec #j

.END