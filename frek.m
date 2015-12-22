function ff=frek(nota,oktav)  %olu�turulan fonksiyon nota ve oktava g�re arg�man alacaklar.
notalar={'Do','Dod', 'Re', 'Mib' ,'Mi' ,'Fa', 'Fad', 'Sol', 'Sold', 'La', 'Sib', 'Si','sus'}; %nota i�in tan�mlanan karakterler notalar dizisine atand�.
referans=16.35;  %do notas�n�n 0.oktavdaki de�erini referans olarak al�nd�.
k=length(notalar); %k de�i�kenine notalar dizisinin uzunlu�unu atand�.
if nargin<2
     oktav=4;
end
for i=0:8 %oktav i�in bir for d�ng�s� olu�turuldu ve her seferinde bir artt�r�larak ilerlendi.
    if i==oktav %i'nin de�eri benim giri� yapt���m oktav'�n de�erine e�itse(i==oktav) ise if'in i�ine gir.
       for j=1:k %notalar dizindeki elemanlar i�in for d�ng�s� olu�turuldu.j'nin 1'den ba�lama sebebi ise matlabta dizilerde(matrislerde) 0. eleman bulunmaz ,1.elemandan ba�lar.
           if  size(nota)==size(notalar{j})
              if nota==notalar{j}%giri� yapt���m nota ,notalar dizisindeki j. elemana e�itse if'in i�ine gir.
                  ff=2^i*(2^((j-1)/12)*referans);%2^i olmas�n�n sebebi oktav� her de�i�ti�inde 2 kat�na ��k�yor.(j-1) olma sebebide j'nin 1 den ba�lamas�d�r.     
              
              end 
           end
       end
     end
end
end