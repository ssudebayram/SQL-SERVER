create view deneme
As 
select SiparisID , MusteriID , CalisanID , UrunID , TedarikciID from SÝPARÝÞ


ALTER VIEW deneme2
AS
SELECT M.Ad, M.Soyad, M.Telefon, M.Konum , S.Sehir FROM MÜÞTERÝ M
JOIN SÝPARÝÞ S ON M.MusteriID = S.MusteriID


ALTER VIEW deneme3  
AS
SELECT  S.SiparisID, S.UrunFiyati , U.UrunAdi FROM SÝPARÝÞ S
JOIN Urun U ON S.UrunID = U.UrunID


CREATE VIEW deneme4 
AS
SELECT T.TedarikciID , T.Ad , U.UrunAdi FROM TEDARÝKÇÝ T
JOIN Urun U ON T.TedarikciID = U.TedarikciID
    