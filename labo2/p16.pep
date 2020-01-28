         STRO    msgIn,d
         CHARO   'a',i
         STRO    egale,d
         DECI    a,d

         STRO    msgIn,d
         CHARO   'b',i
         STRO    egale,d
         DECI    b,d

         STRO    msgIn,d
         CHARO   'c',i
         STRO    egale,d
         DECI    c,d

         STRO    msgIn,d
         CHARO   'd',i
         STRO    egale,d
         DECI    d,d

         LDA     a,d
         ADDA    b,d
         SUBA    c,d
         SUBA    d,d
         STA     y,d

         CHARO   'y',i
         STRO    egale,d
         DECO    y,d         

         STOP

a:       .WORD   0
b:       .WORD   0
c:       .WORD   0
d:       .WORD   0
x:       .WORD   0
y:       .WORD   0
entree:  .BLOCK  1
msgIn:   .ASCII  "Entrer le nombre \x00"
egale:   .ASCII  " = \x00"

         .END