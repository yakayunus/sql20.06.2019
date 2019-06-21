	--vt oluşturma
	create database database_adimiz

	--vt seçme
	use database_adimiz

	--vt silme
	drop database database_adimiz

	--Table oluşturma
	create table tablo_adimiz
	(
	  id int
	)


	--table silme
	drop table tablo_adimiz


	--Table oluşturma örnek
	create table ornekYazar
	(
	  id int IDENTITY(1,1) not null,
	  yazar_kodu int PRIMARY KEY not null,
	  yazar_adi nvarchar(50) not null,
	   yazar_soyadi nvarchar(50) not null,
		yazar_telNo int not null
	)


	--tabloya veri girmek yöntem 1
	insert into ornekYazar (yazar_kodu,yazar_adi,yazar_soyadi,yazar_telNo) values (5,'yunus','yaka',505)


	--tabloya veri girmek yöntem 2
	insert into ornekYazar values (6,'yasin','yaka',506)


	--tabloya alan ekleme
	alter table fakulteler add fakulte_telNo int 


	--tablodan alan silme
	alter table fakulteler drop column fakulte_telNo 

	-- sp_rename 'fakulteler.fakulte_telNo' ,'fakulte_telefon','column'

	select * from Bolge
	select * from Bolgeler
	select * from Kategoriler
	select * from MusteriDemographics
	select * from Musteriler
	select * from MusteriMusteriDemo
	select * from Satislar
	select * from Tedarikciler
	select * from Urunler
	select * from [Satis Detaylari]


	select KategoriID, Tanimi From Kategoriler

	select Adres,MusteriAdi,KategoriID From Musteriler,Kategoriler

	select MusteriAdi,SirketAdi,Sehir,Ulke from Tedarikciler where Ulke='Germany' and (Sehir='Frankfurt' or Sehir='Berlin')



	select * From Kategoriler where KategoriAdi like '[^c]%' 




	select * From Kategoriler where KategoriAdi like '___d___'



	select * from Tedarikciler where Sehir in('tokyo','berlin','london')

	select * from Satislar where PersonelID in(3,4,9)

	select * from Satislar where  50 <NakliyeUcreti and NakliyeUcreti <100

	select * from Satislar where  NakliyeUcreti between 50 and 100


	update yazar set yazar_adi='Yusuf' where yazar_adi='yusuf'


	select COUNT(MusteriID) as kayit_sayisi from Musteriler


	select * from Musteriler order by Sehir desc;
	select * from Musteriler order by Sehir asc;

	select distinct(Sehir) from Musteriler

	select sum(NakliyeUcreti) from Satislar

	select GETDATE()

	insert into yazar values (12,6,'yasin','yaka',506),(11,6,'yagmur','yaka',505),(13,6,'hasan','yaka',516)

	SELECT  KategoriID ,Sum(HedefStokDuzeyi) as StokToplami FROM Urunler  GROUP BY KategoriID HAVING SUM(HedefStokDuzeyi)>350


	--Birleştirme

	select Musteriler.Telefon  from Musteriler Union select Tedarikciler.Telefon as Tedarikci_TelNo from Tedarikciler


	--Except A fark B

	select Musteriler.Sehir  from Musteriler  Except select Tedarikciler.Sehir from Tedarikciler



	--INTERSECT 
	select Musteriler.Sehir  from Musteriler  INTERSECT select Tedarikciler.Sehir from Tedarikciler


	--vt oluşturma
	create database Fabrika

	--vt seçme
	use Fabrika

	create table Personel
	(
	--  id int IDENTITY(1,1) not null,
	   TC int PRIMARY KEY not null,
	   Ad nvarchar(50) not null,
	   SoyAd nvarchar(50) not null,
	   Unvan nvarchar(50) not null
	)

	create table Ucret
	(

	   TC int PRIMARY KEY not null,
	   Odeme int not null,
	   Tarih date not null,
	   Sgk_No int not null
	)

	create table Iletisim
	(
	   TC int PRIMARY KEY not null,
	   Adres nvarchar(50) not null,
	   Tel int not null,
	   E_mail nvarchar(50) not null
	)

	--vt seçme
	use Fabrika
	Alter table Ucret Add foreign key (Sgk_No) References Personel (TC)

	Alter table Iletisim Add foreign key (TC) References Ucret (Sgk_No)



	use okul

	select * from ogrenciler where ogr_no=10

	select * from bolumler 

	create view ogr_bol as
	select ogrenciler.ogr_ad,ogrenciler.ogr_soyad,ogrenciler.bolum_kod,bolumler.bolum_no,bolumler.bolum_ad 
	from ogrenciler,bolumler where  ogrenciler.bolum_kod=bolumler.bolum_no

	select *from ogr_bol

	create view ogr_bol3 as
	select ogrenciler.ogr_ad,ogr_soyad,ogrenciler.cinsiyet ,bolumler.bolum_ad from ogrenciler,bolumler
	 where (ogrenciler.bolum_kod=bolumler.bolum_no)

	 select * from ogr_bol3 where cinsiyet=0


	 --soru15
	 Select * from ogrenciler where bolum_kod=3 or bolum_kod=4;
	 Select * from ogrenciler where bolum_kod in(3,4)

	 --soru16
	  Select * from ogrenciler where (bolum_kod=1 or bolum_kod=4) and cinsiyet=0 ;
	  Select * from ogrenciler where bolum_kod in(1,4) and cinsiyet=0 ;

	 --soru17
	   Select * from ogrenciler where not bolum_kod=4  and cinsiyet=0 ;

	 --soru18
	   Select * from ogrenciler where (bolum_kod=1 or bolum_kod=3) or bolum_kod=5 ;

	 --soru19
		Select * from ogrenciler where ogr_no>5 and ogr_no<12

	 --soru20
		 Select * from ogrenciler where ogr_ad like 'a%'

	 --soru21
		 Select * from ogrenciler where ogr_ad like '%y%'

	 --soru22
		 Select * from ogrenciler where ogr_ad not like '%a%'

	 --soru23
		 Select * from ogrenciler order by ogr_ad asc;

	 --soru24
		 Select * from ogrenciler order by ogr_ad desc;

	 --soru25
		 Select * from ogrenciler order by dogum_tarihi desc
	 
	 --soru26
		 Select * from ogrenciler order by ogr_ad asc,ogr_soyad desc;

	 --soru29
	   select bolum_kod,COUNT(bolum_kod) from ogrenciler group by bolum_kod

	 --sour30
		 Select * from ogrenciler 

	 --soru34
	 create view ogr_bol4 as
	 select ogrenciler.ogr_ad,ogrenciler.ogr_soyad,bolumler.bolum_ad,fakulteler.fakulte_ad 
	 from ogrenciler,bolumler,fakulteler 
	 where ogrenciler.bolum_kod=bolumler.bolum_no and bolumler.fakulte_kod=fakulteler.fakulte_no

	 --soru33
	 select ogrenciler.ogr_ad,ogr_soyad,ogrenciler.cinsiyet ,bolumler.bolum_ad
	  from ogrenciler,bolumler
	 where (ogrenciler.bolum_kod=bolumler.bolum_no) and cinsiyet=0

	 -----------------------------------------------------------------------------------------------
	 --soru32
	  select ogrenciler.ogr_ad,ogr_soyad ,bolumler.bolum_ad from ogrenciler,bolumler
	 where (ogrenciler.bolum_kod=bolumler.bolum_no) and bolum_ad='Fizik'


	 -----------------------------------------------------------------------------------------------
	--soru31 yöntem 1

	 select ogrenciler.ogr_ad,ogrenciler.ogr_soyad,ogrenciler.bolum_kod,bolumler.bolum_ad 
	from ogrenciler,bolumler where  ogrenciler.bolum_kod=bolumler.bolum_no


	--soru31 yöntem 2

	select ogrenciler.ogr_ad,ogrenciler.ogr_soyad,ogrenciler.bolum_kod,bolumler.bolum_ad
	  from ogrenciler INNER JOIN bolumler
	 ON ogrenciler.bolum_kod=bolumler.bolum_no


	 -----------------------------------------------------------------------------------------------

	  create view ogr_bol5 as
	 select ogr_ad from ogr_bol5



	 select * from ogrenciler

	 delete from ogrenciler where ogr_ad='yunus'



 
	  create view mySinif as
	 select ogr_ad,ogr_soyad from ogrenciler


	 select * from mySinif







 
	--vt oluşturma
	create database Eokul

	--vt seçme
	use Eokul

	create table ogrenciler5
	(
	    id int IDENTITY(1,1) not null,
	    Ad nvarchar(50) not null,
		SoyAd nvarchar(50) not null,
		Sinav1 int check(Sinav1>0 and Sinav1<101) not null,
	    Sinav2 Float check(Sinav2>0 and Sinav2<101)not null,
		Per_notu int,
	    Ortalama  as format(((Sinav1+Sinav2+Per_notu)/3),'N2')
	)


	insert into ogrenciler5 values('Yasin','Yaka',100,10,10),('Orhan','Kara',80,50,10)        

	insert into ogrenciler5 values('Yunus','Yaka',101,500,10)    


select* from ogrenciler5





















































































































































































































































































































































































































































































































































































































































































































































































































