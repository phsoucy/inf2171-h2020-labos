lire:    DECI    n,d         ; indice dans le tableau tab
         LDX     n,d
         CPX     0,i         ; arrete la saisie si indice < 0 ou >= 10
         BRLT    ecrire
         CPX     10,i        ; <-- TROU 1
         BRGE    ecrire
;                            ; <-- TROU 2
         ASLX                ; indice dans le tableau tab, chaque élément occupe 2 octets
         LDA     tab,x       ; compteur d'occurences
         ADDA    1,i         ; une occurence de plus pour cet indice
         STA     tab,x
         BR      lire
;
ecrire:  LDX     0,i         ; positionnement au début du tableau
loop:    CPX     20,i        ; <-- TROU 3     limite supérieure (10 éléments)
         BRGE    fin         ; (fin du tableau tab)
         DECO    tab,x       ; affichage du nombre d'occurences pour l'indice courant
         CHARO   ' ',i
         ADDX    2,i         ; indice suivant
         BR      loop
fin:     STOP
;
n:       .BLOCK  2           ; valeur lue
tab:     .BLOCK  20          ; ; <-- TROU 4   #2d10a  (10 éléments de 2 octets)
         .END 
