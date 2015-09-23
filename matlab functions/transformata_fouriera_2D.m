function transformata_fouriera_2D(pocz, kon, SKELETON, t, staw, plaszczyzna)
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
zlabel('amplituda czêstotliwoœci');

ffty = fft2(Y,2*nx-1,2*ny-1);
ffty = fftshift(ffty);

figure(12);
hold on; grid on;
mesh(log(1+abs(ffty)));
title('Wykres Dwuwymiarowej Transformaty Fouriera dla rotacji');
zlabel('amplituda czêstotliwoœci');