LOAD DATA
INFILE 'Immatriculation.csv'
INSERT INTO TABLE immatriculation
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
numImmatriculation,
id_modele
)
