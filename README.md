# ProjetVoiture

--Table : catalogue
	sqlldr  ORACLEUSER@PDBORCL/PassOrs1 control=control_catalogue.ctl log=track_catalogue.log skip=1
--Table : immatriculation
	sqlldr  ORACLEUSER@PDBORCL/PassOrs1 control=control_immatriculations.ctl log=track_immatriculations.log skip=1
--Table : client
	sqlldr  ORACLEUSER@PDBORCL/PassOrs1 control=control_clients.ctl log=track_clients.log skip=1
--Table : marketing
	sqlldr  ORACLEUSER@PDBORCL/PassOrs1 control=control_marketing.ctl log=track_marketing.log skip=1