         STRO    msgEnter,d
while:   CHARI   char,d
         LDBYTEA char,d
         CPA     'a',i       ; if char == 'a'
         BREQ    isA
         CPA     '\n',i      ; tant que char != enter
         BREQ    fin
         BR      while

isA:     LDA     cpt,d       ; incrementer le compteur
         ADDA    1,i
         STA     cpt,d
         BR      while

fin:     STRO    msgFin,d
         DECO    cpt,d
         STOP

char:    .BLOCK  1
cpt:     .BLOCK  2 ; initialise a 0 par defaut
msgEnter:.ASCII  "Entrez une chaine de caracteres : \x00"
msgFin:  .ASCII  "Nombre de 'a' dans la chaine entree : \x00"
         .END