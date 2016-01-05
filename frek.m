function f=frek(nota,oktav)  %oluþturduðum fonksiyon nota ve oktava göre argüman alacaklar.
notalar={'Do','Dod', 'Re', 'Mib' ,'Mi' ,'Fa', 'Fad', 'Sol', 'Sold', 'La', 'Sib', 'Si','Sus'}; %nota için tanýmladýðým karakterleri notalar dizisine atadým.
referans=16.35;  %do notasýnýn 0.oktavdaki deðerini referans olarak aldým.
p=length(notalar); %p deðiþkenine notalar dizisinin uzunluðunu atadým.
if nargin<2 %argümanlarýn sayýsý 2 den küçükse
     oktav=4; %oktavý 4 e eþitle
end
for i=0:8 %oktav için bir for oluþturdum ve her seferinde bir arttýrdým.
    if i==oktav %i'nin deðeri benim giriþ yaptýðým oktav'ýn deðerine eþitse
       for j=1:p %notalar dizindeki elemanlar için for döngüsü oluþturdum
           if  size(nota)==size(notalar{j}) %argüman olan nota boyutu eþit ise notalar dizisindeki j.elemana
              if nota==notalar{j}%argüman olan nota, notalar dizisindeki j. elemana eþitse
                  f=2^i*(2^((j-1)/12)*referans);%frekansý hesaplýyorum
                  if size(nota)==size(notalar{13})%argüman olan nota boyutu eþit ise notalar dizisindeki 13.elemana
                  if nota==notalar{13}%argüman olan nota notalar dizisindeki 13. elemana eþitse
                      f=0; %frekansý 0 a eþitle.
                  end
                  end
              end 
           end
       end
     end
end
end