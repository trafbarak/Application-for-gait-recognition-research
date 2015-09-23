function rysowanie_wykresu_1D(t, SKELETON, os, oska, staw, stawik)
nazwy_stawow = struct('nazwa_stawu',{'Biodra', 'Lewe biodro', 'Lewe kolano', 'Lewa stopa', 'Prawe biodro', 'Prawe kolano', 'Prawa stopa', 'Kr�gos�up', 'Lewy bark', 'Lewe rami�', 'Lewe przedrami�', 'Lewa d�o�', 'Prawy bark', 'Prawe rami�', 'Prawe przedrami�', 'Prawa d�o�', 'Szyja', 'G�owa'}, ...
'numer_stawu',{1, 2, 3, 4, 6, 7, 8, 10, 11, 12, 13, 14, 35, 36, 37, 38, 59, 60});

figure(oska);
hold all on; grid on;
plot(t, SKELETON(staw).Dxyz(oska,:));
xlabel('czas [s]');
ylabel(['O� wsp�rz�dnych ', os]);
title(['Wykres przedstawiaj�cy zrzutowany punkt na o� ', os, ' dla stawu: ', nazwy_stawow(stawik).nazwa_stawu]);