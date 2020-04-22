<![endif]-->

# **I-Récapitulatif de la représentation en IEEE 754**

```

Il s'agit d'une forme d'écriture de valeur qui est formalisée en base 2.

```

<br>

| -  | Signe  | Exposant  | Mantisse  |
| -------------------- | ------------ | ---------------- | ----------------------- |
| **Nombre de bits**  |  1 bit  | 8 bits  | 23 bits  |
| **Exemple:**  | 1  | 10000011  | 00010100000000000000000 |

<hr>

# II- IEEE 754  --> Décimal

| -  | Explication | Exemple: <br> 01000001001001000000000000000000<sub>2</sub> |
| ------- | ----------- | ------- |
| Signe  | Si le bit est `0` le nombre est positif s'il est `1` le nombre est négatif| `0` --> positif |
| Exposant | 1) Convertir les 8 bits de `binaire` à `décimal`. <br> 2) Diminuer les résultats de cette convention par le pôle (127 = x7f) pour obtenir la valeur de l'exposant.| 10000010<sub>2</sub> = 130<sub>10</sub> <br> 130 - 127 = `3`
|Mantisse |Prendre la chaîne binaire de la mantisse de gauche à droite, celle-ci est la partie décimale du nombre en question _(à laquelle il faudra ajouter 1 pour compléter le nombre)_.| 01001000000000000000000 --> _(1)_.01001 |
| Résultat | | + 1.01001 x 2<sup>3</sup><sub>2</sub> = 1010.01<sub>2</sub> : <br> **.** 1010<sub>2</sub> = (1x2<sup>1</sup> + 1x2<sup>3</sup>)<sub>10</sub> = (2 + 8)<sub>10</sub>  = 10<sub>10</sub> <br> **.** 0.01<sub>2</sub> = (1x2<sup>-2</sup>)<sub>10</sub> = (1/2<sup>2</sup>)<sub>10</sub> = (1/4)<sub>10</sub> = 0.25<sub>10</sub> <br> **.** +1010.01<sub>2</sub> = +10.25<sub>10</sub>

**NB: Il y a des cas où les valeurs obtenues sont spéciales et n'ont donc pas de conversion possible. <br>Ces cas sont les suivants:**

|Type|Exposant| Mantisse|
|----|--------|---------|
|Zéros| 0 | 0 |
|Dénormalisé (proche de 0)| 0 | différent de 0|
| Infinis | FF<sub>16</sub> | 0 |
|NaN (not a number) | FF<sub>16</sub> | différent de 0 |

<hr>

# III- Décimal --> IEEE 754

| -  | Explication | Exemple: <br> 10.25<sub>10</sub> |
| ------- | ----------- | ------- |
| Signe  | Si le nombre est positif le bit le plus à gauche sera un `0` s'il est négatif, `1` |  positif --> `0`|
| Exposant | 1) Convertir le nombre de `décimal` à `binaire`. <br> 2) Ramener la virgule de ce nombre binaire à la droite du `1` le plus significatif à l'aide d'un exposant adéquat.<br>3) Ajouter la valeur du pôle à l'exposant obtenue.(Il serait recommandé de le faire en hexadécimal pour que l'étape 4 soit plus facile)<br>4) Convertir le résultat de l'addition en binaire (sur 8 bits)| 1) 10.25<sub>10</sub> : <br> **.** 10/2 _quotient 5_ reste **0** <br>  5/2 _quotient 2_ reste **1** <br> 2/2 _quotient 1_ reste **0** <br> 1/2 _quotient 0_ reste **1** <br> Lecture de bas en haut : 10<sub>10</sub> = 1010<sub>2</sub> <br> **.** 0.25x2 = **0**.5 <br> 0.5x2 = **1**.0 <br> Lecture de haut en bas : 0.25<sub>10</sub> = 0.01<sub>2</sub> <br> **.** 10.25<sub>10</sub> = 1010.01<sub>2</sub> <br> (autre exemple conversion de la partie décimale: <br> 0.75<sub>10</sub>: <br>0.75x2=**1**.5 <br> 0.5x2 = **1**.0 <br> 0.75<sub>10</sub> = 0.11<sub>2</sub>) <br>2) 1010.01<sub>2</sub> = 1.01001x2<sup>**3**</sup> <br> 3) 7F<sub>16</sub> + 3<sub>16</sub> = 82<sub>16</sub> ( 3<sub>10</sub> = 3<sub>16</sub> ) <br> 4) 82<sub>16</sub> = `1000 0010`<sub>2</sub>  |
|Mantisse |La partie décimal du nombre converti est la mantisse .| 1.`01001`<sub>2</sub> |
| Résultat | | `0 10000010 01001000000000000000000`|

<hr>

# IV- Lien Utile.

Convertisseur Décimal <--> IEEE 754 : [https://www.h-schmidt.net/FloatConverter/IEEE754.html](https://www.h-schmidt.net/FloatConverter/IEEE754.html)

<hr>

**Bonne chance à tous :)**
