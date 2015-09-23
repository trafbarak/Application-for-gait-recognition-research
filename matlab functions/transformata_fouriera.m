function transformata_fouriera(pocz, kon, SKELETON, t, staw, oska)
pocz = pocz * 30 + 1;
kon = kon * 30 + 1;
N = kon - pocz;
%N = length(t); %liczba probek
fp = 2/((t(2)-t(1))); %czestotliwosc probkowania 
%(zgodnie z twierdzeniem o czêstotliwoœci próbkowania musi byæ dwa razy
%wiêksza ni¿ najwiêksza czêstotliwoœæ sygna³u); u nas czêstotliwoœæ sygna³u
%wyniesie maksymalnie 30Hz, gdy¿ sygna³ pobierany jest w czêstotliwoœci 30
%FPS'ów, wiêc czêstotliwoœæ próbkowania jest dwukrotnie wiêksza i wynosi
%60hz.
% tp = 1/fp;
f = (0:1:N-1)*fp/N;

x = SKELETON(staw).Dxyz(oska,:);
X = fft(x(pocz:kon)); %transformata Fourier'a
X1 = abs(X);
y = SKELETON(staw).rxyz(oska,:);
Y = fft(y(pocz:kon));
Y1 = abs(Y);

figure(4);
hold on; grid on;
plot(fftshift(X1)); %wykres transformaty Fourier'a wyœrodkowany
% plot(f,fftshift(X1));
title('Wykres Transformaty Fouriera z czêstotliwoœci¹ f=0 na œrodku dla translacji');
xlabel('czêstotliwoœæ f');
ylabel('amplituda czêstotliwoœci');

figure(5);
hold on; grid on;
plot(fftshift(Y1)); %wykres transformaty Fourier'a wyœrodkowany
% plot(f,fftshift(X1));
title('Wykres Transformaty Fouriera z czêstotliwoœci¹ f=0 na œrodku dla rotacji');
xlabel('czêstotliwoœæ f');
ylabel('amplituda czêstotliwoœci');