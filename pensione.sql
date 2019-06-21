-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: pensione
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `prov`
--

DROP TABLE IF EXISTS `prov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prov` (
  `numero fattura` int(11) NOT NULL AUTO_INCREMENT,
  `cod utente` varchar(45) NOT NULL,
  `cod servizio` varchar(20) NOT NULL,
  `data prenotazione` date NOT NULL,
  `data fine` date DEFAULT NULL,
  `prezzo` double DEFAULT NULL,
  PRIMARY KEY (`numero fattura`,`cod utente`,`cod servizio`),
  KEY `cod servizio_idx` (`cod servizio`),
  KEY `cod utente_idx` (`cod utente`),
  CONSTRAINT `cod servizio` FOREIGN KEY (`cod servizio`) REFERENCES `servizi` (`nome`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cod utente` FOREIGN KEY (`cod utente`) REFERENCES `utenti` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prov`
--

LOCK TABLES `prov` WRITE;
/*!40000 ALTER TABLE `prov` DISABLE KEYS */;
/*!40000 ALTER TABLE `prov` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servizi`
--

DROP TABLE IF EXISTS `servizi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servizi` (
  `nome` varchar(20) NOT NULL,
  `descrizione` varchar(500) DEFAULT NULL,
  `prezzo` double DEFAULT NULL,
  `foto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servizi`
--

LOCK TABLES `servizi` WRITE;
/*!40000 ALTER TABLE `servizi` DISABLE KEYS */;
INSERT INTO `servizi` VALUES ('Bagno medico',NULL,30,'bagno.jpg'),('Custodia','Custodia degli animali a tempo determinato; \nSarà possibile lasciare in tutta tranquillità il proprio animale da compagnia andando a fare i propri\nviaggi di lavoro, piccoli viaggi temporanei o anche una semplice giornata fuori città, senza pensieri.\nIl vosto animale da compagnia avrà tutti i confort e i servizi di cui necessità come:\ncibo, svago, area verde dove correre in tutta libertà e ovviamente dei bravissimi addetti alla cura \ndi ogni animale presente nella struttura.	',10,'Custodia.jpg'),('Toelettatura','la toelettatura riguarderà:\nBagni di igiene e bellezza – Bagni antiparassitari e curativi –\nSnodatura e pettinatura – Tosatura \ntutto questo in un unico servizio, che comprende quindi un pacchetto \ncompleto della cura del proprio cane ',25,'toelettatora.jpg'),('Tosatura','Rasatura dell\'animale',15,'tosatura.jpg'),('Trasporto','Se non hai la possibilità di trasportare il tuo \nanimale da un luogo a un altro, ci pensiamo noi!\nCosì potrai stare in tutta tranquillità mentre noi \nportiamo il tuo amico a quattro zampe',10,'navetta.jpg'),('Visita veterinaria',NULL,20,'veterinari.jpg');
/*!40000 ALTER TABLE `servizi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utenti`
--

DROP TABLE IF EXISTS `utenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utenti` (
  `email` varchar(20) NOT NULL,
  `password` varchar(16) DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `cognome` varchar(45) DEFAULT NULL,
  `città` varchar(45) DEFAULT NULL,
  `via` varchar(45) DEFAULT NULL,
  `numero civico` int(11) DEFAULT NULL,
  `data nascita` date DEFAULT NULL,
  `numero telefono` varchar(11) DEFAULT NULL,
  `intestatario` varchar(45) DEFAULT NULL,
  `numero carta` varchar(45) DEFAULT NULL,
  `data scadenza` date DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utenti`
--

LOCK TABLES `utenti` WRITE;
/*!40000 ALTER TABLE `utenti` DISABLE KEYS */;
INSERT INTO `utenti` VALUES ('aaa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('aimon@gmail.com',NULL,'ciccasella','paolisi','digiword','dell\'evoluzione',12,'2018-12-12','1234567899','graimon','124328472934',NULL),('bbb',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('fbwrbv@aditus.info',NULL,'ciccasella','Meninno','edgh','dell\'evoluzione',78,'2018-05-31','6666666666','asferget','124328472934','2018-05-31'),('salve',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `utenti` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-31 23:44:25
