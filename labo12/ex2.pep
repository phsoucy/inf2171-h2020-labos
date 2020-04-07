;Ex2 Lab12
;Philippe Soucy

         CALL    enterNbr
         STOP

;
; ****** enterNbr
quotien: .EQUATE 0           ; #2d
dividend:.EQUATE 2           ; #2d
diviseur:.EQUATE 4           ; #2d
;
enterNbr:SUBSP   6,i         ; #diviseur #dividend #quotien 
         STRO    prem,d
         DECI    dividend,s
         STRO    sec,d
         DECI    diviseur,s
         CALL    div
         STRO    result,d
         DECO    quotien,s
         STRO    msgReste,d
         DECO    dividend,s
         RET6                ; #diviseur #dividend #quotien 

prem:    .ASCII  "Entrez le dividende : \x00"
sec:     .ASCII  "\nEntrez le diviseur : \x00"
result:  .ASCII  "\nQuotien : \x00"
msgReste:.ASCII  "\nReste : \x00"

;
; ****** div
; IN:    SP+0=quotien
;        SP+2=reste
;        SP+4=dividende
;        SP+6=diviseur
quot:    .EQUATE 2
divid:   .EQUATE 4
divis:   .EQUATE 6
;
div:     LDA     0,i
         STA     quot,s
while:   LDA     divid,s
         SUBA    divis,s
         BRLT    end
         STA     divid,s
         LDA     quot,s
         ADDA    1,i
         STA     quot,s
         BR      while

end:     RET0

.END