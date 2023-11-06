-- import to SQLite by running: sqlite3.exe db.sqlite3 -init sqlite.sql

PRAGMA journal_mode = MEMORY;
PRAGMA synchronous = OFF;
PRAGMA foreign_keys = OFF;
PRAGMA ignore_check_constraints = OFF;
PRAGMA auto_vacuum = NONE;
PRAGMA secure_delete = OFF;
BEGIN TRANSACTION;

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
`id` TEXT DEFAULT NULL,
`name` TEXT DEFAULT NULL
);
LOCK TABLES `auth_group` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
`id` TEXT DEFAULT NULL,
`group_id` TEXT DEFAULT NULL,
`permission_id` TEXT DEFAULT NULL
);
LOCK TABLES `auth_group_permissions` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
`id` tinyINTEGER DEFAULT NULL,
`content_type_id` tinyINTEGER DEFAULT NULL,
`codename` TEXT DEFAULT NULL,
`name` TEXT DEFAULT NULL
);
LOCK TABLES `auth_permission` WRITE;
INSERT INTO `auth_permission` VALUES (1,1,'add_logentry','Can add log entry'),(2,1,'change_logentry','Can change log entry'),(3,1,'delete_logentry','Can delete log entry'),(4,1,'view_logentry','Can view log entry'),(5,2,'add_permission','Can add permission'),(6,2,'change_permission','Can change permission'),(7,2,'delete_permission','Can delete permission'),(8,2,'view_permission','Can view permission'),(9,3,'add_group','Can add group'),(10,3,'change_group','Can change group'),(11,3,'delete_group','Can delete group'),(12,3,'view_group','Can view group'),(13,4,'add_user','Can add user'),(14,4,'change_user','Can change user'),(15,4,'delete_user','Can delete user'),(16,4,'view_user','Can view user'),(17,5,'add_contenttype','Can add content type'),(18,5,'change_contenttype','Can change content type'),(19,5,'delete_contenttype','Can delete content type'),(20,5,'view_contenttype','Can view content type'),(21,6,'add_session','Can add session'),(22,6,'change_session','Can change session'),(23,6,'delete_session','Can delete session'),(24,6,'view_session','Can view session'),(25,11,'add_utulek','Can add (''Útulek'',)'),(26,11,'change_utulek','Can change (''Útulek'',)'),(27,11,'delete_utulek','Can delete (''Útulek'',)'),(28,11,'view_utulek','Can view (''Útulek'',)'),(29,9,'add_pes','Can add (''Pes'',)'),(30,9,'change_pes','Can change (''Pes'',)'),(31,9,'delete_pes','Can delete (''Pes'',)'),(32,9,'view_pes','Can view (''Pes'',)'),(33,7,'add_mesto','Can add (''Město'',)'),(34,7,'change_mesto','Can change (''Město'',)'),(35,7,'delete_mesto','Can delete (''Město'',)'),(36,7,'view_mesto','Can view (''Město'',)'),(37,8,'add_osetrovatel','Can add (''Ošetřovatel'',)'),(38,8,'change_osetrovatel','Can change (''Ošetřovatel'',)'),(39,8,'delete_osetrovatel','Can delete (''Ošetřovatel'',)'),(40,8,'view_osetrovatel','Can view (''Ošetřovatel'',)'),(41,10,'add_zajemce','Can add (''Zájemce'',)'),(42,10,'change_zajemce','Can change (''Zájemce'',)'),(43,10,'delete_zajemce','Can delete (''Zájemce'',)'),(44,10,'view_zajemce','Can view (''Zájemce'',)');
UNLOCK TABLES;
DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
`id` tinyINTEGER DEFAULT NULL,
`password` TEXT DEFAULT NULL,
`last_login` TEXT DEFAULT NULL,
`is_superuser` tinyINTEGER DEFAULT NULL,
`username` TEXT DEFAULT NULL,
`last_name` TEXT DEFAULT NULL,
`email` TEXT DEFAULT NULL,
`is_staff` tinyINTEGER DEFAULT NULL,
`is_active` tinyINTEGER DEFAULT NULL,
`date_joined` TEXT DEFAULT NULL,
`first_name` TEXT DEFAULT NULL
);
LOCK TABLES `auth_user` WRITE;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$5EXqZDPhhjB29fTcPIjNHL$YdlzQ9CJgIl33P1ta6Xd8wytXWyGD15k6OA64EgfqAM=','2023-06-16',1,'admin','','admin@skola.cz',1,1,'2023-05-03','');
UNLOCK TABLES;
DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
`id` TEXT DEFAULT NULL,
`user_id` TEXT DEFAULT NULL,
`group_id` TEXT DEFAULT NULL
);
LOCK TABLES `auth_user_groups` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
`id` TEXT DEFAULT NULL,
`user_id` TEXT DEFAULT NULL,
`permission_id` TEXT DEFAULT NULL
);
LOCK TABLES `auth_user_user_permissions` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
`id` tinyINTEGER DEFAULT NULL,
`object_id` tinyINTEGER DEFAULT NULL,
`object_repr` TEXT DEFAULT NULL,
`action_flag` tinyINTEGER DEFAULT NULL,
`change_message` TEXT DEFAULT NULL,
`content_type_id` tinyINTEGER DEFAULT NULL,
`user_id` tinyINTEGER DEFAULT NULL,
`action_time` TEXT DEFAULT NULL
);
LOCK TABLES `django_admin_log` WRITE;
INSERT INTO `django_admin_log` VALUES (1,1,'mesto object (1)',1,'[{\"added\": {}}]',7,1,'2023-05-22'),(2,2,'mesto object (2)',1,'[{\"added\": {}}]',7,1,'2023-06-17'),(3,2,'mesto object (2)',3,'',7,1,'2023-06-17'),(4,1,'Městský útulek pro psy',1,'[{\"added\": {}}]',11,1,'2023-06-17'),(5,1,'Josef (Městský útulek pro psy)',1,'[{\"added\": {}}]',8,1,'2023-06-17'),(6,1,'Jan (mesto object (1))',1,'[{\"added\": {}}]',10,1,'2023-06-17'),(7,1,'Lajka (Městský útulek pro psy)',1,'[{\"added\": {}}]',9,1,'2023-06-17'),(8,3,'mesto object (3)',1,'[{\"added\": {}}]',7,1,'2023-06-18'),(9,2,'Psí útulek',1,'[{\"added\": {}}]',11,1,'2023-06-18'),(10,2,'Psí útulek',2,'[{\"changed\": {\"fields\": [\"Fotografie\"]}}]',11,1,'2023-06-19'),(11,1,'Městský útulek pro psy',2,'[{\"changed\": {\"fields\": [\"Fotografie\"]}}]',11,1,'2023-06-19'),(12,1,'Městský útulek pro psy',2,'[{\"changed\": {\"fields\": [\"Fotografie\"]}}]',11,1,'2023-06-19'),(13,1,'Městský útulek pro psy',2,'[{\"changed\": {\"fields\": [\"Fotografie\"]}}]',11,1,'2023-06-19'),(14,1,'Městský útulek pro psy',2,'[{\"changed\": {\"fields\": [\"Fotografie\"]}}]',11,1,'2023-06-19'),(15,1,'Městský útulek pro psy',2,'[{\"changed\": {\"fields\": [\"Fotografie\"]}}]',11,1,'2023-06-19'),(16,1,'Městský útulek pro psy',2,'[{\"changed\": {\"fields\": [\"Fotografie\"]}}]',11,1,'2023-06-19'),(17,2,'Psí útulek',2,'[{\"changed\": {\"fields\": [\"Fotografie\"]}}]',11,1,'2023-06-19'),(18,2,'Psí útulek',2,'[{\"changed\": {\"fields\": [\"Fotografie\"]}}]',11,1,'2023-06-19'),(19,2,'Psí útulek',2,'[]',11,1,'2023-06-19'),(20,1,'Městský útulek pro psy',2,'[{\"changed\": {\"fields\": [\"Fotografie\"]}}]',11,1,'2023-06-19'),(21,2,'Psí útulek',2,'[{\"changed\": {\"fields\": [\"Fotografie\"]}}]',11,1,'2023-06-19'),(22,2,'Psí útulek',2,'[]',11,1,'2023-06-19'),(23,1,'Městský útulek pro psy',2,'[{\"changed\": {\"fields\": [\"Fotografie\"]}}]',11,1,'2023-06-19'),(24,1,'Lajka (Městský útulek pro psy)',2,'[{\"changed\": {\"fields\": [\"Fotografie\"]}}]',9,1,'2023-06-19'),(25,1,'Lajka (Městský útulek pro psy)',2,'[{\"changed\": {\"fields\": [\"Vu011bk\"]}}]',9,1,'2023-06-20'),(26,1,'Lajka (Městský útulek pro psy)',2,'[{\"changed\": {\"fields\": [\"Ou010dkovu00e1nu00ed\"]}}]',9,1,'2023-06-20'),(27,1,'Lajka (Městský útulek pro psy)',2,'[{\"changed\": {\"fields\": [\"Ou010dkovu00e1nu00ed\"]}}]',9,1,'2023-06-20'),(28,1,'Lajka (Městský útulek pro psy)',2,'[]',9,1,'2023-06-20'),(29,2,'Psí útulek',2,'[{\"changed\": {\"fields\": [\"Mobil\", \"Cas od\", \"Cas do\", \"Popis\"]}}]',11,1,'2023-06-20'),(30,2,'Psí útulek',2,'[]',11,1,'2023-06-20'),(31,2,'Psí útulek',2,'[{\"changed\": {\"fields\": [\"Cas od\", \"Cas do\"]}}]',11,1,'2023-06-20'),(32,4,'mesto object (4)',1,'[{\"added\": {}}]',7,1,'2023-06-20'),(33,4,'mesto object (4)',2,'[]',7,1,'2023-06-20'),(34,3,'Liga na ochranu zvířat ČR',1,'[{\"added\": {}}]',11,1,'2023-06-20'),(35,5,'mesto object (5)',1,'[{\"added\": {}}]',7,1,'2023-06-20'),(36,4,'Šance pro jejich život, z.s.',1,'[{\"added\": {}}]',11,1,'2023-06-20'),(37,6,'mesto object (6)',1,'[{\"added\": {}}]',7,1,'2023-06-20'),(38,5,'Útulek pro zvířata v nouzi',1,'[{\"added\": {}}]',11,1,'2023-06-20'),(39,2,'Alík (Útulek pro zvířata v nouzi)',1,'[{\"added\": {}}]',9,1,'2023-06-20'),(40,3,'Andy (Městský útulek pro psy)',1,'[{\"added\": {}}]',9,1,'2023-06-20'),(41,4,'Bruno (Psí útulek)',1,'[{\"added\": {}}]',9,1,'2023-06-20'),(42,5,'Kazan (Liga na ochranu zvířat ČR)',1,'[{\"added\": {}}]',9,1,'2023-06-20'),(43,6,'Čiki (Šance pro jejich život, z.s.)',1,'[{\"added\": {}}]',9,1,'2023-06-20'),(44,1,'Městský útulek pro psy',2,'[{\"changed\": {\"fields\": [\"Mobil\", \"Cas od\", \"Cas do\", \"Popis\"]}}]',11,1,'2023-06-20'),(45,2,'Psí útulek',2,'[{\"changed\": {\"fields\": [\"Mobil\", \"Popis\"]}}]',11,1,'2023-06-20');
UNLOCK TABLES;
DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
`id` tinyINTEGER DEFAULT NULL,
`app_label` TEXT DEFAULT NULL,
`model` TEXT DEFAULT NULL
);
LOCK TABLES `django_content_type` WRITE;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'utulek','mesto'),(8,'utulek','osetrovatel'),(9,'utulek','pes'),(11,'utulek','utulek'),(10,'utulek','zajemce');
UNLOCK TABLES;
DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
`id` tinyINTEGER DEFAULT NULL,
`app` TEXT DEFAULT NULL,
`name` TEXT DEFAULT NULL,
`applied` TEXT DEFAULT NULL
);
LOCK TABLES `django_migrations` WRITE;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-05-03'),(2,'auth','0001_initial','2023-05-03'),(3,'admin','0001_initial','2023-05-03'),(4,'admin','0002_logentry_remove_auto_add','2023-05-03'),(5,'admin','0003_logentry_add_action_flag_choices','2023-05-03'),(6,'contenttypes','0002_remove_content_type_name','2023-05-03'),(7,'auth','0002_alter_permission_name_max_length','2023-05-03'),(8,'auth','0003_alter_user_email_max_length','2023-05-03'),(9,'auth','0004_alter_user_username_opts','2023-05-03'),(10,'auth','0005_alter_user_last_login_null','2023-05-03'),(11,'auth','0006_require_contenttypes_0002','2023-05-03'),(12,'auth','0007_alter_validators_add_error_messages','2023-05-03'),(13,'auth','0008_alter_user_username_max_length','2023-05-03'),(14,'auth','0009_alter_user_last_name_max_length','2023-05-03'),(15,'auth','0010_alter_group_name_max_length','2023-05-03'),(16,'auth','0011_update_proxy_permissions','2023-05-03'),(17,'auth','0012_alter_user_first_name_max_length','2023-05-03'),(18,'sessions','0001_initial','2023-05-03'),(19,'utulek','0001_initial','2023-05-22'),(20,'utulek','0002_utulek_fotografie','2023-06-18'),(21,'utulek','0003_pes_fotografie_alter_mesto_nazev_mesta','2023-06-19'),(22,'utulek','0004_pes_vek','2023-06-20'),(23,'utulek','0005_pes_ockovani','2023-06-20'),(24,'utulek','0006_utulek_popis_alter_pes_ockovani','2023-06-20'),(25,'utulek','0007_utulek_cas_do_utulek_cas_od_utulek_mobil','2023-06-20'),(26,'utulek','0008_alter_utulek_cas_do_alter_utulek_cas_od','2023-06-20'),(27,'utulek','0009_remove_mesto_psc','2023-06-20'),(28,'utulek','0010_pes_pohlavi','2023-06-20');
UNLOCK TABLES;
DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
`session_key` TEXT DEFAULT NULL,
`session_data` TEXT DEFAULT NULL,
`expire_date` TEXT DEFAULT NULL
);
LOCK TABLES `django_session` WRITE;
INSERT INTO `django_session` VALUES ('4bajmbw6q9my6d23j7edbofxxv0bu1e7','.eJxVjL0OwyAQg9-FuUL8JBA6ds8zIODuStoKpJBMVd-9RMrQLpblz_ab-bBv2e8NV78AuzLJLr9ZDOmJ5QDwCOVeeaplW5fIjwo_aeNzBXzdzu7fQQ4t93VU0o7JIKRRS2UGIhWmZJxGgNBVDIKEA4mgSaN0pBKB7S7aSShy7PMF8zw4Zg:1pwnIp:1RghENIRWFqkfVDbepqaoEu5mRis0EenRddNLRumEsQ','2023-05-24'),('84bifaag3z88wxjvphvs3sni3olkko73','.eJxVjL0OwyAQg9-FuUL8JBA6ds8zIODuStoKpJBMVd-9RMrQLpblz_ab-bBv2e8NV78AuzLJLr9ZDOmJ5QDwCOVeeaplW5fIjwo_aeNzBXzdzu7fQQ4t93VU0o7JIKRRS2UGIhWmZJxGgNBVDIKEA4mgSaN0pBKB7S7aSShy7PMF8zw4Zg:1qAD96:JnbOBL7b2IA-6D5-Y361qOifKdeU3ddpm1oD5-thB9Q','2023-06-30');
UNLOCK TABLES;
DROP TABLE IF EXISTS `sqlite_sequence`;

