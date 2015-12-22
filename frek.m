function ff=frek(nota,oktav)  %oluþturulan fonksiyon nota ve oktava göre argüman alacaklar.
notalar={'Do','Dod', 'Re', 'Mib' ,'Mi' ,'Fa', 'Fad', 'Sol', 'Sold', 'La', 'Sib', 'Si','sus'}; %nota için tanýmlanan karakterler notalar dizisine atandý.
referans=16.35;  %do notasýnýn 0.oktavdaki deðerini referans olarak alýndý.
k=length(notalar); %k deðiþkenine notalar dizisinin uzunluðunu atandý.
if nargin<2
     oktav=4;
end
for i=0:8 %oktav için bir for döngüsü oluþturuldu ve her seferinde bir arttýrýlarak ilerlendi.
    if i==oktav %i'nin deðeri benim giriþ yaptýðým oktav'ýn deðerine eþitse(i==oktav) ise if'in içine gir.
       for j=1:k %notalar dizindeki elemanlar için for döngüsü oluþturuldu.j'nin 1'den baþlama sebebi ise matlabta dizilerde(matrislerde) 0. eleman bulunmaz ,1.elemandan baþlar.
           if  size(nota)==size(notalar{j})
              if nota==notalar{j}%giriþ yaptýðým nota ,notalar dizisindeki j. elemana eþitse if'in içine gir.
                  ff=2^i*(2^((j-1)/12)*referans);%2^i olmasýnýn sebebi oktavý her deðiþtiðinde 2 katýna çýkýyor.(j-1) olma sebebide j'nin 1 den baþlamasýdýr.     
              
              end 
           end
       end
     end
end
end