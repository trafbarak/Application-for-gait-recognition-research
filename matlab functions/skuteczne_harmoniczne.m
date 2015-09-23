function skuteczne_harmoniczne(pocz, kon, SKELETON, t,oska, staw, stawik, liczba_harmonicznych, kolory, znaczki)
%N = length(t);
pocz = pocz * 30 + 1;
kon = kon * 30 + 1;
N = kon - pocz;
nazwy_stawow = struct('nazwa_stawu',{'Biodra', 'Lewe biodro', 'Lewe kolano', 'Lewa stopa', 'Prawe biodro', 'Prawe kolano', 'Prawa stopa', 'Kr�gos�up', 'Lewy bark', 'Lewe rami�', 'Lewe przedrami�', 'Lewa d�o�', 'Prawy bark', 'Prawe rami�', 'Prawe przedrami�', 'Prawa d�o�', 'Szyja', 'G�owa'}, ...
'numer_stawu',{1, 2, 3, 4, 6, 7, 8, 10, 11, 12, 13, 14, 35, 36, 37, 38, 59, 60});
x = SKELETON(staw).Dxyz(oska,:);
X = fft(x(pocz:kon)); %transformata Fourier'a
%staw - dla kt�rego maj� by� liczone skuteczne harmoniczne
X1 = abs(X);

fr = 0:length(X)-1;
figure(6);
plot(fr(1:liczba_harmonicznych), X1(1:liczba_harmonicznych));
title(['Wykres pierwszych ', num2str(liczba_harmonicznych), ' harmonicznych.']);
xlabel('cz�stotliwo��');
ylabel('amplituda sk�adowej');

% Suma pierwszych 30 warto�ci skutecznych harmonicznych dla rotacji
sumax = 0;
sumay = 0;
sumaz = 0;
% rxyz - rotacja
x = SKELETON(staw).rxyz(1,:);
y = SKELETON(staw).rxyz(2,:);
z = SKELETON(staw).rxyz(3,:);
X = abs(fft(x(pocz:kon))); %wzi�cie tej samej liczby klatek z ca�ego ruchu
Y = abs(fft(y(pocz:kon)));
Z = abs(fft(z(pocz:kon)));
for i=1:liczba_harmonicznych
    sumax = sumax + X(i)*2/sqrt(2);
    sumay = sumay + Y(i)*2/sqrt(2);
    sumaz = sumaz + Z(i)*2/sqrt(2);
end;

figure(7);
plot3(sumax, sumay, sumaz, [kolory(mod(stawik,length(kolory))), znaczki(mod(length(t),length(znaczki)))]);
hold on; grid on;
title(['Suma warto�ci skutecznych rotacji dla ', num2str(liczba_harmonicznych), ' harmonicznych']);
xlabel('Wzgl�dem osi X');
ylabel('Wzgl�dem osi Y');
zlabel('Wzgl�dem osi Z');
%legend(['Plik: ', nazwa_pliku, 'Staw: ', nazwy_stawow(stawik).nazwa_stawu]);