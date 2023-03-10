Create database asi_hastalik_takip;
use asi_hastalik_takip;

Create table Meslek_Grubu
(
  meslekGrup_id int NOT NULL AUTO_INCREMENT,
  meslekGrup_adi NVARCHAR(45),
  PRIMARY KEY(meslekGrup_id)
);


Create table MeslekAsama
(
  meslekAsama_id int NOT NULL AUTO_INCREMENT,
  meslekGrup_id int NOT NULL,
  PRIMARY KEY(meslekAsama_id),
  FOREIGN KEY(meslekGrup_id) REFERENCES Meslek_Grubu(meslekGrup_id)
);


Create table YasAsama
(
  yasAsama_id int NOT NULL AUTO_INCREMENT,
  yasAsama int NOT NULL,
  yas int NOT NULL,
  PRIMARY KEY(yasAsama_id)
);


Create table Adres
(
  adres_id int NOT NULL AUTO_INCREMENT,
  ili NVARCHAR(45) NOT NULL,
  ilcesi NVARCHAR(45) NOT NULL,
  PRIMARY KEY(adres_id)
);

Create table Meslekler
(
  meslek_id int NOT NULL AUTO_INCREMENT,
  meslek_adi NVARCHAR(45) NOT NULL,
  meslekGrup_id int NOT NULL,
  PRIMARY KEY(meslek_id),
  FOREIGN KEY(meslekGrup_id) REFERENCES Meslek_Grubu(meslekGrup_id)
);

Create table Vatandas
(
  vatandas_id int NOT NULL,
  vatandas_adi NVARCHAR(45) NOT NULL,
  vatandas_soyadi NVARCHAR(45) NOT NULL,
  dogumYeri NVARCHAR(45) NULL,
  dogumTarihi DATE NULL,
  yasi int NULL,
  asama int NULL ,
  adres_id int NULL ,
  meslek_id int NULL,
  PRIMARY KEY(vatandas_id),
  FOREIGN KEY(adres_id) REFERENCES Adres(adres_id),
  FOREIGN KEY(meslek_id) REFERENCES Meslekler(meslek_id)
);

Create table Hastane
(
  hastane_id int NOT NULL AUTO_INCREMENT,
  hastane_adi NVARCHAR(45) NOT NULL,
  adres_id int NOT NULL,
  hastaSayisi int NOT NULL,
  asiStogu int NOT NULL,
  gunlukAsilama int NOT NULL,
  PRIMARY KEY(hastane_id),
  FOREIGN KEY(adres_id) REFERENCES Adres(adres_id)
);

Create table Koruyuculuk_Duzeyi
(
  koruyuculukDuz_id int NOT NULL AUTO_INCREMENT,
  koruyuculuk_seviyesi NVARCHAR(45) NOT NULL,
  PRIMARY KEY(koruyuculukDuz_id)
);

Create table Asi_Turleri
(
  asiTur_id int NOT NULL AUTO_INCREMENT,
  asiTur_adi NVARCHAR(45) NOT NULL,
  PRIMARY KEY (asiTur_id)
);

Create table Asi
(
  asi_id int NOT NULL AUTO_INCREMENT,
  asiTurleri_id int NOT NULL,
  koruyuculukDuz_id int NOT NULL,
  PRIMARY KEY(asi_id),
  FOREIGN KEY (asiTurleri_id) REFERENCES Asi_Turleri(asiTur_id),
  FOREIGN KEY (koruyuculukDuz_id) REFERENCES Koruyuculuk_Duzeyi(koruyuculukDuz_id)
);

Create table Hastane_Asi
(
  hastaneAsi_id int NOT NULL AUTO_INCREMENT,
  hastane_id int NOT NULL,
  asi_id int NOT NULL,
  PRIMARY KEY(hastaneAsi_id),
  FOREIGN KEY(asi_id) REFERENCES Asi(asi_id),
  FOREIGN KEY(hastane_id) REFERENCES Hastane(hastane_id)
  
);

Create table Hastalik_Duzeyi
(
  hastalikDuz_id int NOT NULL AUTO_INCREMENT,
  duzey_adi NVARCHAR(45) NOT NULL,
  PRIMARY KEY(hastalikDuz_id)
);

