function badania_DTW(SKELETON, SKELETON_WZORCOWY, t, staw, stawik, w, kolory, znaczki)
%Badania algorytmu DTW

x = SKELETON_WZORCOWY(staw).Dxyz(1,:);
y = SKELETON_WZORCOWY(staw).Dxyz(2,:);
z = SKELETON_WZORCOWY(staw).Dxyz(3,:);
x1 = SKELETON(staw).Dxyz(1,:);
y1 = SKELETON(staw).Dxyz(2,:);
z1 = SKELETON(staw).Dxyz(3,:);
a = algorytm_DTW2(x,x1,w);
b = algorytm_DTW2(y,y1,w);
c = algorytm_DTW2(z,z1,w);

nazwy_stawow = struct('nazwa_stawu',{'Biodra', 'Lewe biodro', 'Lewe kolano', 'Lewa stopa', 'Prawe biodro', 'Prawe kolano', 'Prawa stopa', 'Krêgos³up', 'Lewy bark', 'Lewe ramiê', 'Lewe przedramiê', 'Lewa d³oñ', 'Prawy bark', 'Prawe ramiê', 'Prawe przedramiê', 'Prawa d³oñ', 'Szyja', 'G³owa'}, ...
'numer_stawu',{1, 2, 3, 4, 6, 7, 8, 10, 11, 12, 13, 14, 35, 36, 37, 38, 59, 60});

figure(11);
hold on; grid on;
plot3(a,b,c, [kolory(mod(stawik,length(kolory))), znaczki(mod(length(t),length(znaczki)))]);
title(['Odleg³oœæ DTW pomiêdzy szkieletem wzorcowym a zwyk³ym dla stawu: ', nazwy_stawow(stawik).nazwa_stawu]);
xlabel('Dla translacji wzglêdem osi X');
ylabel('Dla translacji wzglêdem osi Y');
zlabel('Dla translacji wzglêdem osi Z');