function transformata_fouriera(pocz, kon, SKELETON, t, staw, oska)
pocz = pocz * 30 + 1;
kon = kon * 30 + 1;
N = kon - pocz;
%N = length(t); %liczba probek
fp = 2/((t(2)-t(1))); %czestotliwosc probkowania 
%(zgodnie z twierdzeniem o częstotliwości próbkowania musi być dwa razy
%większa niż największa częstotliwość sygnału); u nas częstotliwość sygnału
%wyniesie maksymalnie 30Hz, gdyż sygnał pobierany jest w częstotliwości 30
%FPS'ów, więc częstotliwość próbkowania jest dwukrotnie większa i wynosi
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
plot(fftshift(X1)); %wykres transformaty Fourier'a wyśrodkowany
% plot(f,fftshift(X1));
title('Wykres Transformaty Fouriera z częstotliwością f=0 na środku dla translacji');
xlabel('częstotliwość f');
ylabel('amplituda częstotliwości');

figure(5);
hold on; grid on;
plot(fftshift(Y1)); %wykres transformaty Fourier'a wyśrodkowany
% plot(f,fftshift(X1));
title('Wykres Transformaty Fouriera z częstotliwością f=0 na środku dla rotacji');
xlabel('częstotliwość f');
ylabel('amplituda częstotliwości');