CREATE TABLE `sqlite_sequence` (
`name` TEXT DEFAULT NULL,
`seq` tinyINTEGER DEFAULT NULL
);
LOCK TABLES `sqlite_sequence` WRITE;
INSERT INTO `sqlite_sequence` VALUES ('django_migrations',28),('django_admin_log',45),('django_content_type',11),('auth_permission',44),('auth_group',0),('auth_user',1),('utulek_osetrovatel',1),('utulek_zajemce',1),('utulek_mesto',6),('utulek_utulek',5),('utulek_pes',6);
UNLOCK TABLES;
DROP TABLE IF EXISTS `utulek_mesto`;

CREATE TABLE `utulek_mesto` (
`id` tinyINTEGER DEFAULT NULL,
`kraj` TEXT DEFAULT NULL,
`nazev_mesta` TEXT DEFAULT NULL
);
LOCK TABLES `utulek_mesto` WRITE;
INSERT INTO `utulek_mesto` VALUES (1,'Moravsko Slezský','Opava'),(3,'Moravsko Slezský','Ostrava'),(4,'Olomoucký kraj','Olomouc'),(5,'Moravsko Slezský','Krnov'),(6,'Zlínský kraj','Zlín');
UNLOCK TABLES;
DROP TABLE IF EXISTS `utulek_osetrovatel`;

