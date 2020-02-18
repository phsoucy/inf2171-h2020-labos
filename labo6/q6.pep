         LDA     0,i
m:       CHARI   c,d
         LDBYTEA c,d
x:       CPA     '\n',i
         BREQ    e
         CPA     '_',i
         BREQ    u
o:       CHARO   c,d
         BR      m
u:       CHARI   c,d
         LDBYTEA c,d
         CPA     'a',i
         BRLT    s
         CPA     'z',i
         BRGT    s
         SUBA    'a',i
         ADDA    'A',i
         STBYTEA c,d
         BR      o
s:       CHARO   '_',i
         BR      x
e:       STOP
c:       .BLOCK  1
         .END