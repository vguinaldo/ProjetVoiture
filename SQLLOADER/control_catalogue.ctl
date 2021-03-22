LOAD DATA
INFILE 'Catalogue.csv'
INSERT INTO TABLE catalogue
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
id,
marque,
nom,
puissance,
longueur,
nbPlaces,
nbPortes,
couleur,
occasion,
prix
)