CREATE TABLE `utulek_osetrovatel` (
`id` tinyINTEGER DEFAULT NULL,
`jmeno` TEXT DEFAULT NULL,
`prijmeni` TEXT DEFAULT NULL,
`mobil` INTEGER DEFAULT NULL,
`utulek_nazev_id` tinyINTEGER DEFAULT NULL
);
LOCK TABLES `utulek_osetrovatel` WRITE;
INSERT INTO `utulek_osetrovatel` VALUES (1,'Josef','Malý',123456789,1);
UNLOCK TABLES;
DROP TABLE IF EXISTS `utulek_pes`;

CREATE TABLE `utulek_pes` (
`id` tinyINTEGER DEFAULT NULL,
`jmeno_psa` TEXT DEFAULT NULL,
`rasa` TEXT DEFAULT NULL,
`popis` text,
`utulek_nazev_id` tinyINTEGER DEFAULT NULL,
`fotografie` TEXT DEFAULT NULL,
`vek` tinyINTEGER DEFAULT NULL,
`ockovani` TEXT DEFAULT NULL,
`pohlavi` TEXT DEFAULT NULL
);
LOCK TABLES `utulek_pes` WRITE;
INSERT INTO `utulek_pes` VALUES (1,'Lajka','Oříšek','Je to velice zlobivé psisko. \r\n: (',1,'psi/images.jpg',7,'NE','0'),(2,'Alík','Kříženec střední velikosti','Alík je střední kříženec klidné povahy, kterému bohužel umřela majitelka. Byl zvyklý s ní žít v rodinném domě, nebyl zvyklý na děti, paní neměla ani kočky. Hledáme pro něho nový domov, kde by dožil s nějakou babičkou nebo dědečkem, který potřebuje nenáročného psíka – společníka. Máme Alíčka na provozní budově a víme, že je klidný a čistotný. Je to velký mazel, který si rád přijde pro pomazlení.',5,'psi/C0R_5575_0104379_00001.jpg',11,'ANO','0'),(3,'Andy','Kříženec labradora','Andy je kříženec labradora a border kolie. Má 9 let. Vyrůstal v rodině, kde se narodilo dítě a bohužel se stalo, že Andy na něho zavrčel a rodina se začala obávat. Byl zvyklý žít v bytě, chodili s ním na vycházky a zná i náhubek. Byl by možná vhodný do rodiny, kde by měl svůj klid a věděli, jak zvládat konfliktní situace. Je to ještě vitální psík, přijděte se na něho podívat na útulek…..',1,'psi/COR_7545_0120132_00001_1.jpg',10,'ANO','PES'),(4,'Bruno','kříženec velkého plemene','Bruno stále čeká na “svého” člověka. Musí to být osobnost a v očích Bruna opravdový vůdce. I když Bruno není pes pro každého, stále věříme, že někde je člověk s dostatkem zkušeností, ale i láskou tohoto velkého hafana zvládnout. V případě zájmu mu z počátku bude nápomocna Petra, která Bruna dobře zná a pomůže při seznamování, případně upozorní nového majitele na rizikové situace. Bruno si zaslouží další šanci...',2,'psi/C0R_8364_0093366_1.jpg',10,'ANO','PES'),(5,'Kazan','německý ovčák','Moc se za Kazana přimlouváme. Na útulku již čeká ¾ roku, jeho parťák Lesan odešel před půl rokem a Kazan stále neměl ještě to štěstí. Je to ještě aktivní pes, zvládá vycházky, má rád společnost člověka. Určitě by uvítal rodinný dům se zahradou, kde by mohl pobíhat a být se svou rodinou. Řešili jsme s ním problémy se zažíváním, ale ty naštěstí se teď ustálily při podávání hypoalergenních granulí. Na útulku dostává i kloubní výživu.',3,'psi/C0R_5899_0104636_00001.jpg',12,'ANO','PES'),(6,'Čiki','kříženec teriéra','Tak Čiki se nám bohužel po měsíci vrátil zpátky na útulek. Vypadalo to velmi nadějně, krásně si zvykl, ale zřejmě je velmi důležité u Čikiho dodržovat jednoduchá pravidla, aby nenastal problém (např. brát ho mezi lidi vždy s náhubkem, určovat mu doma, kde bude mít místo a nepolevit,….) Je dobré také vědět, že už nezvládá dlouhé výlety, stačí mu zahrádka nebo krátká procházka…..Dostane Čiki u někoho druhou šanci?',4,'psi/80C6CE08-FFD0-4A25-98F8-5BEB7346B091.jpeg',13,'ANO','PES');
UNLOCK TABLES;
DROP TABLE IF EXISTS `utulek_utulek`;

