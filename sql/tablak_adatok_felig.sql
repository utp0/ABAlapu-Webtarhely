--------------------------------------------------------
--  File created - vasárnap-március-24-2024   
--------------------------------------------------------
DROP TABLE "CSOPORTOK" cascade constraints;
DROP TABLE "ELOFIZET" cascade constraints;
DROP TABLE "FAJLHOZ" cascade constraints;
DROP TABLE "FAJLOK" cascade constraints;
DROP TABLE "FELHASZNALOK" cascade constraints;
DROP TABLE "FELTOLTOTTE" cascade constraints;
DROP TABLE "IRTA" cascade constraints;
DROP TABLE "KAPTAFELADTA" cascade constraints;
DROP TABLE "KOMMENTEK" cascade constraints;
DROP TABLE "SZOLGALTATASOK" cascade constraints;
DROP TABLE "TAGJA" cascade constraints;
DROP TABLE "UZENETEK" cascade constraints;
DROP TABLE "FELHASZNALOK" cascade constraints;
DROP TABLE "SZOLGALTATASOK" cascade constraints;
DROP TABLE "FAJLOK" cascade constraints;
DROP TABLE "KOMMENTEK" cascade constraints;
DROP TABLE "UZENETEK" cascade constraints;
DROP TABLE "CSOPORTOK" cascade constraints;
DROP TABLE "FAJLHOZ" cascade constraints;
--------------------------------------------------------
--  DDL for Sequence SEQ_CSOPORTOK_ID
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_CSOPORTOK_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_FAJLOK
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_FAJLOK"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 101 CACHE 20 ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence KOMMENTEK_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "KOMMENTEK_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence UZENETEK_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "UZENETEK_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table CSOPORTOK
--------------------------------------------------------

  CREATE TABLE "CSOPORTOK" 
   (	"ID" NUMBER(16,0), 
	"NEV" VARCHAR2(150 BYTE), 
	"LEIRAS" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT);
