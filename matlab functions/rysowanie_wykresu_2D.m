function rysowanie_wykresu_2D(t, SKELETON, staw, stawik, plaszczyzna)
%XY - 1
%XZ - 2
%YZ - 3
nazwy_stawow = struct('nazwa_stawu',{'Biodra', 'Lewe biodro', 'Lewe kolano', 'Lewa stopa', 'Prawe biodro', 'Prawe kolano', 'Prawa stopa', 'Krêgos³up', 'Lewy bark', 'Lewe ramiê', 'Lewe przedramiê', 'Lewa d³oñ', 'Prawy bark', 'Prawe ramiê', 'Prawe przedramiê', 'Prawa d³oñ', 'Szyja', 'G³owa'}, ...
'numer_stawu',{1, 2, 3, 4, 6, 7, 8, 10, 11, 12, 13, 14, 35, 36, 37, 38, 59, 60});
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
%rysowanie trójwymiarowego wykresu - p³aszczyzny wzglêdem czasu
figure(plaszczyzna+7); %8, 9 lub 10
hold all on; grid on;
plot3(t, SKELETON(staw).Dxyz(a1,:), SKELETON(staw).Dxyz(b1,:));
xlabel('czas [s]');
ylabel(['Oœ wspó³rzêdnych ', a]);
zlabel(['Oœ wspó³rzêdnych ', b]);
title(['Wykres przedstawiaj¹cy zrzutowan¹ p³aszczyznê ', a,b,' na czas dla stawu: ', nazwy_stawow(stawik).nazwa_stawu]);