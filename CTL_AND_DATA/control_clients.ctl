LOAD DATA
INFILE 'Client.csv'
INSERT INTO TABLE client
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
age,
sexe,
taux,
situationFamiliale,
nbEnfantsACharge,
xVoiture,
immatriculation
)
