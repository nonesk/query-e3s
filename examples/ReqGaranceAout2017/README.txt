REQUETES -  GARNCE LAPETOULE - AOUT 2017

>
> Requ�te 1 :
>
> � Trouve moi � les individus dont le champ � type_individu � de la table � individu � est associ�s au n�74 (femelle ovig�re dans la table VOC) donc le champ � method_extraction_ADN � de la table � ADN � est associ� au n�119 (chelex dans la table VOC)
Voir les fichiers :
requ1.txt et req1.csv : 16 cas trouv�s

!! cette requ�te montre une probl�matique dans les donn�es import�es :
le cas du code_ind_biomol = Pmeridianus|MIOSLEY_201505_1 est relatif � un code de crit�re d'identification = AMP ce qui ne devrait pas �tre le cas car nous n'interrogeons ici que les donn�es issues des �tudes morpho. Il n'y a pas encore pour le moment d'information sur les esp�ces mol�culaire qui seront int�gr�e ult�rieurement via les s�quences assembl�es


>  
>
> Requ�te 2 :
>
> � Trouve moi � le primer stard et le primer end qui donnent des PCR donc qualit� PCR est TB, pour les individus associ�s � l�esp�ce Proasellus walteri
Voir les fichiers :
 requ2.txt, : 0 cas trouv�s car le champ qualite_pcr est g�n�ralement NULL
 requ2b.txt  req2b.csv : 355 cas trouv�s : cas des individus d�esp�ce Proasellus walteri sans contrainte sur la qualite_pcr qui ont donn� lieu � une pcr . La colonne qualite_pcr montre que toute les valeurs sont NULL

>  
>
> Requ�te 3 :
>
> � Trouve moi � les chromatogrammes dont qualit� chromato est TB, pour des individus dont le champ � type_individu � de la table � individu � est associ�s au n�80 (m�le dans la table VOC) pour le g�ne associ� au n�439 (g�ne AM4 dans la table VOC)
Voir les fichiers :
requ3.txt  req3.csv : 347 cas trouv�s

RQ - comme il n'y avait pas de qualite_chromato = TB j'ai choisit OK