CREATE TABLE `utulek_utulek` (
`id` tinyINTEGER DEFAULT NULL,
`name` TEXT DEFAULT NULL,
`adresa` TEXT DEFAULT NULL,
`mesto_nazev_id` tinyINTEGER DEFAULT NULL,
`fotografie` TEXT DEFAULT NULL,
`popis` text,
`cas_do` TEXT DEFAULT NULL,
`mobil` INTEGER DEFAULT NULL,
`cas_od` TEXT DEFAULT NULL
);
LOCK TABLES `utulek_utulek` WRITE;
INSERT INTO `utulek_utulek` VALUES (1,'Městský útulek pro psy','Jaselská 2815, Předměstí',1,'utulky/op-utulek-pro-psy.jpg','Útulek byl původně zbudován za účelem umísťování nalezených psů. V nedávné době byly provedeny úpravy tak, aby zde v menší míře mohly být umístěny i nalezené nebo odchycené kočky a některá nalezená handicapovaná zvířata. U umístěných koček je prováděna kastrace a sterilizace v souladu s metodickým pokynem na regulaci výskytu zdivočelých koček.','22:45:40',553716980,'06:00:00'),(2,'Psí útulek','Provozní 5540',3,'utulky/ostrava.jpeg','Město Ostrava v roce 1998 zřídilo Útulek pro nalezené psy v Ostravě-Třebovicích. Jeho kapacita je 149 kotců, z toho 119 kotců je určeno pro zdravé psy a ostatní kotce jsou vyhrazeny pro umístění nově přijatých a nemocných psů. Pokud je pejsek přijat do našeho útulku, je mu poskytnuto základní veterinární vyšetření. Veterinář zkontroluje jeho zdravotní stav, provede odčervení, vakcinaci, ošetří zranění a provede další potřebná opatření. Po uplynutí karanténní lhůty je pes umístěn do kotce, kde čeká na svého nového majitele. Cílem útulku je poskytnutí maximální možné péče našim svěřencům.','20:14:30',599455191,'06:00:00'),(3,'Liga na ochranu zvířat ČR','areál letiště 726, Neředín',4,'utulky/348433825_997595437945693_492349480175400935_n.png','Liga na ochranu zvířat ČR je občanským sdružením, vzniklým z\r\nvůle občanů a z jejich práva na realisaci práv daných nám ústavou.\r\nMotivací a cílem je aktivní působení pro nastolení kulturního a\r\nhumánního vztahu k živočichům.','20:28:01',583210759,'06:00:00'),(4,'Šance pro jejich život, z.s.','K. Čapka 1135/8',5,'utulky/945010_288772597934711_1695476693_n.jpg','Opuštěným pejskům, které odchytnou strážníci Městské policie Krnov na území města Krnov naše město zajišťuje základní náhradní péči ve dvou útulcích. Jeden spravuje spolek Šance pro jejich život, z.s. v Hrozové a druhý psí útulek provozuje Tomáš Schulz ve Slezských Pavlovicích.','20:30:21',777134410,'06:00:00'),(5,'Útulek pro zvířata v nouzi','Mezilesí 628',6,'utulky/utulek1.jpg','Útulek je situován nedaleko zastavěné části Zlína a je přístupný městskou hromadnou dopravou. Kapacita útulku umožňuje umístit zde až 80 psů a 40 koček a může na přechodnou dobu sloužit i jako útočiště pro handicapovaná volně žijící zvířata, jako jsou například ježci a ptáci.','20:31:46',577244444,'06:00:00');
UNLOCK TABLES;
DROP TABLE IF EXISTS `utulek_zajemce`;

CREATE TABLE `utulek_zajemce` (
`id` tinyINTEGER DEFAULT NULL,
`jmeno_zajemce` TEXT DEFAULT NULL,
`prijmeni_zajemce` TEXT DEFAULT NULL,
`mobil_zajemce` INTEGER DEFAULT NULL,
`email` TEXT DEFAULT NULL,
`mesto_nazev_id` tinyINTEGER DEFAULT NULL
);
LOCK TABLES `utulek_zajemce` WRITE;
INSERT INTO `utulek_zajemce` VALUES (1,'Jan','Petržel',789456123,'jandement@seznam.cz',1);
UNLOCK TABLES;





COMMIT;
PRAGMA ignore_check_constraints = ON;
PRAGMA foreign_keys = ON;
PRAGMA journal_mode = WAL;
PRAGMA synchronous = NORMAL;
-- import to SQLite by running: sqlite3.exe db.sqlite3 -init sqlite.sql

