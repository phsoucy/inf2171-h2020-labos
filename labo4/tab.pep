         LDX     0,i
ecriture:DECI    tab,x
         ADDX    2,i
         CPX     sizeTab,d
         BREQ    lecture
         BR      ecriture

lecture: LDX     0,i
lecFor:  DECO    tab,x
         ADDX    2,i
         CPX     sizeTab,d
         BREQ    fin
         BR      lecFor

fin:     STOP

tab:     .BLOCK  10
sizeTab: .WORD   10

         .END