--------------------------------------------------------
--  DDL for Table ELOFIZET
--------------------------------------------------------

  CREATE TABLE "ELOFIZET" 
   (	"NEV_FELHASZNALO" VARCHAR2(64 BYTE), 
	"NEV_SZOLGALTATAS" VARCHAR2(150 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT);
--------------------------------------------------------
--  DDL for Table FAJLHOZ
--------------------------------------------------------

  CREATE TABLE "FAJLHOZ" 
   (	"ID_FAJL" NUMBER(16,0), 
	"ID_KOMMENT" NUMBER(16,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING;
--------------------------------------------------------
--  DDL for Table FAJLOK
--------------------------------------------------------

  CREATE TABLE "FAJLOK" 
   (	"ID" NUMBER(16,0), 
	"NEV" VARCHAR2(255 BYTE), 
	"MAPPA" NUMBER(2,0), 
	"MERET" NUMBER(16,0), 
	"PATH" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT);
--------------------------------------------------------
--  DDL for Table FELHASZNALOK
--------------------------------------------------------

  CREATE TABLE "FELHASZNALOK" 
   (	"NEV" VARCHAR2(64 BYTE), 
	"EMAIL" VARCHAR2(255 BYTE), 
	"JOGOSULTSAG" NUMBER(2,0), 
	"JELSZO" VARCHAR2(255 BYTE), 
	"BELEPES" DATE, 
	"REGISZTRACIO" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT);
--------------------------------------------------------
--  DDL for Table FELTOLTOTTE
--------------------------------------------------------

  CREATE TABLE "FELTOLTOTTE" 
   (	"ID_FAJL" NUMBER(16,0), 
	"NEV_FELHASZNALO" VARCHAR2(64 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT);
--------------------------------------------------------
--  DDL for Table IRTA
--------------------------------------------------------

  CREATE TABLE "IRTA" 
   (	"NEV_FELHASZNALO" VARCHAR2(64 BYTE), 
	"ID_KOMMENT" NUMBER(16,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING;
--------------------------------------------------------
--  DDL for Table KAPTAFELADTA
--------------------------------------------------------

  CREATE TABLE "KAPTAFELADTA" 
   (	"NEV_KULDO" VARCHAR2(64 BYTE), 
	"NEV_FOGADO" VARCHAR2(64 BYTE), 
	"ID_UZENET" NUMBER(16,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING;
--------------------------------------------------------
--  DDL for Table KOMMENTEK
--------------------------------------------------------

  CREATE TABLE "KOMMENTEK" 
   (	"ID" NUMBER(16,0), 
	"SZOVEG" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT);
--------------------------------------------------------
--  DDL for Table SZOLGALTATASOK
--------------------------------------------------------

  CREATE TABLE "SZOLGALTATASOK" 
   (	"NEV" VARCHAR2(150 BYTE), 
	"AR" NUMBER(16,0), 
	"LEIRAS" VARCHAR2(4000 BYTE), 
	"MERET" NUMBER(16,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT);

   COMMENT ON COLUMN "SZOLGALTATASOK"."NEV" IS 'csomag neve';
   COMMENT ON COLUMN "SZOLGALTATASOK"."AR" IS 'ár Ft-ban';
   COMMENT ON COLUMN "SZOLGALTATASOK"."LEIRAS" IS 'csomag leírása';
   COMMENT ON COLUMN "SZOLGALTATASOK"."MERET" IS 'méret MiB-ban';
--------------------------------------------------------
--  DDL for Table TAGJA
--------------------------------------------------------

  CREATE TABLE "TAGJA" 
   (	"NEV_FELHASZNALO" VARCHAR2(64 BYTE), 
	"ID_CSOPORT" NUMBER(16,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING;
--------------------------------------------------------
--  DDL for Table UZENETEK
--------------------------------------------------------

  CREATE TABLE "UZENETEK" 
   (	"ID" NUMBER(16,0), 
	"SZOVEG" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING;

   COMMENT ON COLUMN "UZENETEK"."SZOVEG" IS 'üzenet szövege/tartalma';
--------------------------------------------------------
--  DDL for Table FELHASZNALOK
--------------------------------------------------------

  CREATE TABLE "FELHASZNALOK" 
   (	"NEV" VARCHAR2(64 BYTE), 
	"EMAIL" VARCHAR2(255 BYTE), 
	"JOGOSULTSAG" NUMBER(2,0), 
	"JELSZO" VARCHAR2(255 BYTE), 
	"BELEPES" DATE, 
	"REGISZTRACIO" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT);
--------------------------------------------------------
--  DDL for Table SZOLGALTATASOK
--------------------------------------------------------

  CREATE TABLE "SZOLGALTATASOK" 
   (	"NEV" VARCHAR2(150 BYTE), 
	"AR" NUMBER(16,0), 
	"LEIRAS" VARCHAR2(4000 BYTE), 
	"MERET" NUMBER(16,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT);

   COMMENT ON COLUMN "SZOLGALTATASOK"."NEV" IS 'csomag neve';
   COMMENT ON COLUMN "SZOLGALTATASOK"."AR" IS 'ár Ft-ban';
   COMMENT ON COLUMN "SZOLGALTATASOK"."LEIRAS" IS 'csomag leírása';
   COMMENT ON COLUMN "SZOLGALTATASOK"."MERET" IS 'méret MiB-ban';
--------------------------------------------------------
--  DDL for Table FAJLOK
--------------------------------------------------------

  CREATE TABLE "FAJLOK" 
   (	"ID" NUMBER(16,0), 
	"NEV" VARCHAR2(255 BYTE), 
	"MAPPA" NUMBER(2,0), 
	"MERET" NUMBER(16,0), 
	"PATH" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT);
--------------------------------------------------------
--  DDL for Table KOMMENTEK
--------------------------------------------------------

  CREATE TABLE "KOMMENTEK" 
   (	"ID" NUMBER(16,0), 
	"SZOVEG" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT);
--------------------------------------------------------
--  DDL for Table UZENETEK
--------------------------------------------------------

  CREATE TABLE "UZENETEK" 
   (	"ID" NUMBER(16,0), 
	"SZOVEG" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING;

   COMMENT ON COLUMN "UZENETEK"."SZOVEG" IS 'üzenet szövege/tartalma';
--------------------------------------------------------
--  DDL for Table CSOPORTOK
--------------------------------------------------------

  CREATE TABLE "CSOPORTOK" 
   (	"ID" NUMBER(16,0), 
	"NEV" VARCHAR2(150 BYTE), 
	"LEIRAS" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT);
--------------------------------------------------------
--  DDL for Table FAJLHOZ
--------------------------------------------------------

  CREATE TABLE "FAJLHOZ" 
   (	"ID_FAJL" NUMBER(16,0), 
	"ID_KOMMENT" NUMBER(16,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING;
REM INSERTING into CSOPORTOK
SET DEFINE OFF;
REM INSERTING into ELOFIZET
SET DEFINE OFF;
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser1','Alap');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser2','Alap');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser3','Alap');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser4','Alap');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser5','Alap');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser6','Alap');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser7','Alap');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser8','Alap');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser9','Alap');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser10','Alap');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser11','Alap');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser12','Alap');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser13','Alap');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser14','Alap');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser15','Alap');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser16','Alap');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser17','Alap');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser18','Alap');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser19','Alap');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser20','Alap');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser21','Alap');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser22','Alap');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser23','Alap');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser24','Alap');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser25','Extra');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser26','Extra');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser27','Extra');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser28','Extra');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser29','Extra');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser30','Extra');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser31','Extra');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser32','Extra');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser33','Extra');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser34','Extra');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser35','Extra');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser36','Extra');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser37','Extra');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser38','Extra');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser39','Extra');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser40','Extra');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser41','Extra');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser42','Extra');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser43','Extra');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser44','Extra');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser45','Extra');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser46','Extra');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser47','Extra');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser48','Extra');
Insert into ELOFIZET (NEV_FELHASZNALO,NEV_SZOLGALTATAS) values ('exampleuser49','Extra');
REM INSERTING into FAJLHOZ
SET DEFINE OFF;
REM INSERTING into FAJLOK
SET DEFINE OFF;
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (4,'szovegesfajl2.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (2,'asd',2,1,'aadsds');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (3,'szovegesfajl1.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (5,'szovegesfajl3.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (6,'szovegesfajl4.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (7,'szovegesfajl5.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (8,'szovegesfajl6.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (9,'szovegesfajl7.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (10,'szovegesfajl8.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (11,'szovegesfajl9.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (12,'szovegesfajl10.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (13,'szovegesfajl11.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (14,'szovegesfajl12.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (15,'szovegesfajl13.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (16,'szovegesfajl14.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (17,'szovegesfajl15.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (18,'szovegesfajl16.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (19,'szovegesfajl17.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (20,'szovegesfajl18.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (21,'szovegesfajl19.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (22,'szovegesfajl20.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (23,'szovegesfajl21.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (24,'szovegesfajl22.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (25,'szovegesfajl23.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (26,'szovegesfajl24.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (27,'szovegesfajl25.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (28,'szovegesfajl26.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (29,'szovegesfajl27.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (30,'szovegesfajl28.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (31,'szovegesfajl29.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (32,'szovegesfajl30.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (33,'szovegesfajl31.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (34,'szovegesfajl32.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (35,'szovegesfajl33.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (36,'szovegesfajl34.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (37,'szovegesfajl35.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (38,'szovegesfajl36.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (39,'szovegesfajl37.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (40,'szovegesfajl38.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (41,'szovegesfajl39.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (42,'szovegesfajl40.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (43,'szovegesfajl41.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (44,'szovegesfajl42.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (45,'szovegesfajl43.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (46,'szovegesfajl44.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (47,'szovegesfajl45.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (48,'szovegesfajl46.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (49,'szovegesfajl47.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (50,'szovegesfajl48.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (51,'szovegesfajl49.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (52,'szovegesfajl50.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (53,'szovegesfajl51.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (54,'szovegesfajl52.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (55,'szovegesfajl53.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (56,'szovegesfajl54.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (57,'szovegesfajl55.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (58,'szovegesfajl56.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (59,'szovegesfajl57.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (60,'szovegesfajl58.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (61,'szovegesfajl59.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (62,'szovegesfajl60.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (63,'szovegesfajl61.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (64,'szovegesfajl62.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (65,'szovegesfajl63.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (66,'szovegesfajl64.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (67,'szovegesfajl65.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (68,'szovegesfajl66.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (69,'szovegesfajl67.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (70,'szovegesfajl68.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (71,'szovegesfajl69.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (72,'szovegesfajl70.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (73,'szovegesfajl71.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (74,'szovegesfajl72.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (75,'szovegesfajl73.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (76,'szovegesfajl74.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (77,'szovegesfajl75.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (78,'szovegesfajl76.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (79,'szovegesfajl77.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (80,'szovegesfajl78.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (81,'szovegesfajl79.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (82,'szovegesfajl80.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (83,'szovegesfajl81.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (84,'szovegesfajl82.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (85,'szovegesfajl83.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (86,'szovegesfajl84.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (87,'szovegesfajl85.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (88,'szovegesfajl86.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (89,'szovegesfajl87.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (90,'szovegesfajl88.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (91,'szovegesfajl89.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (92,'szovegesfajl90.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (93,'szovegesfajl91.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (94,'szovegesfajl92.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (95,'szovegesfajl93.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (96,'szovegesfajl94.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (97,'szovegesfajl95.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (98,'szovegesfajl96.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (99,'szovegesfajl97.txt',0,0,'/');
Insert into FAJLOK (ID,NEV,MAPPA,MERET,PATH) values (100,'szovegesfajl98.txt',0,0,'/');
REM INSERTING into FELHASZNALOK
SET DEFINE OFF;
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('john_e56','john56@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('worcestershire','worcester@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('admin','admin@local',1,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('henry07','henry@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser1','exampleuser1@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser2','exampleuser2@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser3','exampleuser3@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser4','exampleuser4@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser5','exampleuser5@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser6','exampleuser6@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser7','exampleuser7@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser8','exampleuser8@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser9','exampleuser9@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser10','exampleuser10@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser11','exampleuser11@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser12','exampleuser12@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser13','exampleuser13@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser14','exampleuser14@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser15','exampleuser15@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser16','exampleuser16@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser17','exampleuser17@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser18','exampleuser18@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser19','exampleuser19@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser20','exampleuser20@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser21','exampleuser21@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser22','exampleuser22@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser23','exampleuser23@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser24','exampleuser24@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser25','exampleuser25@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser26','exampleuser26@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser27','exampleuser27@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser28','exampleuser28@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser29','exampleuser29@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser30','exampleuser30@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser31','exampleuser31@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser32','exampleuser32@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser33','exampleuser33@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser34','exampleuser34@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser35','exampleuser35@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser36','exampleuser36@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser37','exampleuser37@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser38','exampleuser38@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser39','exampleuser39@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser40','exampleuser40@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser41','exampleuser41@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser42','exampleuser42@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser43','exampleuser43@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser44','exampleuser44@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser45','exampleuser45@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser46','exampleuser46@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser47','exampleuser47@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser48','exampleuser48@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
Insert into FELHASZNALOK (NEV,EMAIL,JOGOSULTSAG,JELSZO,BELEPES,REGISZTRACIO) values ('exampleuser49','exampleuser49@example.com',0,'$2a$10$fx0pjfnv5lVhhzXtIbO5veylAKxQ/Wybon5NycA9WYR1y/D670jWe',to_date('17-MAR-24','DD-MON-RR'),to_date('07-FEB-24','DD-MON-RR'));
REM INSERTING into FELTOLTOTTE
SET DEFINE OFF;
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (4,'exampleuser1');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (5,'exampleuser2');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (6,'exampleuser3');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (7,'exampleuser4');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (8,'exampleuser5');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (9,'exampleuser6');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (10,'exampleuser7');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (11,'exampleuser8');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (12,'exampleuser9');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (13,'exampleuser10');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (14,'exampleuser11');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (15,'exampleuser12');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (16,'exampleuser13');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (17,'exampleuser14');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (18,'exampleuser15');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (19,'exampleuser16');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (20,'exampleuser17');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (21,'exampleuser18');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (22,'exampleuser19');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (23,'exampleuser20');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (24,'exampleuser21');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (25,'exampleuser22');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (26,'exampleuser23');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (27,'exampleuser24');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (28,'exampleuser25');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (29,'exampleuser26');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (30,'exampleuser27');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (31,'exampleuser28');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (32,'exampleuser29');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (33,'exampleuser30');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (34,'exampleuser31');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (35,'exampleuser32');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (36,'exampleuser33');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (37,'exampleuser34');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (38,'exampleuser35');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (39,'exampleuser36');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (40,'exampleuser37');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (41,'exampleuser38');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (42,'exampleuser39');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (43,'exampleuser40');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (44,'exampleuser41');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (45,'exampleuser42');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (46,'exampleuser43');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (47,'exampleuser44');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (48,'exampleuser45');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (49,'exampleuser46');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (50,'exampleuser47');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (51,'exampleuser48');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (52,'exampleuser49');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (53,'exampleuser1');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (54,'exampleuser2');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (55,'exampleuser3');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (56,'exampleuser4');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (57,'exampleuser5');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (58,'exampleuser6');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (59,'exampleuser7');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (60,'exampleuser8');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (61,'exampleuser9');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (62,'exampleuser10');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (63,'exampleuser11');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (64,'exampleuser12');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (65,'exampleuser13');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (66,'exampleuser14');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (67,'exampleuser15');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (68,'exampleuser16');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (69,'exampleuser17');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (70,'exampleuser18');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (71,'exampleuser19');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (72,'exampleuser20');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (73,'exampleuser21');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (74,'exampleuser22');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (75,'exampleuser23');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (76,'exampleuser24');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (77,'exampleuser25');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (78,'exampleuser26');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (79,'exampleuser27');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (80,'exampleuser28');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (81,'exampleuser29');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (82,'exampleuser30');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (83,'exampleuser31');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (84,'exampleuser32');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (85,'exampleuser33');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (86,'exampleuser34');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (87,'exampleuser35');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (88,'exampleuser36');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (89,'exampleuser37');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (90,'exampleuser38');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (91,'exampleuser39');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (92,'exampleuser40');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (93,'exampleuser41');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (94,'exampleuser42');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (95,'exampleuser43');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (96,'exampleuser44');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (97,'exampleuser45');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (98,'exampleuser46');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (99,'exampleuser47');
Insert into FELTOLTOTTE (ID_FAJL,NEV_FELHASZNALO) values (100,'exampleuser48');
REM INSERTING into IRTA
SET DEFINE OFF;
REM INSERTING into KAPTAFELADTA
SET DEFINE OFF;
REM INSERTING into KOMMENTEK
SET DEFINE OFF;
REM INSERTING into SZOLGALTATASOK
SET DEFINE OFF;
Insert into SZOLGALTATASOK (NEV,AR,LEIRAS,MERET) values ('Alap',200,'5GB tárhely.',5120);
Insert into SZOLGALTATASOK (NEV,AR,LEIRAS,MERET) values ('Extra',1900,'50GB tárhely. Ez már mindenre elég.',51200);
REM INSERTING into TAGJA
SET DEFINE OFF;
REM INSERTING into UZENETEK
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index CSOPORTOK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CSOPORTOK_PK" ON "CSOPORTOK" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT);
--------------------------------------------------------
--  DDL for Index CSOPORTOK_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "CSOPORTOK_UK1" ON "CSOPORTOK" ("NEV") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT);
--------------------------------------------------------
--  DDL for Index FAJLOK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FAJLOK_PK" ON "FAJLOK" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT);
--------------------------------------------------------
--  DDL for Index FELHASZNALOK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FELHASZNALOK_PK" ON "FELHASZNALOK" ("NEV") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT);
--------------------------------------------------------
--  DDL for Index KOMMENTEK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KOMMENTEK_PK" ON "KOMMENTEK" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT);
--------------------------------------------------------
--  DDL for Index SZOLGALTATAS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SZOLGALTATAS_PK" ON "SZOLGALTATASOK" ("NEV") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT);
--------------------------------------------------------
--  DDL for Index UZENETEK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "UZENETEK_PK" ON "UZENETEK" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS ;
--------------------------------------------------------
--  DDL for Trigger CSOPORTOK_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CSOPORTOK_TRG" 
BEFORE INSERT ON CSOPORTOK 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING THEN
      SELECT SEQ_CSOPORTOK_ID.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CSOPORTOK_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger FAJLHOZ_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "FAJLHOZ_TRG" 
BEFORE INSERT ON FAJLHOZ 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID_FAJL IS NULL THEN
      SELECT FAJLHOZ_SEQ.NEXTVAL INTO :NEW.ID_FAJL FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "FAJLHOZ_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger FAJLOK_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "FAJLOK_TRG" 
BEFORE INSERT ON FAJLOK 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING THEN
      SELECT SEQ_FAJLOK.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "FAJLOK_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger KOMMENTEK_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "KOMMENTEK_TRG" 
BEFORE INSERT ON KOMMENTEK 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING THEN
      SELECT KOMMENTEK_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "KOMMENTEK_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UZENETEK_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "UZENETEK_TRG" 
BEFORE INSERT ON UZENETEK 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING THEN
      SELECT UZENETEK_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "UZENETEK_TRG" ENABLE;
--------------------------------------------------------
--  Constraints for Table CSOPORTOK
--------------------------------------------------------

  ALTER TABLE "CSOPORTOK" ADD CONSTRAINT "CSOPORTOK_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) ENABLE;
  ALTER TABLE "CSOPORTOK" ADD CONSTRAINT "CSOPORTOK_UK1" UNIQUE ("NEV")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) ENABLE;
  ALTER TABLE "CSOPORTOK" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CSOPORTOK" MODIFY ("NEV" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ELOFIZET
--------------------------------------------------------

  ALTER TABLE "ELOFIZET" MODIFY ("NEV_FELHASZNALO" NOT NULL ENABLE);
  ALTER TABLE "ELOFIZET" MODIFY ("NEV_SZOLGALTATAS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FAJLHOZ
--------------------------------------------------------

  ALTER TABLE "FAJLHOZ" MODIFY ("ID_FAJL" NOT NULL ENABLE);
  ALTER TABLE "FAJLHOZ" MODIFY ("ID_KOMMENT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FAJLOK
--------------------------------------------------------

  ALTER TABLE "FAJLOK" ADD CONSTRAINT "FAJLOK_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) ENABLE;
  ALTER TABLE "FAJLOK" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FELHASZNALOK
--------------------------------------------------------

  ALTER TABLE "FELHASZNALOK" ADD CONSTRAINT "FELHASZNALOK_PK" PRIMARY KEY ("NEV")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) ENABLE;
  ALTER TABLE "FELHASZNALOK" MODIFY ("NEV" NOT NULL ENABLE);
  ALTER TABLE "FELHASZNALOK" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "FELHASZNALOK" MODIFY ("REGISZTRACIO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FELTOLTOTTE
--------------------------------------------------------

  ALTER TABLE "FELTOLTOTTE" MODIFY ("ID_FAJL" NOT NULL ENABLE);
  ALTER TABLE "FELTOLTOTTE" MODIFY ("NEV_FELHASZNALO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table IRTA
--------------------------------------------------------

  ALTER TABLE "IRTA" MODIFY ("NEV_FELHASZNALO" NOT NULL ENABLE);
  ALTER TABLE "IRTA" MODIFY ("ID_KOMMENT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table KAPTAFELADTA
--------------------------------------------------------

  ALTER TABLE "KAPTAFELADTA" MODIFY ("NEV_KULDO" NOT NULL ENABLE);
  ALTER TABLE "KAPTAFELADTA" MODIFY ("NEV_FOGADO" NOT NULL ENABLE);
  ALTER TABLE "KAPTAFELADTA" MODIFY ("ID_UZENET" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table KOMMENTEK
--------------------------------------------------------

  ALTER TABLE "KOMMENTEK" ADD CONSTRAINT "KOMMENTEK_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) ENABLE;
  ALTER TABLE "KOMMENTEK" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SZOLGALTATASOK
--------------------------------------------------------

  ALTER TABLE "SZOLGALTATASOK" MODIFY ("NEV" NOT NULL ENABLE);
  ALTER TABLE "SZOLGALTATASOK" MODIFY ("AR" NOT NULL ENABLE);
  ALTER TABLE "SZOLGALTATASOK" MODIFY ("MERET" NOT NULL ENABLE);
  ALTER TABLE "SZOLGALTATASOK" ADD CONSTRAINT "SZOLGALTATAS_PK" PRIMARY KEY ("NEV")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) ENABLE;
--------------------------------------------------------
--  Constraints for Table TAGJA
--------------------------------------------------------

  ALTER TABLE "TAGJA" MODIFY ("NEV_FELHASZNALO" NOT NULL ENABLE);
  ALTER TABLE "TAGJA" MODIFY ("ID_CSOPORT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table UZENETEK
--------------------------------------------------------

  ALTER TABLE "UZENETEK" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "UZENETEK" MODIFY ("SZOVEG" NOT NULL ENABLE);
  ALTER TABLE "UZENETEK" ADD CONSTRAINT "UZENETEK_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ELOFIZET
--------------------------------------------------------

  ALTER TABLE "ELOFIZET" ADD CONSTRAINT "ELOFIZET_FK1" FOREIGN KEY ("NEV_FELHASZNALO")
	  REFERENCES "FELHASZNALOK" ("NEV") ON DELETE CASCADE ENABLE;
  ALTER TABLE "ELOFIZET" ADD CONSTRAINT "ELOFIZET_FK2" FOREIGN KEY ("NEV_SZOLGALTATAS")
	  REFERENCES "SZOLGALTATASOK" ("NEV") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FAJLHOZ
--------------------------------------------------------

  ALTER TABLE "FAJLHOZ" ADD CONSTRAINT "FAJL_KOMMENT_FK1" FOREIGN KEY ("ID_FAJL")
	  REFERENCES "FAJLOK" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "FAJLHOZ" ADD CONSTRAINT "FAJL_KOMMENT_FK2" FOREIGN KEY ("ID_FAJL")
	  REFERENCES "KOMMENTEK" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FELTOLTOTTE
--------------------------------------------------------

  ALTER TABLE "FELTOLTOTTE" ADD CONSTRAINT "FAJL_FELHASZNALO_FK1" FOREIGN KEY ("ID_FAJL")
	  REFERENCES "FAJLOK" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "FELTOLTOTTE" ADD CONSTRAINT "FAJL_FELHASZNALO_FK2" FOREIGN KEY ("NEV_FELHASZNALO")
	  REFERENCES "FELHASZNALOK" ("NEV") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table IRTA
--------------------------------------------------------

  ALTER TABLE "IRTA" ADD CONSTRAINT "IRTA_FK1" FOREIGN KEY ("NEV_FELHASZNALO")
	  REFERENCES "FELHASZNALOK" ("NEV") ON DELETE CASCADE ENABLE;
  ALTER TABLE "IRTA" ADD CONSTRAINT "IRTA_FK2" FOREIGN KEY ("ID_KOMMENT")
	  REFERENCES "KOMMENTEK" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table KAPTAFELADTA
--------------------------------------------------------

  ALTER TABLE "KAPTAFELADTA" ADD CONSTRAINT "KAPTAFELADTA_FK1" FOREIGN KEY ("NEV_KULDO")
	  REFERENCES "FELHASZNALOK" ("NEV") ON DELETE CASCADE ENABLE;
  ALTER TABLE "KAPTAFELADTA" ADD CONSTRAINT "KAPTAFELADTA_FK2" FOREIGN KEY ("NEV_FOGADO")
	  REFERENCES "FELHASZNALOK" ("NEV") ON DELETE CASCADE ENABLE;
  ALTER TABLE "KAPTAFELADTA" ADD CONSTRAINT "KAPTAFELADTA_FK3" FOREIGN KEY ("ID_UZENET")
	  REFERENCES "UZENETEK" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TAGJA
--------------------------------------------------------

  ALTER TABLE "TAGJA" ADD CONSTRAINT "TAGJA_FK1" FOREIGN KEY ("NEV_FELHASZNALO")
	  REFERENCES "FELHASZNALOK" ("NEV") ON DELETE CASCADE ENABLE;
  ALTER TABLE "TAGJA" ADD CONSTRAINT "TAGJA_FK2" FOREIGN KEY ("ID_CSOPORT")
	  REFERENCES "CSOPORTOK" ("ID") ON DELETE CASCADE ENABLE;
