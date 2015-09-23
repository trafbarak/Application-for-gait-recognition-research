function transformata_fouriera(pocz, kon, SKELETON, t, staw, oska)
pocz = pocz * 30 + 1;
kon = kon * 30 + 1;
N = kon - pocz;
%N = length(t); %liczba probek
fp = 2/((t(2)-t(1))); %czestotliwosc probkowania 
%(zgodnie z twierdzeniem o cz�stotliwo�ci pr�bkowania musi by� dwa razy
%wi�ksza ni� najwi�ksza cz�stotliwo�� sygna�u); u nas cz�stotliwo�� sygna�u
%wyniesie maksymalnie 30Hz, gdy� sygna� pobierany jest w cz�stotliwo�ci 30
%FPS'�w, wi�c cz�stotliwo�� pr�bkowania jest dwukrotnie wi�ksza i wynosi
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
plot(fftshift(X1)); %wykres transformaty Fourier'a wy�rodkowany
% plot(f,fftshift(X1));
title('Wykres Transformaty Fouriera z cz�stotliwo�ci� f=0 na �rodku dla translacji');
xlabel('cz�stotliwo�� f');
ylabel('amplituda cz�stotliwo�ci');

figure(5);
hold on; grid on;
plot(fftshift(Y1)); %wykres transformaty Fourier'a wy�rodkowany
% plot(f,fftshift(X1));
title('Wykres Transformaty Fouriera z cz�stotliwo�ci� f=0 na �rodku dla rotacji');
xlabel('cz�stotliwo�� f');
ylabel('amplituda cz�stotliwo�ci');