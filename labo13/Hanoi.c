#include<stdio.h>

void deplacer (int n, char t1, char t2, char t3) {

	if ( n == 0) {
		return;
	}

	if ( n == 1 ) {
		printf("%c à %c\n", t1, t2) ;
	}
		
	else {
		deplacer (n-1, t1, t3, t2) ;
		deplacer ( 1 , t1, t2, t3) ;
		deplacer (n-1, t3, t2, t1) ;
	}
}

int main () {

	for (int i = 0; i <= 3; i++){
		printf("\nAppel %d: deplacerTour(%d, A, C, B)\n",i+1,i);
		deplacer (i, 'A', 'C', 'B');
	}
	return 0;
}

