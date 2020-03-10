; exemple de division par 2 avec ASRA (Resultat dans 'res' et restant dans carry)
         
         LDA     3,i
         ASRA    
         STA     res,d
         DECO    res,d

         STOP

res:     .WORD   0

         .END