PRAGMA journal_mode = MEMORY;
PRAGMA synchronous = OFF;
PRAGMA foreign_keys = OFF;
PRAGMA ignore_check_constraints = OFF;
PRAGMA auto_vacuum = NONE;
PRAGMA secure_delete = OFF;
BEGIN TRANSACTION;

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
`id` TEXT DEFAULT NULL,
`name` TEXT DEFAULT NULL
);
LOCK TABLES `auth_group` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
`id` TEXT DEFAULT NULL,
`group_id` TEXT DEFAULT NULL,
`permission_id` TEXT DEFAULT NULL
);
LOCK TABLES `auth_group_permissions` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
`id` tinyINTEGER DEFAULT NULL,
`content_type_id` tinyINTEGER DEFAULT NULL,
`codename` TEXT DEFAULT NULL,
`name` TEXT DEFAULT NULL
);
LOCK TABLES `auth_permission` WRITE;
INSERT INTO `auth_permission` VALUES (1,1,'add_logentry','Can add log entry'),(2,1,'change_logentry','Can change log entry'),(3,1,'delete_logentry','Can delete log entry'),(4,1,'view_logentry','Can view log entry'),(5,2,'add_permission','Can add permission'),(6,2,'change_permission','Can change permission'),(7,2,'delete_permission','Can delete permission'),(8,2,'view_permission','Can view permission'),(9,3,'add_group','Can add group'),(10,3,'change_group','Can change group'),(11,3,'delete_group','Can delete group'),(12,3,'view_group','Can view group'),(13,4,'add_user','Can add user'),(14,4,'change_user','Can change user'),(15,4,'delete_user','Can delete user'),(16,4,'view_user','Can view user'),(17,5,'add_contenttype','Can add content type'),(18,5,'change_contenttype','Can change content type'),(19,5,'delete_contenttype','Can delete content type'),(20,5,'view_contenttype','Can view content type'),(21,6,'add_session','Can add session'),(22,6,'change_session','Can change session'),(23,6,'delete_session','Can delete session'),(24,6,'view_session','Can view session'),(25,11,'add_utulek','Can add (''Útulek'',)'),(26,11,'change_utulek','Can change (''Útulek'',)'),(27,11,'delete_utulek','Can delete (''Útulek'',)'),(28,11,'view_utulek','Can view (''Útulek'',)'),(29,9,'add_pes','Can add (''Pes'',)'),(30,9,'change_pes','Can change (''Pes'',)'),(31,9,'delete_pes','Can delete (''Pes'',)'),(32,9,'view_pes','Can view (''Pes'',)'),(33,7,'add_mesto','Can add (''Město'',)'),(34,7,'change_mesto','Can change (''Město'',)'),(35,7,'delete_mesto','Can delete (''Město'',)'),(36,7,'view_mesto','Can view (''Město'',)'),(37,8,'add_osetrovatel','Can add (''Ošetřovatel'',)'),(38,8,'change_osetrovatel','Can change (''Ošetřovatel'',)'),(39,8,'delete_osetrovatel','Can delete (''Ošetřovatel'',)'),(40,8,'view_osetrovatel','Can view (''Ošetřovatel'',)'),(41,10,'add_zajemce','Can add (''Zájemce'',)'),(42,10,'change_zajemce','Can change (''Zájemce'',)'),(43,10,'delete_zajemce','Can delete (''Zájemce'',)'),(44,10,'view_zajemce','Can view (''Zájemce'',)');
UNLOCK TABLES;
DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
`id` tinyINTEGER DEFAULT NULL,
`password` TEXT DEFAULT NULL,
`last_login` TEXT DEFAULT NULL,
`is_superuser` tinyINTEGER DEFAULT NULL,
`username` TEXT DEFAULT NULL,
`last_name` TEXT DEFAULT NULL,
`email` TEXT DEFAULT NULL,
`is_staff` tinyINTEGER DEFAULT NULL,
`is_active` tinyINTEGER DEFAULT NULL,
`date_joined` TEXT DEFAULT NULL,
`first_name` TEXT DEFAULT NULL
);
LOCK TABLES `auth_user` WRITE;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$5EXqZDPhhjB29fTcPIjNHL$YdlzQ9CJgIl33P1ta6Xd8wytXWyGD15k6OA64EgfqAM=','2023-06-16',1,'admin','','admin@skola.cz',1,1,'2023-05-03','');
UNLOCK TABLES;
DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
`id` TEXT DEFAULT NULL,
`user_id` TEXT DEFAULT NULL,
`group_id` TEXT DEFAULT NULL
);
LOCK TABLES `auth_user_groups` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
`id` TEXT DEFAULT NULL,
`user_id` TEXT DEFAULT NULL,
`permission_id` TEXT DEFAULT NULL
);
LOCK TABLES `auth_user_user_permissions` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
`id` tinyINTEGER DEFAULT NULL,
`object_id` tinyINTEGER DEFAULT NULL,
`object_repr` TEXT DEFAULT NULL,
`action_flag` tinyINTEGER DEFAULT NULL,
`change_message` TEXT DEFAULT NULL,
`content_type_id` tinyINTEGER DEFAULT NULL,
`user_id` tinyINTEGER DEFAULT NULL,
`action_time` TEXT DEFAULT NULL
);
LOCK TABLES `django_admin_log` WRITE;
INSERT INTO `django_admin_log` VALUES (1,1,'mesto object (1)',1,'[{\"added\": {}}]',7,1,'2023-05-22'),(2,2,'mesto object (2)',1,'[{\"added\": {}}]',7,1,'2023-06-17'),(3,2,'mesto object (2)',3,'',7,1,'2023-06-17'),(4,1,'Městský útulek pro psy',1,'[{\"added\": {}}]',11,1,'2023-06-17'),(5,1,'Josef (Městský útulek pro psy)',1,'[{\"added\": {}}]',8,1,'2023-06-17'),(6,1,'Jan (mesto object (1))',1,'[{\"added\": {}}]',10,1,'2023-06-17'),(7,1,'Lajka (Městský útulek pro psy)',1,'[{\"added\": {}}]',9,1,'2023-06-17'),(8,3,'mesto object (3)',1,'[{\"added\": {}}]',7,1,'2023-06-18'),(9,2,'Psí útulek',1,'[{\"added\": {}}]',11,1,'2023-06-18'),(10,2,'Psí útulek',2,'[{\"changed\": {\"fields\": [\"Fotografie\"]}}]',11,1,'2023-06-19'),(11,1,'Městský útulek pro psy',2,'[{\"changed\": {\"fields\": [\"Fotografie\"]}}]',11,1,'2023-06-19'),(12,1,'Městský útulek pro psy',2,'[{\"changed\": {\"fields\": [\"Fotografie\"]}}]',11,1,'2023-06-19'),(13,1,'Městský útulek pro psy',2,'[{\"changed\": {\"fields\": [\"Fotografie\"]}}]',11,1,'2023-06-19'),(14,1,'Městský útulek pro psy',2,'[{\"changed\": {\"fields\": [\"Fotografie\"]}}]',11,1,'2023-06-19'),(15,1,'Městský útulek pro psy',2,'[{\"changed\": {\"fields\": [\"Fotografie\"]}}]',11,1,'2023-06-19'),(16,1,'Městský útulek pro psy',2,'[{\"changed\": {\"fields\": [\"Fotografie\"]}}]',11,1,'2023-06-19'),(17,2,'Psí útulek',2,'[{\"changed\": {\"fields\": [\"Fotografie\"]}}]',11,1,'2023-06-19'),(18,2,'Psí útulek',2,'[{\"changed\": {\"fields\": [\"Fotografie\"]}}]',11,1,'2023-06-19'),(19,2,'Psí útulek',2,'[]',11,1,'2023-06-19'),(20,1,'Městský útulek pro psy',2,'[{\"changed\": {\"fields\": [\"Fotografie\"]}}]',11,1,'2023-06-19'),(21,2,'Psí útulek',2,'[{\"changed\": {\"fields\": [\"Fotografie\"]}}]',11,1,'2023-06-19'),(22,2,'Psí útulek',2,'[]',11,1,'2023-06-19'),(23,1,'Městský útulek pro psy',2,'[{\"changed\": {\"fields\": [\"Fotografie\"]}}]',11,1,'2023-06-19'),(24,1,'Lajka (Městský útulek pro psy)',2,'[{\"changed\": {\"fields\": [\"Fotografie\"]}}]',9,1,'2023-06-19'),(25,1,'Lajka (Městský útulek pro psy)',2,'[{\"changed\": {\"fields\": [\"Vu011bk\"]}}]',9,1,'2023-06-20'),(26,1,'Lajka (Městský útulek pro psy)',2,'[{\"changed\": {\"fields\": [\"Ou010dkovu00e1nu00ed\"]}}]',9,1,'2023-06-20'),(27,1,'Lajka (Městský útulek pro psy)',2,'[{\"changed\": {\"fields\": [\"Ou010dkovu00e1nu00ed\"]}}]',9,1,'2023-06-20'),(28,1,'Lajka (Městský útulek pro psy)',2,'[]',9,1,'2023-06-20'),(29,2,'Psí útulek',2,'[{\"changed\": {\"fields\": [\"Mobil\", \"Cas od\", \"Cas do\", \"Popis\"]}}]',11,1,'2023-06-20'),(30,2,'Psí útulek',2,'[]',11,1,'2023-06-20'),(31,2,'Psí útulek',2,'[{\"changed\": {\"fields\": [\"Cas od\", \"Cas do\"]}}]',11,1,'2023-06-20'),(32,4,'mesto object (4)',1,'[{\"added\": {}}]',7,1,'2023-06-20'),(33,4,'mesto object (4)',2,'[]',7,1,'2023-06-20'),(34,3,'Liga na ochranu zvířat ČR',1,'[{\"added\": {}}]',11,1,'2023-06-20'),(35,5,'mesto object (5)',1,'[{\"added\": {}}]',7,1,'2023-06-20'),(36,4,'Šance pro jejich život, z.s.',1,'[{\"added\": {}}]',11,1,'2023-06-20'),(37,6,'mesto object (6)',1,'[{\"added\": {}}]',7,1,'2023-06-20'),(38,5,'Útulek pro zvířata v nouzi',1,'[{\"added\": {}}]',11,1,'2023-06-20'),(39,2,'Alík (Útulek pro zvířata v nouzi)',1,'[{\"added\": {}}]',9,1,'2023-06-20'),(40,3,'Andy (Městský útulek pro psy)',1,'[{\"added\": {}}]',9,1,'2023-06-20'),(41,4,'Bruno (Psí útulek)',1,'[{\"added\": {}}]',9,1,'2023-06-20'),(42,5,'Kazan (Liga na ochranu zvířat ČR)',1,'[{\"added\": {}}]',9,1,'2023-06-20'),(43,6,'Čiki (Šance pro jejich život, z.s.)',1,'[{\"added\": {}}]',9,1,'2023-06-20'),(44,1,'Městský útulek pro psy',2,'[{\"changed\": {\"fields\": [\"Mobil\", \"Cas od\", \"Cas do\", \"Popis\"]}}]',11,1,'2023-06-20'),(45,2,'Psí útulek',2,'[{\"changed\": {\"fields\": [\"Mobil\", \"Popis\"]}}]',11,1,'2023-06-20');
UNLOCK TABLES;
DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
`id` tinyINTEGER DEFAULT NULL,
`app_label` TEXT DEFAULT NULL,
`model` TEXT DEFAULT NULL
);
LOCK TABLES `django_content_type` WRITE;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'utulek','mesto'),(8,'utulek','osetrovatel'),(9,'utulek','pes'),(11,'utulek','utulek'),(10,'utulek','zajemce');
UNLOCK TABLES;
DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
`id` tinyINTEGER DEFAULT NULL,
`app` TEXT DEFAULT NULL,
`name` TEXT DEFAULT NULL,
`applied` TEXT DEFAULT NULL
);
LOCK TABLES `django_migrations` WRITE;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-05-03'),(2,'auth','0001_initial','2023-05-03'),(3,'admin','0001_initial','2023-05-03'),(4,'admin','0002_logentry_remove_auto_add','2023-05-03'),(5,'admin','0003_logentry_add_action_flag_choices','2023-05-03'),(6,'contenttypes','0002_remove_content_type_name','2023-05-03'),(7,'auth','0002_alter_permission_name_max_length','2023-05-03'),(8,'auth','0003_alter_user_email_max_length','2023-05-03'),(9,'auth','0004_alter_user_username_opts','2023-05-03'),(10,'auth','0005_alter_user_last_login_null','2023-05-03'),(11,'auth','0006_require_contenttypes_0002','2023-05-03'),(12,'auth','0007_alter_validators_add_error_messages','2023-05-03'),(13,'auth','0008_alter_user_username_max_length','2023-05-03'),(14,'auth','0009_alter_user_last_name_max_length','2023-05-03'),(15,'auth','0010_alter_group_name_max_length','2023-05-03'),(16,'auth','0011_update_proxy_permissions','2023-05-03'),(17,'auth','0012_alter_user_first_name_max_length','2023-05-03'),(18,'sessions','0001_initial','2023-05-03'),(19,'utulek','0001_initial','2023-05-22'),(20,'utulek','0002_utulek_fotografie','2023-06-18'),(21,'utulek','0003_pes_fotografie_alter_mesto_nazev_mesta','2023-06-19'),(22,'utulek','0004_pes_vek','2023-06-20'),(23,'utulek','0005_pes_ockovani','2023-06-20'),(24,'utulek','0006_utulek_popis_alter_pes_ockovani','2023-06-20'),(25,'utulek','0007_utulek_cas_do_utulek_cas_od_utulek_mobil','2023-06-20'),(26,'utulek','0008_alter_utulek_cas_do_alter_utulek_cas_od','2023-06-20'),(27,'utulek','0009_remove_mesto_psc','2023-06-20'),(28,'utulek','0010_pes_pohlavi','2023-06-20');
UNLOCK TABLES;
DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
`session_key` TEXT DEFAULT NULL,
`session_data` TEXT DEFAULT NULL,
`expire_date` TEXT DEFAULT NULL
);
LOCK TABLES `django_session` WRITE;
INSERT INTO `django_session` VALUES ('4bajmbw6q9my6d23j7edbofxxv0bu1e7','.eJxVjL0OwyAQg9-FuUL8JBA6ds8zIODuStoKpJBMVd-9RMrQLpblz_ab-bBv2e8NV78AuzLJLr9ZDOmJ5QDwCOVeeaplW5fIjwo_aeNzBXzdzu7fQQ4t93VU0o7JIKRRS2UGIhWmZJxGgNBVDIKEA4mgSaN0pBKB7S7aSShy7PMF8zw4Zg:1pwnIp:1RghENIRWFqkfVDbepqaoEu5mRis0EenRddNLRumEsQ','2023-05-24'),('84bifaag3z88wxjvphvs3sni3olkko73','.eJxVjL0OwyAQg9-FuUL8JBA6ds8zIODuStoKpJBMVd-9RMrQLpblz_ab-bBv2e8NV78AuzLJLr9ZDOmJ5QDwCOVeeaplW5fIjwo_aeNzBXzdzu7fQQ4t93VU0o7JIKRRS2UGIhWmZJxGgNBVDIKEA4mgSaN0pBKB7S7aSShy7PMF8zw4Zg:1qAD96:JnbOBL7b2IA-6D5-Y361qOifKdeU3ddpm1oD5-thB9Q','2023-06-30');
UNLOCK TABLES;
DROP TABLE IF EXISTS `sqlite_sequence`;