Create table Semptomlar
(
  semptom_id int NOT NULL AUTO_INCREMENT,
  semptom_adi NVARCHAR(45) NOT NULL,
  PRIMARY KEY(semptom_id)
);


Create table Hastalik_Gecmisi
(
  HastalikGecmis_id int NOT NULL AUTO_INCREMENT,
  hasta_id int NOT NULL,
  semptom_id int NOT NULL,
  hastalikDuzey_id int NOT NULL,
  teshis_tarihi DATE NOT NULL,
  PRIMARY KEY(hastalikGecmis_id),
  FOREIGN KEY(hasta_id) REFERENCES Vatandas(vatandas_id),
  FOREIGN KEY(semptom_id) REFERENCES Semptomlar(semptom_id),
  FOREIGN KEY(hastalikDuzey_id) REFERENCES Hastalik_Duzeyi(hastalikDuz_id)
);

Create table Asi_Gecmisi
(
  asiGecmis_id int NOT NULL AUTO_INCREMENT,
  asilanan_id int(10) NOT NULL,
  hastaneAsi_id int(10) NOT NULL,
  vurulma_tarihi DATE NOT NULL,
  PRIMARY KEY(asiGecmis_id),
  FOREIGN KEY(asilanan_id) REFERENCES Vatandas(vatandas_id),
  FOREIGN KEY(hastaneAsi_id) REFERENCES Hastane_Asi(hastaneAsi_id)
);


INSERT INTO Meslek_Grubu(meslekGrup_adi)
VALUES("Sa??l??k Personeli"),
("E??itim Sekt??r??"),
("Emniyet Mensubu"),
("Memur"),
("Hizmet Sekt??r??"),
("Di??er");


INSERT INTO YasAsama(yasAsama,yas)
VALUES(6,80),(6,79),(6,78),(6,77),(6,76),(6,75),(6,74),(6,73),(6,72),(6,71),(6,70),
(7,69),(7,68),(7,67),(7,66),(7,65),(7,64),(7,63),(7,62),(7,61),(7,60),
(8,59),(8,58),(8,57),(8,56),(8,55),(8,54),(8,53),(8,52),(8,51),(8,50),
(9,49),(9,48),(9,47),(9,46),(9,45),(9,44),(9,43),(9,42),(9,41),(9,40),
(10,39),(10,38),(10,37),(10,36),(10,35),(10,34),(10,33),(10,32),(10,31),(10,30),
(11,29),(11,28),(11,27),(11,26),(11,25),(11,24),(11,23),(11,22),(11,21),(11,20),(11,19),(11,18);

INSERT INTO MeslekAsama(meslekGrup_id)
VALUES(1),(2),(3),(4),(5);

INSERT INTO Adres(ili,ilcesi)
VALUES("Kocaeli","??zmit"),("??stanbul","Pendik"),("Ankara","??ankaya"),("Bursa","Saitabat"),("Derince","??enesuyu");

INSERT INTO Meslekler(meslek_adi,meslekGrup_id)
VALUES("Doktor",1),("T??bbi Sekreter",1),("Hem??ire",1),("????retmen",2),("????renci",2),("Polis",3),
("Zab??ta",3),("Jandarma",3),("??mam",4),("Vali",4),("Kaymakam",4),("Bakan",4),
("Komi",5),("Garson",5),("Gurme",5),("A??????",5),("M??hendis",6),("Emekli",6);

INSERT INTO Vatandas(vatandas_id,vatandas_adi,vatandas_soyadi,dogumYeri,dogumTarihi,adres_id,meslek_id)
VALUES(11111,"Ahmet","U??ar","Antalya","1996-10-21",2,1),
(22222,"Mehmet","Demir","??zmir","1975-06-11",1,17),
(33333,"Leyla","I????k","??stanbul","1963-10-21",1,3),
(44444,"Durmu??","Me??e","Antalya","1950-10-21",3,6),
(55555,"Ya??mur","Bulut","Ankara","1999-10-21",2,12),
(66666,"Ezel","Bayraktar","??stanbul","1980-10-21",4,15),
(77777,"Ramiz","Karaeski","??stanbul","1957-10-21",5,18),
(88888,"Burak","Turgut","Sinop","1999-04-13",2,5);

