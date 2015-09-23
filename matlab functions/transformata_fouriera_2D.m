function transformata_fouriera_2D(pocz, kon, SKELETON, t, staw, plaszczyzna)
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

if plaszczyzna == 1
    a = 'x'; a1 = 1;
    b = 'y'; b1 = 2;
elseif plaszczyzna == 2 
    a = 'x'; a1 = 1;
    b = 'z'; b1 = 3;
elseif plaszczyzna == 3
    a = 'y'; a1 = 2;
    b = 'z'; b1 = 3;
end;

X = [SKELETON(staw).Dxyz(a1,(pocz:kon));
     SKELETON(staw).Dxyz(b1,(pocz:kon))];
Y = [SKELETON(staw).rxyz(a1,(pocz:kon));
     SKELETON(staw).rxyz(b1,(pocz:kon))];

nx = 500;
ny = 500;
fftx = fft2(X,2*nx-1,2*ny-1);
fftx = fftshift(fftx);

figure(11);
hold on; grid on;
mesh(log(1+abs(fftx)));
title('Wykres Dwuwymiarowej Transformaty Fouriera dla translacji');
zlabel('amplituda cz�stotliwo�ci');

ffty = fft2(Y,2*nx-1,2*ny-1);
ffty = fftshift(ffty);

figure(12);
hold on; grid on;
mesh(log(1+abs(ffty)));
title('Wykres Dwuwymiarowej Transformaty Fouriera dla rotacji');
zlabel('amplituda cz�stotliwo�ci');