CREATE TABLE `sqlite_sequence` (
`name` TEXT DEFAULT NULL,
`seq` tinyINTEGER DEFAULT NULL
);
LOCK TABLES `sqlite_sequence` WRITE;
INSERT INTO `sqlite_sequence` VALUES ('django_migrations',28),('django_admin_log',45),('django_content_type',11),('auth_permission',44),('auth_group',0),('auth_user',1),('utulek_osetrovatel',1),('utulek_zajemce',1),('utulek_mesto',6),('utulek_utulek',5),('utulek_pes',6);
UNLOCK TABLES;
DROP TABLE IF EXISTS `utulek_mesto`;

CREATE TABLE `utulek_mesto` (
`id` tinyINTEGER DEFAULT NULL,
`kraj` TEXT DEFAULT NULL,
`nazev_mesta` TEXT DEFAULT NULL
);
LOCK TABLES `utulek_mesto` WRITE;
INSERT INTO `utulek_mesto` VALUES (1,'Moravsko Slezský','Opava'),(3,'Moravsko Slezský','Ostrava'),(4,'Olomoucký kraj','Olomouc'),(5,'Moravsko Slezský','Krnov'),(6,'Zlínský kraj','Zlín');
UNLOCK TABLES;
DROP TABLE IF EXISTS `utulek_osetrovatel`;

