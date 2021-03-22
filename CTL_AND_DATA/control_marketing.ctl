LOAD DATA
INFILE 'Marketing.csv'
INSERT INTO TABLE marketing
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
age,
sexe,
taux,
situationFamiliale,
nbEnfantsACharge,
xVoiture
)
