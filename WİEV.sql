create view deneme
As 
select SiparisID , MusteriID , CalisanID , UrunID , TedarikciID from S�PAR��


ALTER VIEW deneme2
AS
SELECT M.Ad, M.Soyad, M.Telefon, M.Konum , S.Sehir FROM M��TER� M
JOIN S�PAR�� S ON M.MusteriID = S.MusteriID


ALTER VIEW deneme3  
AS
SELECT  S.SiparisID, S.UrunFiyati , U.UrunAdi FROM S�PAR�� S
JOIN Urun U ON S.UrunID = U.UrunID


CREATE VIEW deneme4 
AS
SELECT T.TedarikciID , T.Ad , U.UrunAdi FROM TEDAR�K�� T
JOIN Urun U ON T.TedarikciID = U.TedarikciID
    