CREATE TABLE `utulek_osetrovatel` (
`id` tinyINTEGER DEFAULT NULL,
`jmeno` TEXT DEFAULT NULL,
`prijmeni` TEXT DEFAULT NULL,
`mobil` INTEGER DEFAULT NULL,
`utulek_nazev_id` tinyINTEGER DEFAULT NULL
);
LOCK TABLES `utulek_osetrovatel` WRITE;
INSERT INTO `utulek_osetrovatel` VALUES (1,'Josef','Malý',123456789,1);
UNLOCK TABLES;
DROP TABLE IF EXISTS `utulek_pes`;

CREATE TABLE `utulek_pes` (
`id` tinyINTEGER DEFAULT NULL,
`jmeno_psa` TEXT DEFAULT NULL,
`rasa` TEXT DEFAULT NULL,
`popis` text,
`utulek_nazev_id` tinyINTEGER DEFAULT NULL,
`fotografie` TEXT DEFAULT NULL,
`vek` tinyINTEGER DEFAULT NULL,
`ockovani` TEXT DEFAULT NULL,
`pohlavi` TEXT DEFAULT NULL
);
LOCK TABLES `utulek_pes` WRITE;
INSERT INTO `utulek_pes` VALUES (1,'Lajka','Oříšek','Je to velice zlobivé psisko. \r\n: (',1,'psi/images.jpg',7,'NE','0'),(2,'Alík','Kříženec střední velikosti','Alík je střední kříženec klidné povahy, kterému bohužel umřela majitelka. Byl zvyklý s ní žít v rodinném domě, nebyl zvyklý na děti, paní neměla ani kočky. Hledáme pro něho nový domov, kde by dožil s nějakou babičkou nebo dědečkem, který potřebuje nenáročného psíka – společníka. Máme Alíčka na provozní budově a víme, že je klidný a čistotný. Je to velký mazel, který si rád přijde pro pomazlení.',5,'psi/C0R_5575_0104379_00001.jpg',11,'ANO','0'),(3,'Andy','Kříženec labradora','Andy je kříženec labradora a border kolie. Má 9 let. Vyrůstal v rodině, kde se narodilo dítě a bohužel se stalo, že Andy na něho zavrčel a rodina se začala obávat. Byl zvyklý žít v bytě, chodili s ním na vycházky a zná i náhubek. Byl by možná vhodný do rodiny, kde by měl svůj klid a věděli, jak zvládat konfliktní situace. Je to ještě vitální psík, přijděte se na něho podívat na útulek…..',1,'psi/COR_7545_0120132_00001_1.jpg',10,'ANO','PES'),(4,'Bruno','kříženec velkého plemene','Bruno stále čeká na “svého” člověka. Musí to být osobnost a v očích Bruna opravdový vůdce. I když Bruno není pes pro každého, stále věříme, že někde je člověk s dostatkem zkušeností, ale i láskou tohoto velkého hafana zvládnout. V případě zájmu mu z počátku bude nápomocna Petra, která Bruna dobře zná a pomůže při seznamování, případně upozorní nového majitele na rizikové situace. Bruno si zaslouží další šanci...',2,'psi/C0R_8364_0093366_1.jpg',10,'ANO','PES'),(5,'Kazan','německý ovčák','Moc se za Kazana přimlouváme. Na útulku již čeká ¾ roku, jeho parťák Lesan odešel před půl rokem a Kazan stále neměl ještě to štěstí. Je to ještě aktivní pes, zvládá vycházky, má rád společnost člověka. Určitě by uvítal rodinný dům se zahradou, kde by mohl pobíhat a být se svou rodinou. Řešili jsme s ním problémy se zažíváním, ale ty naštěstí se teď ustálily při podávání hypoalergenních granulí. Na útulku dostává i kloubní výživu.',3,'psi/C0R_5899_0104636_00001.jpg',12,'ANO','PES'),(6,'Čiki','kříženec teriéra','Tak Čiki se nám bohužel po měsíci vrátil zpátky na útulek. Vypadalo to velmi nadějně, krásně si zvykl, ale zřejmě je velmi důležité u Čikiho dodržovat jednoduchá pravidla, aby nenastal problém (např. brát ho mezi lidi vždy s náhubkem, určovat mu doma, kde bude mít místo a nepolevit,….) Je dobré také vědět, že už nezvládá dlouhé výlety, stačí mu zahrádka nebo krátká procházka…..Dostane Čiki u někoho druhou šanci?',4,'psi/80C6CE08-FFD0-4A25-98F8-5BEB7346B091.jpeg',13,'ANO','PES');
UNLOCK TABLES;
DROP TABLE IF EXISTS `utulek_utulek`;

