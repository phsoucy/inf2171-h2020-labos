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

         LDA     0,i
         LDA     b,d
         NEGA
         ADDA    a,d
         STA     x,d
         CHARO   'x',i
         STRO    egale,d
         DECO    x,d
         CHARO   '\n',i

         LDA     0,i
         LDA     c,d
         ADDA    d,d
         NEGA
         ADDA    a,d
         ADDA    b,d
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