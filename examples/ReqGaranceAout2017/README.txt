REQUETES -  GARNCE LAPETOULE - AOUT 2017

>
> Requête 1 :
>
> « Trouve moi » les individus dont le champ « type_individu » de la table « individu » est associés au n°74 (femelle ovigère dans la table VOC) donc le champ « method_extraction_ADN » de la table « ADN » est associé au n°119 (chelex dans la table VOC)
Voir les fichiers :
requ1.txt et req1.csv : 16 cas trouvés

!! cette requête montre une problématique dans les données importées :
le cas du code_ind_biomol = Pmeridianus|MIOSLEY_201505_1 est relatif à un code de critère d'identification = AMP ce qui ne devrait pas être le cas car nous n'interrogeons ici que les données issues des études morpho. Il n'y a pas encore pour le moment d'information sur les espèces moléculaire qui seront intégrée ultérieurement via les séquences assemblées


>  
>
> Requête 2 :
>
> « Trouve moi » le primer stard et le primer end qui donnent des PCR donc qualité PCR est TB, pour les individus associés à l’espèce Proasellus walteri
Voir les fichiers :
 requ2.txt, : 0 cas trouvés car le champ qualite_pcr est généralement NULL
 requ2b.txt  req2b.csv : 355 cas trouvés : cas des individus d’espèce Proasellus walteri sans contrainte sur la qualite_pcr qui ont donné lieu à une pcr . La colonne qualite_pcr montre que toute les valeurs sont NULL

>  
>
> Requête 3 :
>
> « Trouve moi » les chromatogrammes dont qualité chromato est TB, pour des individus dont le champ « type_individu » de la table « individu » est associés au n°80 (mâle dans la table VOC) pour le gène associé au n°439 (gène AM4 dans la table VOC)
Voir les fichiers :
requ3.txt  req3.csv : 347 cas trouvés

RQ - comme il n'y avait pas de qualite_chromato = TB j'ai choisit OK
