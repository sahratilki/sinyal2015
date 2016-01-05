%% Fonksiyon tan�m�
function [xx,t]=note(nfrekans,nsure) %frekansi ve suresi bilinen notanin sin�s sinyalini donduren fonksiyon tanimlandi.
%% Deger atamalar�
Fs=8192;                   %ornekleme frekans�na de�er atand�.
t=0:1/Fs:nsure-(1/Fs);     %t aral�g� tan�mland�.
harmonik={1 0.8 0.4 0.1};xtop=0;
%% Zarf paketinin olusturulmas�
   Zattack=linspace(0,1.5,length(t)/4); %attack suresi:1/4l�k (t)surede 0'dan 1.5 kat�na kadar artt�.
   Zdecay=linspace(1.5,1,length(t)/8);  %decay suresi:sonraki 1/8lik (t)surede normal genli�ine geri dondu.
   Zsustain=linspace(1,1,length(t)/2);  %sustain suresi:sonraki 1/2lik s�rede normal genli�inde devam etti.
   Zrelease=linspace(1,0,length(t)/8);  %release suresi:sonraki 1/8lik s�rede normal genli�inden azalarak 0'a gitti.
   zarf=[Zattack Zdecay Zsustain Zrelease]; %zarf paketi olusturuldu.
%% Harmoniklerin hesaplanmas�
   for i=1:length(harmonik)
       x=harmonik{i}*sin(2*pi*nfrekans*t*i); %i. harmonik hesapland�.
       xtop=xtop+x;                          %harmonikler toplanarak birbirine eklendi.
   end
%% Olustulan sinyalin harmonikleri de eklenerek zarf ile paketlenmesi
   xx=xtop.*zarf; %notan�n harmonikleri eklendi ve zarf ile paketlendi.
end


