%% Fonksiyon tanýmý
function [xx,t]=note(nfrekans,nsure) %frekansi ve suresi bilinen notanin sinüs sinyalini donduren fonksiyon tanimlandi.
%% Deger atamalarý
Fs=8192;                   %ornekleme frekansýna deðer atandý.
t=0:1/Fs:nsure-(1/Fs);     %t aralýgý tanýmlandý.
harmonik={1 0.8 0.4 0.1};xtop=0;
%% Zarf paketinin olusturulmasý
   Zattack=linspace(0,1.5,length(t)/4); %attack suresi:1/4lük (t)surede 0'dan 1.5 katýna kadar arttý.
   Zdecay=linspace(1.5,1,length(t)/8);  %decay suresi:sonraki 1/8lik (t)surede normal genliðine geri dondu.
   Zsustain=linspace(1,1,length(t)/2);  %sustain suresi:sonraki 1/2lik sürede normal genliðinde devam etti.
   Zrelease=linspace(1,0,length(t)/8);  %release suresi:sonraki 1/8lik sürede normal genliðinden azalarak 0'a gitti.
   zarf=[Zattack Zdecay Zsustain Zrelease]; %zarf paketi olusturuldu.
%% Harmoniklerin hesaplanmasý
   for i=1:length(harmonik)
       x=harmonik{i}*sin(2*pi*nfrekans*t*i); %i. harmonik hesaplandý.
       xtop=xtop+x;                          %harmonikler toplanarak birbirine eklendi.
   end
%% Olustulan sinyalin harmonikleri de eklenerek zarf ile paketlenmesi
   xx=xtop.*zarf; %notanýn harmonikleri eklendi ve zarf ile paketlendi.
end


