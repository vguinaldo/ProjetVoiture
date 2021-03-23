export MYPROJECTHOME=/home/CAO/

-- suppressionn du fichier si on souhaite le remplacer
hadoop fs -rm -r /user/cao

hadoop fs -mkdir /user/cao
hadoop fs -mkdir /user/cao/projetMBDS
hadoop fs -mkdir /user/cao/projetMBDS/Catalogue

hadoop fs -put $MYPROJECTHOME/projetMBDS/Catalogue.csv /user/cao/projetMBDS/Catalogue

hadoop fs -ls /user/cao/projetMBDS/Catalogue


-- Etape 7.2.2 : création de la table externe HIVE pointant vers le fichier HDFS

-- RECOMMANDATION_HDFS_EXT (VOLID STRING, CLIENTID STRING,  DATEVOL STRING, Recommand  string )

-- Etape 7.2.2.1 lancer Hive

beeline

-- Etape 7.2.2.2 Se connecter à HIVE (oracle/welcome1)

!connect jdbc:hive2://localhost:10000

-- 7.2.2.3 créer la table externe HIVE pointant vers le fichier recommandation_ext.txt

-- table externe Hive CATALOGUE
drop table CATALOGUE;
-- marque,nom,puissance,longueur,nbPlaces,nbPortes,couleur,occasion,prix
CREATE EXTERNAL TABLE CATALOGUE (
    MARQUE string,
    NOM string ,
    PUISSANCE string,
    LONGUEUR string,
    NBPLACES string,
    NBPORTES string,
    COULEUR string,
    OCCASION string,
    PRIX string
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE LOCATION 'hdfs:/user/cao/projetMBDS/Catalogue';

-- 7.2.2.4 v�rifications
-- v�rifier la pr�sence des lignes et de la table
select * from CATALOGUE;

-- 3. créer la table externe Oracle SQl CATALOGUE pointant vers la table
-- externe HIVE �quivalentes

sqlplus myOracleLogin@myDB/myOracleLoginPassword;

-- table externe Oracle SQL RECOMMANDATION_HDFS_EXT pointant vers la table externe HIVE
drop table recommandation_HDFS_H_O_EXT;

CREATE TABLE  recommandation_HDFS_H_O_EXT(
                                             VOLID number(8),
                                             CLIENTID number(8),
                                             DATEVOL varchar2(12),
                                             Recommand  varchar2(3)
)
    ORGANIZATION EXTERNAL (
TYPE ORACLE_HIVE
DEFAULT DIRECTORY   ORACLE_BIGDATA_CONFIG
ACCESS PARAMETERS
(
com.oracle.bigdata.tablename=default.recommandation_myMaster_myLinuxLogin_HDFS_H_EXT
)
)
REJECT LIMIT UNLIMITED;

-- 7.2.4. Consultation de tables externes Oracle SQL
-- 7.2.4.1 compter les lignes
select count(*) from recommandation_HDFS_H_O_EXT;


-- 7.2.4.2 consultation de la table APPRECIATIONS_yourLogin_MIAGE_ONS_EXT
-- Se limiter aux N premi�res lignes
select * from recommandation_HDFS_H_O_EXT
where rownum <10;