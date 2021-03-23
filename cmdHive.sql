[oracle@bigdatalite ~]$ beeline
Beeline version 1.1.0-cdh5.4.0 by Apache Hive 
 
-- Se connecter à HIVE
beeline> !connect jdbc:hive2://localhost:10000
 
Enter username for jdbc:hive2://localhost:10000: oracle
Enter password for jdbc:hive2://localhost:10000: ********
(password : welcome1)
 
-- Supprimer la table MARKETING si elle existe déjà
jdbc:hive2://localhost:10000> drop table MARKETING; 
 
-- Création de la table externe MARKETING pointant vers la table MARKETING de ORACLE NOSQL
jdbc:hive2://localhost:10000> CREATE EXTERNAL TABLE MARKETING(
    CLIENTMARKETINGID int,
    AGE string ,
    SEXE string, 
    TAUX string,
    SITUATIONFAMILIALE string,
    NBENFANTSACHARGE string,
    DEUXIEMEVOITURE string
)
STORED BY 'oracle.kv.hadoop.hive.table.TableStorageHandler'
TBLPROPERTIES (
"oracle.kv.kvstore" = "kvstore",
"oracle.kv.hosts" = "bigdatalite.localdomain:5000", 
"oracle.kv.hadoop.hosts" = "bigdatalite.localdomain/127.0.0.1", 
"oracle.kv.tableName" = "MARKETING");
 
-- Vérification du contenu de la table MARKETING externe dans HIVE
0: jdbc:hive2://localhost:10000> select * from MARKETING;