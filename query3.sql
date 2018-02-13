SELECt rt.objectif , COUNT(sta.*) as nb_sta FROM ESPECE_IDENTIFIEE eid
JOIN referentiel_taxon rt ON rt.id = eid.referentiel_taxon_fk
JOIN voc ON voc.id= eid.critere_identification_voc_fk
JOIN lot_materiel lm ON eid.lot_materiel_fk = lm.id
JOIN collecte co ON co.id = lm.collecte_fk
JOIN station sta ON co.station_fk = sta.id
WHERE voc.libelle = 'Morphologie'
GROUP BY rt.objectif
ORDER BY nb_sta DESC;


select 
  (
  (select point(long_deg_dec,lat_deg_dec) from station where id = 1) <@>
  (select point(long_deg_dec,lat_deg_dec) from station where id= 10)
  ) * 1.609344  as distance_km
