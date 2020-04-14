;x nombre de disques et u nombre de déplacements
;0 disque --> 0 déplacement (cas initial)
;1 disque --> 1 déplacement (cas initial)
;2 disques --> 3 déplacements u2 = 2xu1 + 1
;3 disques --> 7 déplacements u3 = 2xu2 + 1
;4 disques --> 15 déplacements u4 = 2xu3 + 1 = 2x7 + 1 = 15

; Appel 1 (A ,C ,B);
;        Appel 1.1 (A ,C ,B);
;        Appel 1.2 (A ,B ,C);
;        Appel 1.3 (C ,B ,A);
;        Appel 1.4 (A ,C ,B);
; end Appel 1

; Appel 2 (B, C, A);
;        Appel 2.1 (B ,A ,C);
;        Appel 2.2 (B ,C ,A);
;end Appel 2

; Appel 3 (A ,C ,B);
 

main:    LDA     0,i
         SUBSP   6,i ;#TourA3 #TourA2 #TourA1
         MOVSPA
         STA     TourA,d ;#TourA  

         LDA     0,i
         SUBSP   6,i ;#TourB3 #TourB2 #TourB1
         LDA     0,i
         MOVSPA  
         STA     TourB,d 

         LDA     0,i
         SUBSP   6,i ;#TourC3 #TourC2 #TourC1 
         LDA     0,i
         MOVSPA  
         STA     TourC,d 

;         CALL depTour ;(nombre disques = 0); 

         MOVSPA	
         SUBA    TourA,d
         NEGA
         STA     temp,d
         LDX	temp,d
         LDA     1,i
         STA     0,sx

;         CALL depTour ;(nombre disques = 1); 

         MOVSPA	
         SUBA    TourA,d
         NEGA
         STA     temp,d
         LDX	temp,d
         LDA     2,i
         STA     0,sx
         LDA     1,i
         STA     2,sx

;         CALL depTour ;(nombre disques = 2);

         MOVSPA	
         SUBA    TourA,d
         NEGA
         STA     temp,d
         LDX	temp,d
         LDA     3,i
         STA     0,sx
         LDA     2,i
         STA     2,sx
         LDA     1,i
         STA     4,sx

;         CALL depTour ;(nombre disques = 3);


; -----------------------------------------------------------------------  
; Ce que j'avais dit ici pendant la séance pourrai fonctionner avec quelques modifcations 
; mais ne serai pas vraiment considérer comme de la récursivité.
; Essaye plutôt de suivre la logique de Philippe et considérez ce document plus comme un exemple pour l'utilisation de la pile.
; -----------------------------------------------------------------------  

TourA:   .BLOCK 2; #2h

TourA1:  .EQUATE 0; #2d
TourA2:  .EQUATE 2; #2d 
TourA3:  .EQUATE 4; #2d 

TourB:   .BLOCK 2; #2h
      
TourB1:  .EQUATE 0; #2d
TourB2:  .EQUATE 2; #2d 
TourB3:  .EQUATE 4; #2d 

TourC:   .BLOCK 2; #2h 
     
TourC1:  .EQUATE 0; #2d
TourC2:  .EQUATE 2; #2d 
TourC3:  .EQUATE 4; #2d 

nbrdisq: .BLOCK 2; (= 3 2 ou 1)
tigesou: .BLOCK 2; (Par défaut = TourA)
tigedes: .BLOCK 2; (Par défaut = TourC)
tigeint: .BLOCK 2; (Par défaut = TourB)

temp:    .BLOCK 2

valsou:  .BLOCK 1; #1c
valdes:  .BLOCK 1; #1c

le_a:    .ASCII " à \x00"      

StrAp1: .ASCII "Appel 1: deplacerTour(0, A, C, B)\n\x00"
StrAp2: .ASCII "Appel 2: deplacerTour(1, A, C, B)\n\x00"
StrAp3: .ASCII "Appel 3: deplacerTour(2, A, C, B)\n\x00"
StrAp4: .ASCII "Appel 4: deplacerTour(3, A, C, B)\n\x00"


.END