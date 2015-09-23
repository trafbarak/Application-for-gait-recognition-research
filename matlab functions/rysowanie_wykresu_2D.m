function rysowanie_wykresu_2D(t, SKELETON, staw, stawik, plaszczyzna)
%XY - 1
%XZ - 2
%YZ - 3
nazwy_stawow = struct('nazwa_stawu',{'Biodra', 'Lewe biodro', 'Lewe kolano', 'Lewa stopa', 'Prawe biodro', 'Prawe kolano', 'Prawa stopa', 'Kr�gos�up', 'Lewy bark', 'Lewe rami�', 'Lewe przedrami�', 'Lewa d�o�', 'Prawy bark', 'Prawe rami�', 'Prawe przedrami�', 'Prawa d�o�', 'Szyja', 'G�owa'}, ...
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
%rysowanie tr�jwymiarowego wykresu - p�aszczyzny wzgl�dem czasu
figure(plaszczyzna+7); %8, 9 lub 10
hold all on; grid on;
plot3(t, SKELETON(staw).Dxyz(a1,:), SKELETON(staw).Dxyz(b1,:));
xlabel('czas [s]');
ylabel(['O� wsp�rz�dnych ', a]);
zlabel(['O� wsp�rz�dnych ', b]);
title(['Wykres przedstawiaj�cy zrzutowan� p�aszczyzn� ', a,b,' na czas dla stawu: ', nazwy_stawow(stawik).nazwa_stawu]);