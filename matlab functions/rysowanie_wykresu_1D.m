function rysowanie_wykresu_1D(t, SKELETON, os, oska, staw, stawik)
nazwy_stawow = struct('nazwa_stawu',{'Biodra', 'Lewe biodro', 'Lewe kolano', 'Lewa stopa', 'Prawe biodro', 'Prawe kolano', 'Prawa stopa', 'Krêgos³up', 'Lewy bark', 'Lewe ramiê', 'Lewe przedramiê', 'Lewa d³oñ', 'Prawy bark', 'Prawe ramiê', 'Prawe przedramiê', 'Prawa d³oñ', 'Szyja', 'G³owa'}, ...
'numer_stawu',{1, 2, 3, 4, 6, 7, 8, 10, 11, 12, 13, 14, 35, 36, 37, 38, 59, 60});

figure(oska);
hold all on; grid on;
plot(t, SKELETON(staw).Dxyz(oska,:));
xlabel('czas [s]');
ylabel(['Oœ wspó³rzêdnych ', os]);
title(['Wykres przedstawiaj¹cy zrzutowany punkt na oœ ', os, ' dla stawu: ', nazwy_stawow(stawik).nazwa_stawu]);