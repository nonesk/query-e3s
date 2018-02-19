
CREATE OR REPLACE VIEW espece_station as 
SELECT eid.*, sta.id as id_sta, sta.long_deg_dec as longitude, sta.lat_deg_dec as latitude
FROM ESPECE_IDENTIFIEE eid
JOIN (SELECT * FROM lot_materiel lm UNION SELECT * FROM lot_materiel_ext lmext) lmall 
	ON eid.lot_materiel_fk = lmall.id
JOIN collecte co ON co.id = lmall.collecte_fk
JOIN station sta ON co.station_fk = sta.id;

CREATE OR REPLACE VIEW espece_distance as 
SELECT 
	esta1.referentiel_taxon_fk,
	(point(esta1.longitude,esta1.latitude) <@> point(esta2.longitude,esta2.latitude)) * 1.609344  as distance_km,
	esta1.id as id1, 
	esta2.id as id2
FROM espece_station esta1
JOIN espece_station esta2 ON esta1.referentiel_taxon_fk = esta2.referentiel_taxon_fk
WHERE esta1.id_sta < esta2.id_sta;

-- --SET work_mem = '32MB';
-- SELECT rt.objectif , COUNT(distinct sta.id) as nb_sta, max(dist.distance_km) as MLE 
-- FROM ESPECE_IDENTIFIEE eid
-- JOIN referentiel_taxon rt ON rt.id = eid.referentiel_taxon_fk
-- JOIN voc ON voc.id= eid.critere_identification_voc_fk
-- JOIN (SELECT * FROM lot_materiel lm UNION SELECT * FROM lot_materiel_ext lmext) lmall
-- 	ON eid.lot_materiel_fk = lmall.id
-- JOIN collecte co ON co.id = lmall.collecte_fk
-- JOIN station sta ON co.station_fk = sta.id
-- JOIN espece_distance dist ON dist.referentiel_taxon_fk=eid.referentiel_taxon_fk
-- WHERE voc.libelle = 'Morphologie'
-- GROUP BY rt.objectif
-- ORDER BY nb_sta DESC;


SELECT 
	rt.objectif, 
	COUNT(distinct esta.id_sta) as nb_sta, 
	max(dist.distance_km) as MLE, 
	(max(esta.latitude) + min(esta.latitude))/2 as LMP 
FROM referentiel_taxon rt
JOIN espece_station esta ON esta.referentiel_taxon_fk=rt.id
JOIN espece_distance dist ON dist.referentiel_taxon_fk=esta.referentiel_taxon_fk
JOIN voc ON voc.id = critere_identification_voc_fk
WHERE voc.code = 'M'
AND voc.parent = 'critereIdentification'
AND esta.referentiel_taxon_fk <50
GROUP BY rt.objectif
ORDER BY nb_sta DESC;


------- Ayant CO1

SELECT 
	rt.objectif, 
	COUNT(distinct esta.id_sta) as nb_sta, 
	max(dist.distance_km) as MLE, 
	(max(esta.latitude) + min(esta.latitude))/2 as LMP 
FROM referentiel_taxon rt
JOIN espece_station esta ON esta.referentiel_taxon_fk=rt.id
JOIN espece_distance dist ON dist.referentiel_taxon_fk=esta.referentiel_taxon_fk
JOIN voc ON voc.id = critere_identification_voc_fk
WHERE voc.code = 'M'
AND voc.parent = 'critereIdentification'
AND esta.referentiel_taxon_fk <50
GROUP BY rt.objectif
ORDER BY nb_sta DESC;


--Filtrer par un seuil minimal de nb de station.


SELECT 
	rt.objectif, 
	COUNT(distinct esta.id_sta) as nb_sta, 
	max(dist.distance_km) as MLE, 
	(max(esta.latitude) + min(esta.latitude))/2 as LMP 
FROM referentiel_taxon rt
JOIN espece_station esta ON esta.referentiel_taxon_fk=rt.id
JOIN espece_distance dist ON dist.referentiel_taxon_fk=esta.referentiel_taxon_fk
JOIN station_COI sco1 ON esta.id_sta= sco1.id AND dist.id1=sco1.id AND dist.id2=sco1.id
JOIN voc ON voc.id = critere_identification_voc_fk
WHERE voc.code = 'M'
AND voc.parent = 'critereIdentification'
--AND esta.referentiel_taxon_fk
GROUP BY rt.objectif
ORDER BY nb_sta DESC;
