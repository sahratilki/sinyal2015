%% Deger atamalarý ve dosyadan deger cekme
Fs=2323; %ornekleme frekansý deger atamasý yapýldý.
gecikme=round(Fs/10); %echo icin gecikme suresi tanýmlandý.
notalar=[]; %notalar matrisine ilk deger atamasý yapýldý.
duraklama=zeros(1,round(Fs/100)); %duraklama suresi degeri atandý.
oktdegis=1; %oktav degerlerini degistiren degisken[-3,+3].
dosya=fopen('notalar.txt','r'); %text dosyasýný acar,'r':okumak için.
[nota,oktav,olcu]=textread('notalar.txt','%s%d%s','delimiter',','); %text dosyasý okundu ve ',' ile ayrýlmýs degiskenler yeni matrislere atandý.
fclose(dosya); %text dosyasý kapatýldý.
%% Program icinde oktav degisimi kosulu
if oktdegis~=0 %oktdegis degiskeninde degisiklik yapýlmasý durumunda islenecek sart. 
    for j=1:length(oktav) %text'ten cekilen oktav degerleri dongu icerisinde degistirilecek.
        oktav(j)=oktav(j)+oktdegis; 
    end
end
%% Notalar matrisi icinde notalarýn sinyallerini olusturma
for i=1:length(nota)
    frekans=frek(nota{i},oktav(i)); %frek fonsiyonu cagýrýlarak i. notanýn frekans degeri hesaplandý. 
    [sindalga,t]=note(frekans,str2num(olcu{i})); %note fonksiyonu cagýrýlarak i.notanýn sinus sinyali cizildi.
    notalar=[notalar sindalga duraklama]; %notalarýn sinyalleri arasýna bosluk eklenerek notalar matrisinde birlestirildi.
end  
%% Notalar matrisine echo ekleme
for i=1:length(notalar)
    if (i+gecikme)<=length(notalar) %gecikme notalar uzunlugunu asmadýgý surece islenecek sart.
        notalar(i+gecikme)=notalar(i+gecikme)+0.3*notalar(i); %Fs, 10'da biri süresince geciktirilip(gecikme)
    end                                               %++genliði %30 oranýnda düþürülerek kendisi ile toplandý.
end
%% Notalar matrisi sinyallerinin tepe degerinin 1'e normalize edilmesi
notalar=notalar/max(abs(notalar));
%% Notalar matrisinin grafiginin cizdirilip, ses olarak calýnmasý
plot(notalar)
sound(notalar,Fs);