function f=frek(nota,oktav)  %olu�turdu�um fonksiyon nota ve oktava g�re arg�man alacaklar.
notalar={'Do','Dod', 'Re', 'Mib' ,'Mi' ,'Fa', 'Fad', 'Sol', 'Sold', 'La', 'Sib', 'Si','Sus'}; %nota i�in tan�mlad���m karakterleri notalar dizisine atad�m.
referans=16.35;  %do notas�n�n 0.oktavdaki de�erini referans olarak ald�m.
p=length(notalar); %p de�i�kenine notalar dizisinin uzunlu�unu atad�m.
if nargin<2 %arg�manlar�n say�s� 2 den k���kse
     oktav=4; %oktav� 4 e e�itle
end
for i=0:8 %oktav i�in bir for olu�turdum ve her seferinde bir artt�rd�m.
    if i==oktav %i'nin de�eri benim giri� yapt���m oktav'�n de�erine e�itse
       for j=1:p %notalar dizindeki elemanlar i�in for d�ng�s� olu�turdum
           if  size(nota)==size(notalar{j}) %arg�man olan nota boyutu e�it ise notalar dizisindeki j.elemana
              if nota==notalar{j}%arg�man olan nota, notalar dizisindeki j. elemana e�itse
                  f=2^i*(2^((j-1)/12)*referans);%frekans� hesapl�yorum
                  if size(nota)==size(notalar{13})%arg�man olan nota boyutu e�it ise notalar dizisindeki 13.elemana
                  if nota==notalar{13}%arg�man olan nota notalar dizisindeki 13. elemana e�itse
                      f=0; %frekans� 0 a e�itle.
                  end
                  end
              end 
           end
       end
     end
end
end