CREATE TABLE `utulek_utulek` (
`id` tinyINTEGER DEFAULT NULL,
`name` TEXT DEFAULT NULL,
`adresa` TEXT DEFAULT NULL,
`mesto_nazev_id` tinyINTEGER DEFAULT NULL,
`fotografie` TEXT DEFAULT NULL,
`popis` text,
`cas_do` TEXT DEFAULT NULL,
`mobil` INTEGER DEFAULT NULL,
`cas_od` TEXT DEFAULT NULL
);
LOCK TABLES `utulek_utulek` WRITE;
INSERT INTO `utulek_utulek` VALUES (1,'Městský útulek pro psy','Jaselská 2815, Předměstí',1,'utulky/op-utulek-pro-psy.jpg','Útulek byl původně zbudován za účelem umísťování nalezených psů. V nedávné době byly provedeny úpravy tak, aby zde v menší míře mohly být umístěny i nalezené nebo odchycené kočky a některá nalezená handicapovaná zvířata. U umístěných koček je prováděna kastrace a sterilizace v souladu s metodickým pokynem na regulaci výskytu zdivočelých koček.','22:45:40',553716980,'06:00:00'),(2,'Psí útulek','Provozní 5540',3,'utulky/ostrava.jpeg','Město Ostrava v roce 1998 zřídilo Útulek pro nalezené psy v Ostravě-Třebovicích. Jeho kapacita je 149 kotců, z toho 119 kotců je určeno pro zdravé psy a ostatní kotce jsou vyhrazeny pro umístění nově přijatých a nemocných psů. Pokud je pejsek přijat do našeho útulku, je mu poskytnuto základní veterinární vyšetření. Veterinář zkontroluje jeho zdravotní stav, provede odčervení, vakcinaci, ošetří zranění a provede další potřebná opatření. Po uplynutí karanténní lhůty je pes umístěn do kotce, kde čeká na svého nového majitele. Cílem útulku je poskytnutí maximální možné péče našim svěřencům.','20:14:30',599455191,'06:00:00'),(3,'Liga na ochranu zvířat ČR','areál letiště 726, Neředín',4,'utulky/348433825_997595437945693_492349480175400935_n.png','Liga na ochranu zvířat ČR je občanským sdružením, vzniklým z\r\nvůle občanů a z jejich práva na realisaci práv daných nám ústavou.\r\nMotivací a cílem je aktivní působení pro nastolení kulturního a\r\nhumánního vztahu k živočichům.','20:28:01',583210759,'06:00:00'),(4,'Šance pro jejich život, z.s.','K. Čapka 1135/8',5,'utulky/945010_288772597934711_1695476693_n.jpg','Opuštěným pejskům, které odchytnou strážníci Městské policie Krnov na území města Krnov naše město zajišťuje základní náhradní péči ve dvou útulcích. Jeden spravuje spolek Šance pro jejich život, z.s. v Hrozové a druhý psí útulek provozuje Tomáš Schulz ve Slezských Pavlovicích.','20:30:21',777134410,'06:00:00'),(5,'Útulek pro zvířata v nouzi','Mezilesí 628',6,'utulky/utulek1.jpg','Útulek je situován nedaleko zastavěné části Zlína a je přístupný městskou hromadnou dopravou. Kapacita útulku umožňuje umístit zde až 80 psů a 40 koček a může na přechodnou dobu sloužit i jako útočiště pro handicapovaná volně žijící zvířata, jako jsou například ježci a ptáci.','20:31:46',577244444,'06:00:00');
UNLOCK TABLES;
DROP TABLE IF EXISTS `utulek_zajemce`;

CREATE TABLE `utulek_zajemce` (
`id` tinyINTEGER DEFAULT NULL,
`jmeno_zajemce` TEXT DEFAULT NULL,
`prijmeni_zajemce` TEXT DEFAULT NULL,
`mobil_zajemce` INTEGER DEFAULT NULL,
`email` TEXT DEFAULT NULL,
`mesto_nazev_id` tinyINTEGER DEFAULT NULL
);
LOCK TABLES `utulek_zajemce` WRITE;
INSERT INTO `utulek_zajemce` VALUES (1,'Jan','Petržel',789456123,'jandement@seznam.cz',1);
UNLOCK TABLES;





COMMIT;
PRAGMA ignore_check_constraints = ON;
PRAGMA foreign_keys = ON;
PRAGMA journal_mode = WAL;
PRAGMA synchronous = NORMAL;