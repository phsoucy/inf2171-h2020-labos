## Table des matières

1. [Quelle est la différence entre les modes d'adressage sur la pile?](#1)
2. [Comment utiliser l'instruction RETn?](#2)
3. [Comment je fais pour adresser les différentes variables dans la pile?](#3)

## Questions

### 1. Quelle est la différence entre les modes d'adressage sur la pile? <a name="1"></a>

Pour pouvoir faire la différence entre chacun des modes d'adressage sur la pile, je vous invite à consulter l'[aide-mémoire PEP8](http://info.uqam.ca/~privat/INF2170/aide-pep8.pdf) fourni durant l'intra.

Ainsi, on retrouve les 4 modes d'adressage suivants :

- `s`, accède à la valeur indiquée à l'adresse "pointeur de pile + spécificateur d'opérande" (similaire à `d`).
- `sf`, accède à la valeur indiquée par l'adresse retrouvée à l'adresse "pointeur de pile + spécificateur d'opérande" (un pointeur sur la pile, similaire à `n`).
- `sx`, accède à la valeur indiquée à l'adresse "pointeur de pile + spécificateur d'opérande + registre X" (un tableau sur la pile, similaire à `x`).
- `sxf`, accède à la valeur indiquée par l'adresse retrouvée à l'adresse "pointeur de pile + spécificateur d'opérande" et accède ensuite à cette adresse + la valeur du registre X (un pointeur vers un tableau sur la pile).

NB. : Le pointeur de pile (PP) correspond à l'adresse de la valeur sur le dessus de la pile. La pile part du "bas" de la mémoire, vers le "haut", ainsi, plus on "descend" dans la pile, plus on incrémente l'adresse de la pile (plus la valeur a été empilée plus tôt dans l'exécution du programme). De cette façon, si on veut accéder à la valeur précédente de la pile et que la dernière valeur empilée est de 2 octets, l'on doit faire "PP + 2" pour obtenir l'adresse de cette valeur.
Le spécificateur d'opérande (Spec) est la valeur que vous indiquée dans une ligne d'instruction. Exemple : `LDA Spec,d`

### 2. Comment utiliser l'instruction `RETn`? <a name="2"></a>

Lorsqu'on appel un sous-programme, la valeur de retour (l'adresse suivant l'instruction `CALL`) est stockée sur la pile. Ainsi, si vous stockez d'autres variables sur la pile durant l’exécution du sous-programmes, vous devez vous assurez de les dépilées avant de retourner. L'instruction `RET0`, par exemple, "branche" à l'adresse indiquée par la dernière valeur empilée sur la pile (met cette valeur dans le compteur ordinal). C'est pourquoi il faut s'assurer que la bonne valeur, l'adresse de retour (un pointeur), soit déjà sur le dessus de la pile. Si vous avez empilé deux variables de deux octets sur la pile durant l'exécution du sous-programme, vous avez deux options pour les dépiler :
- Utiliser `RET4` qui ajoute 4 au pointeur de pile (dépile 4 octets) et branche à l'adresse indiquée par la nouvelle adresse du pointeur de pile.
- Utiliser `ADDSP 4,i` qui ajoute 4 au pointeur de pile (dépile vos deux variables) et ensuite `RET0` qui branche à l'adresse indiquée par la nouvelle adresse du pointeur de pile.

Ces deux options sont équivalentes et vous devez utiliser la deuxième option lorsque vous avez stocker plus de 7 octets dans la pile lors de l'exécution de votre sous-programme. Attention, les valeurs empilées sur la pile ne sont pas nécessairement des paramètres, cela peut aussi être de simple variables locales.

### 3. Comment je fais pour adresser les différentes variables dans la pile? <a name="3"></a>

Un truc pour bien avoir accès à tes traces c'est de déclarer des constantes et de décrémenter ton pointeur de pile tout d'un coup en faisant `SUBSP 8,i     ; #n #a #c #b`

Tes constantes seraient définis de la manière suivante :
```pep8
b:   .EQUATE   0   ; #2c
c:   .EQUATE   2   ; #2c
a:   .EQUATE   4   ; #2c
n:   .EQUATE   6   ; #2d
```

Tu peux ensuite les adresser directement (après avoir fait `SUBSP 8,i`) avec les instructions suivantes par exemple :
```pep8
LDA   n,s   ; pour charger 'n' dans le registre A
STA   a,s   ; pour enregistrer une autre valeur dans 'a'
```

Pour plus d'exemples, je t'invites à consulter [ce programme](labo12/ex1.pep) et le reste de mon Github.
