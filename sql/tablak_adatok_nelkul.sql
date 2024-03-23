--------------------------------------------------------
--  File created - szombat-március-23-2024   
--------------------------------------------------------
DROP TABLE "CSOPORTOK" cascade constraints;
DROP TABLE "ELOFIZET" cascade constraints;
DROP TABLE "FELTOLTOTTE" cascade constraints;
DROP TABLE "FAJLHOZ" cascade constraints;
DROP TABLE "FAJLOK" cascade constraints;
DROP TABLE "FELHASZNALOK" cascade constraints;
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
--------------------------------------------------------
--  DDL for Table CSOPORTOK
--------------------------------------------------------

  CREATE TABLE "CSOPORTOK" 
   (	"ID" NUMBER(16,0), 
	"NEV" VARCHAR2(150 BYTE), 
	"LEIRAS" VARCHAR2(4000 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table ELOFIZET
--------------------------------------------------------

  CREATE TABLE "ELOFIZET" 
   (	"NEV_FELHASZNALO" VARCHAR2(64 BYTE), 
	"NEV_SZOLGALTATAS" VARCHAR2(150 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table FELTOLTOTTE
--------------------------------------------------------

  CREATE TABLE "FELTOLTOTTE" 
   (	"ID_FAJL" NUMBER(16,0), 
	"NEV_FELHASZNALO" VARCHAR2(64 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table FAJLHOZ
--------------------------------------------------------

  CREATE TABLE "FAJLHOZ" 
   (	"ID_FAJL" NUMBER(16,0), 
	"ID_KOMMENT" NUMBER(16,0)
   ) ;
--------------------------------------------------------
--  DDL for Table FAJLOK
--------------------------------------------------------

  CREATE TABLE "FAJLOK" 
   (	"ID" NUMBER(16,0), 
	"NEV" VARCHAR2(255 BYTE), 
	"MAPPA" NUMBER(16,0), 
	"MERET" NUMBER(16,0), 
	"PATH" VARCHAR2(255 BYTE)
   ) ;
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
   ) ;
--------------------------------------------------------
--  DDL for Table IRTA
--------------------------------------------------------

  CREATE TABLE "IRTA" 
   (	"NEV_FELHASZNALO" VARCHAR2(64 BYTE), 
	"ID_KOMMENT" NUMBER(16,0)
   ) ;
--------------------------------------------------------
--  DDL for Table KAPTAFELADTA
--------------------------------------------------------

  CREATE TABLE "KAPTAFELADTA" 
   (	"NEV_KULDO" VARCHAR2(64 BYTE), 
	"NEV_FOGADO" VARCHAR2(64 BYTE), 
	"ID_UZENET" NUMBER(16,0)
   ) ;
--------------------------------------------------------
--  DDL for Table KOMMENTEK
--------------------------------------------------------

  CREATE TABLE "KOMMENTEK" 
   (	"ID" NUMBER(16,0), 
	"SZOVEG" VARCHAR2(4000 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table SZOLGALTATASOK
--------------------------------------------------------

  CREATE TABLE "SZOLGALTATASOK" 
   (	"NEV" VARCHAR2(150 BYTE), 
	"AR" NUMBER(16,0), 
	"LEIRAS" VARCHAR2(4000 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table TAGJA
--------------------------------------------------------

  CREATE TABLE "TAGJA" 
   (	"NEV_FELHASZNALO" VARCHAR2(64 BYTE), 
	"ID_CSOPORT" NUMBER(16,0)
   ) ;
--------------------------------------------------------
--  DDL for Table UZENETEK
--------------------------------------------------------

  CREATE TABLE "UZENETEK" 
   (	"ID" NUMBER(16,0), 
	"SZOVEG" VARCHAR2(4000 BYTE)
   ) ;
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
   ) ;
--------------------------------------------------------
--  DDL for Table SZOLGALTATASOK
--------------------------------------------------------

  CREATE TABLE "SZOLGALTATASOK" 
   (	"NEV" VARCHAR2(150 BYTE), 
	"AR" NUMBER(16,0), 
	"LEIRAS" VARCHAR2(4000 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table FAJLOK
--------------------------------------------------------

  CREATE TABLE "FAJLOK" 
   (	"ID" NUMBER(16,0), 
	"NEV" VARCHAR2(255 BYTE), 
	"MAPPA" NUMBER(16,0), 
	"MERET" NUMBER(16,0), 
	"PATH" VARCHAR2(255 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table KOMMENTEK
--------------------------------------------------------

  CREATE TABLE "KOMMENTEK" 
   (	"ID" NUMBER(16,0), 
	"SZOVEG" VARCHAR2(4000 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table UZENETEK
--------------------------------------------------------

  CREATE TABLE "UZENETEK" 
   (	"ID" NUMBER(16,0), 
	"SZOVEG" VARCHAR2(4000 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table CSOPORTOK
--------------------------------------------------------

  CREATE TABLE "CSOPORTOK" 
   (	"ID" NUMBER(16,0), 
	"NEV" VARCHAR2(150 BYTE), 
	"LEIRAS" VARCHAR2(4000 BYTE)
   ) ;
REM INSERTING into CSOPORTOK
SET DEFINE OFF;
REM INSERTING into ELOFIZET
SET DEFINE OFF;
REM INSERTING into FELTOLTOTTE
SET DEFINE OFF;
REM INSERTING into FAJLHOZ
SET DEFINE OFF;
REM INSERTING into FAJLOK
SET DEFINE OFF;
REM INSERTING into FELHASZNALOK
SET DEFINE OFF;
REM INSERTING into IRTA
SET DEFINE OFF;
REM INSERTING into KAPTAFELADTA
SET DEFINE OFF;
REM INSERTING into KOMMENTEK
SET DEFINE OFF;
REM INSERTING into SZOLGALTATASOK
SET DEFINE OFF;
REM INSERTING into TAGJA
SET DEFINE OFF;
REM INSERTING into UZENETEK
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index CSOPORTOK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CSOPORTOK_PK" ON "CSOPORTOK" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CSOPORTOK_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "CSOPORTOK_UK1" ON "CSOPORTOK" ("NEV") 
  ;
--------------------------------------------------------
--  DDL for Index FAJLOK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FAJLOK_PK" ON "FAJLOK" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index FELHASZNALOK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FELHASZNALOK_PK" ON "FELHASZNALOK" ("NEV") 
  ;
--------------------------------------------------------
--  DDL for Index KOMMENTEK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KOMMENTEK_PK" ON "KOMMENTEK" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SZOLGALTATAS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SZOLGALTATAS_PK" ON "SZOLGALTATASOK" ("NEV") 
  ;
--------------------------------------------------------
--  DDL for Index UZENETEK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "UZENETEK_PK" ON "UZENETEK" ("ID") 
  ;
--------------------------------------------------------
--  Constraints for Table CSOPORTOK
--------------------------------------------------------

  ALTER TABLE "CSOPORTOK" ADD CONSTRAINT "CSOPORTOK_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "CSOPORTOK" ADD CONSTRAINT "CSOPORTOK_UK1" UNIQUE ("NEV")
  USING INDEX  ENABLE;
  ALTER TABLE "CSOPORTOK" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CSOPORTOK" MODIFY ("NEV" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ELOFIZET
--------------------------------------------------------

  ALTER TABLE "ELOFIZET" MODIFY ("NEV_FELHASZNALO" NOT NULL ENABLE);
  ALTER TABLE "ELOFIZET" MODIFY ("NEV_SZOLGALTATAS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FELTOLTOTTE
--------------------------------------------------------

  ALTER TABLE "FELTOLTOTTE" MODIFY ("ID_FAJL" NOT NULL ENABLE);
  ALTER TABLE "FELTOLTOTTE" MODIFY ("NEV_FELHASZNALO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FAJLHOZ
--------------------------------------------------------

  ALTER TABLE "FAJLHOZ" MODIFY ("ID_FAJL" NOT NULL ENABLE);
  ALTER TABLE "FAJLHOZ" MODIFY ("ID_KOMMENT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FAJLOK
--------------------------------------------------------

  ALTER TABLE "FAJLOK" ADD CONSTRAINT "FAJLOK_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "FAJLOK" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FELHASZNALOK
--------------------------------------------------------

  ALTER TABLE "FELHASZNALOK" ADD CONSTRAINT "FELHASZNALOK_PK" PRIMARY KEY ("NEV")
  USING INDEX  ENABLE;
  ALTER TABLE "FELHASZNALOK" MODIFY ("NEV" NOT NULL ENABLE);
  ALTER TABLE "FELHASZNALOK" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "FELHASZNALOK" MODIFY ("REGISZTRACIO" NOT NULL ENABLE);
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
  USING INDEX  ENABLE;
  ALTER TABLE "KOMMENTEK" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SZOLGALTATASOK
--------------------------------------------------------

  ALTER TABLE "SZOLGALTATASOK" MODIFY ("NEV" NOT NULL ENABLE);
  ALTER TABLE "SZOLGALTATASOK" MODIFY ("AR" NOT NULL ENABLE);
  ALTER TABLE "SZOLGALTATASOK" ADD CONSTRAINT "SZOLGALTATAS_PK" PRIMARY KEY ("NEV")
  USING INDEX  ENABLE;
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
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ELOFIZET
--------------------------------------------------------

  ALTER TABLE "ELOFIZET" ADD CONSTRAINT "ELOFIZET_FK1" FOREIGN KEY ("NEV_FELHASZNALO")
	  REFERENCES "FELHASZNALOK" ("NEV") ON DELETE CASCADE ENABLE;
  ALTER TABLE "ELOFIZET" ADD CONSTRAINT "ELOFIZET_FK2" FOREIGN KEY ("NEV_FELHASZNALO")
	  REFERENCES "SZOLGALTATASOK" ("NEV") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FELTOLTOTTE
--------------------------------------------------------

  ALTER TABLE "FELTOLTOTTE" ADD CONSTRAINT "FAJL_FELHASZNALO_FK1" FOREIGN KEY ("ID_FAJL")
	  REFERENCES "FAJLOK" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "FELTOLTOTTE" ADD CONSTRAINT "FAJL_FELHASZNALO_FK2" FOREIGN KEY ("NEV_FELHASZNALO")
	  REFERENCES "FELHASZNALOK" ("NEV") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FAJLHOZ
--------------------------------------------------------

  ALTER TABLE "FAJLHOZ" ADD CONSTRAINT "FAJL_KOMMENT_FK1" FOREIGN KEY ("ID_FAJL")
	  REFERENCES "FAJLOK" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "FAJLHOZ" ADD CONSTRAINT "FAJL_KOMMENT_FK2" FOREIGN KEY ("ID_FAJL")
	  REFERENCES "KOMMENTEK" ("ID") ON DELETE CASCADE ENABLE;
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