INSERT INTO Hastane(hastane_adi,adres_id,hastaSayisi,asiStogu,gunlukAsilama)
VALUES("??ifa Hastanesi",3,450,10000,500),
	  ("Kocaeli Devlet Hastanesi",1,500,20000,300),
	  ("Akademi Hastanesi",1,250,15000,600),
      ("Ac??badem Hastanesi",2,300,30000,400),
      ("Tatl??hurma Hastanesi",2,800,40000,1000),
      ("Ni??anta???? Hastanesi",2,600,35000,500),
      ("Umut Hastanesi",5,650,30000,200),
      ("Do??a Hastanesi",4,750,20000,400);

INSERT INTO Koruyuculuk_Duzeyi(koruyuculuk_seviyesi)
VALUES("Y??zde 60"),("Y??zde 70"),("Y??zde 80"),("Y??zde 90"),("Y??zde 98");

INSERT INTO Asi_Turleri(asiTur_adi)
VALUES("T??rk A????s??"),("Alman A????s??"),("Rus A????s??"),("Amerika A????s??"),("??in A????s??");

INSERT INTO Asi(asiTurleri_id,koruyuculukDuz_id)
VALUES(1,5),(2,4),(3,2),(4,3),(5,1);

INSERT INTO Hastane_Asi(hastane_id,asi_id)
VALUES(1,3),(1,4),(2,1),(2,2),(3,5),(3,2),(4,4),(5,1),(6,3),(6,5),(7,2),(8,1),(8,4);

INSERT INTO Hastalik_Duzeyi(duzey_adi)
VALUES("Hafif"),("Orta"),("??leri"),("??ok A????r");

INSERT Semptomlar(semptom_adi)
VALUES("Belirtisiz"),("Ba?? A??r??s??"),("S??rt A??r??s??"),("G??????s A??r??s??");

INSERT INTO Hastalik_Gecmisi(hasta_id,semptom_id,hastalikDuzey_id,teshis_tarihi)
VALUES(88888,1,1,"2020-06-27"),
	  (11111,2,2,"2020-08-15"),
	  (44444,3,1,"2020-04-20"),
	  (77777,4,3,"2020-03-13"),
	  (33333,3,4,"2020-04-05"),
	  (33333,1,1,"2020-07-10"),
	  (11111,4,1,"2021-03-16");

INSERT INTO Asi_Gecmisi(asilanan_id,hastaneAsi_id,vurulma_tarihi)
VALUES
(22222,6,"2020-12-20"),
(33333,10,"2021-01-15"),
(22222,6,"2021-03-16"),
(77777,4,"2020-12-08"),
(44444,6,"2021-01-04"),
(77777,4,"2021-01-22"),
(44444,1,"2021-02-13"),
(11111,9,"2021-03-12"),
(66666,10,"2021-02-28"),
(33333,2,"2021-03-30");


/*1-)A????lananlar aras??ndan en ya??l?? olan ki??inin vuruldu??u a????lar??n t??rleri ve koruyuculuk d??zeylerini veren sql c??mleci??i*/
Select v.vatandas_adi, v.vatandas_soyadi,v.dogumTarihi,astur.asiTur_adi,korduz.koruyuculuk_seviyesi From Asi_Gecmisi asg 
JOIN Vatandas v on v.vatandas_id=asilanan_id JOIN Hastane_Asi hasasi on hasasi.hastaneAsi_id=asg.hastaneAsi_id 
JOIN Asi a on a.asi_id=hasasi.asi_id JOIN Asi_Turleri astur on astur.asiTur_id=a.asiTurleri_id 
JOIN Koruyuculuk_Duzeyi korduz on korduz.koruyuculukDuz_id=a.koruyuculukDuz_id 
WHERE v.dogumTarihi=(Select MIN(dogumTarihi) From Vatandas);

