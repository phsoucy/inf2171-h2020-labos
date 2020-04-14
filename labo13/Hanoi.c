#include<stdio.h>

void deplacer (int n, char t1, char t2, char t3)
{
if ( n == 1 )
printf("De la tour %c à la tour %c\n", t1, t2) ;
else
{ deplacer (n-1, t1, t3, t2) ;
deplacer ( 1 , t1, t2, t3) ;
deplacer (n-1, t3, t2, t1) ;
}
}

int main () {
	int n = 3;
	deplacer (n, 'A', 'C', 'B');
	return 0;
}