/*2-)T??rk veya Rus a????s??n?? bulunduran hastanelerin ad??n?? ve a???? stoklar??n?? veren sql c??mleci??i*/
Select has.hastane_adi,has.asiStogu From Hastane has 
JOIN Hastane_Asi hasasi on hasasi.hastane_id=has.hastane_id 
JOIN Asi a on a.asi_id=hasasi.asi_id JOIN Asi_Turleri astur on astur.asiTur_id=a.asiTurleri_id 
Where astur.asiTur_adi="T??rk A????s??" OR astur.asiTur_adi="Rus A????s??";

/*3-)En y??ksekten en d??????k koruyuculu??a sahip a????lar?? s??ralayarak adlar??n?? veren sql c??mleci??i*/
Select astur.asiTur_adi,korduz.koruyuculuk_seviyesi From Asi a 
JOIN Asi_Turleri astur on astur.asiTur_id=a.asiTurleri_id 
JOIN Koruyuculuk_Duzeyi korduz on korduz.koruyuculukDuz_id=a.koruyuculukDuz_id 
order by korduz.koruyuculuk_seviyesi desc;

/*4-)A????lananlar??n kim oldu??unu ve hangi hastanede, hangi a????dan vuruldu??unu veren sql c??mleci??i*/
 Select  v.vatandas_adi,v.vatandas_soyadi,hast.hastane_adi,astur.asiTur_adi From Vatandas v join Asi_Gecmisi ag on ag.asilanan_id=v.vatandas_id 
 JOIN Hastane_Asi ha on ha.hastaneAsi_id=ag.hastaneAsi_id JOIN Asi a on a.asi_id=ha.asi_id 
 JOIN Asi_Turleri astur on astur.asiTur_id=a.asiTurleri_id JOIN Hastane hast on hast.hastane_id=ha.hastane_id;

/*5-)T??rk a???? ??e??idine sahip hastanelerin ad??n??, adresini ve a???? sto??unu veren sql c??mleci??i*/
Select  astur.asiTur_adi,hast.hastane_adi,adre.ili,adre.ilcesi, hast.asiStogu From Hastane_Asi ha 
JOIN Asi a on a.asi_id=ha.asi_id JOIN Asi_Turleri astur on astur.asiTur_id=a.asiTurleri_id 
JOIN Hastane hast on hast.hastane_id=ha.hastane_id JOIN Adres adre on adre.adres_id=hast.adres_id Where astur.asiTur_adi="T??rk A????s??";

/*6-)Hastal??k ge??iren vatanda??lar??n adlar??n??, g??sterdikleri semptomlar?? ve hastal??k ge??irme tarihlerini veren sql c??mleci??i*/
 Select v.vatandas_adi,v.vatandas_soyadi,semp.semptom_adi,hasg.teshis_tarihi From Hastalik_Gecmisi hasg 
 JOIN Vatandas v on v.vatandas_id=hasg.hasta_id JOIN Semptomlar semp on semp.semptom_id=hasg.semptom_id;

/*7-)A????s??n?? 2020 y??l??ndan sonra olan hastalar??n ad??n??,soyad??n?? veren sql c??mleci??i*/
Select v.vatandas_adi,v.vatandas_soyadi,v.dogumTarihi From Asi_Gecmisi asg 
JOIN Vatandas v on v.vatandas_id=asg.asilanan_id Where asg.vurulma_tarihi>"2020-00-00";

/*8-)Semptomlar?? belirtisiz ge??en hastalar??n ad??n?? ,soyad??n??, te??his tarihini veren sql c??mleci??i*/
  Select v.vatandas_adi,v.vatandas_soyadi,hasg.teshis_tarihi From Hastalik_Gecmisi hasg 
  JOIN Vatandas v on v.vatandas_id=hasg.hasta_id JOIN Semptomlar semp on semp.semptom_id=hasg.semptom_id 
  Where semp.semptom_adi="Belirtisiz";

/*9-)??stanbulda ya??ay??p a????lanmam???? vatanda??lar??n ad??, soyad??, adresini veren sql c??mleci??i*/
Select v.vatandas_id,v.vatandas_adi,v.vatandas_soyadi,adrs.ili From Vatandas v 
JOIN Adres adrs on adrs.adres_id=v.adres_id Where v.vatandas_id 
NOT IN (Select v.vatandas_id From Vatandas v JOIN Asi_Gecmisi asgec on asgec.asilanan_id=v.vatandas_id 
Where v.vatandas_id IN(Select asilanan_id From Asi_Gecmisi)) AND adrs.ili="??stanbul";

/*10-)A????lama s??ras??nda birinci s??rada a????lanacaklar??n ad??n??,soyad??n?? veren sql c??mleci??i */
Select v.vatandas_adi,v.vatandas_soyadi From Vatandas v Where v.asama=1;

/*11-)??stanbulda bulunan hastanelerin g??nl??k a????lama miktarlar?? toplam??n?? veren veren sql c??mleci??i*/
Select SUM(has.gunlukAsilama) as "??stanbul G??nl??k A????lama" From Hastane has 
JOIN Adres adrs on adrs.adres_id=has.adres_id Where adrs.ili="??stanbul";

/*12-)??llerden en ??ok a???? sto??una sahip olan hastanenin ad??n?? ve yatan hasta say??s??n?? g??steren veren sql c??mleci??i*/
Select has.hastane_adi as "Hastane Ad??",has.hastaSayisi as "Hasta Say??s??",has.asiStogu as "A???? Sto??u" From Hastane has 
Where has.asiStogu=(Select MAX(has.asiStogu)  From Hastane has JOIN Adres adrs on adrs.adres_id=has.adres_id);

/*13-)??in a????s??n?? bar??nd??ran hastanelerin kay??tlar??n?? silen sql veren sql c??mleci??i*/
Select *From Hastane has JOIN Hastane_Asi hasasi on hasasi.hastane_id=has.hastane_id 
JOIN Asi a on a.asi_id=hasasi.asi_id JOIN Asi_Turleri astur on astur.asiTur_id=a.asiTurleri_id 
Where astur.asiTur_adi="??in A????s??";
Delete From Hastane 
Where hastane_id=(Select has.hastane_id From Hastane has JOIN Hastane_Asi hasasi on hasasi.hastane_id=has.hastane_id 
JOIN Asi a on a.asi_id=hasasi.asi_id JOIN Asi_Turleri astur on astur.asiTur_id=a.asiTurleri_id Where astur.asiTur_adi="??in A????s??");

/*14-)??in a????s??n??n koruyuculuk d??zeyini y??zde 30 olarak g??ncelleyen sql c??mleci??i*/
UPDATE Koruyuculuk_Duzeyi
SET koruyuculuk_Seviyesi="Y??zde 30"
Where koruyuculukDuz_id=(Select korduz.koruyuculukDuz_id From Asi a 
JOIN Asi_Turleri astur on astur.asiTur_id=a.asiTurleri_id 
JOIN Koruyuculuk_Duzeyi korduz on korduz.koruyuculukDuz_id=a.koruyuculukDuz_id 
Where astur.asiTur_adi="??in A????s??"); 

/*15-)Vatanda??lar??n do??um tarihleriyle g??n??m??z tarihinin fark??n?? alarak default null olan yas field'ini dolduran sql c??mleci??i.*/
UPDATE Vatandas 
SET yasi=2021-(Select dogumTarihi From vatandas)
Where yasi="";

/*16-)Vatanda??lar??n ilk olarak mesleklerine bakarak, e??er meslekleri ??ncelikli mesleklerden de??ilse 
   ya??lar??na bakarak hangi a????lama grubunda oldu??unu bulan ve asama field'ine yazan sql c??mleci??i. */
UPDATE Vatandas
SET asama= IF ("Di??er"<>(Select meslekGrup_adi From Meslek_Grubu 
Where meslekGrup_id=(Select meslekGrup_id From meslekler Where meslek_id=(Select meslek_id From Vatandas))),
(Select meslekAsama_id From MeslekAsama Where meslekGrup_id=(Select meslekGrup_id From meslekler 
Where meslek_id=(Select meslek_id From Vatandas)))
,(Select yasAsama From YasAsama Where yas=(Select yasi From Vatandas)))
Where asama="";









