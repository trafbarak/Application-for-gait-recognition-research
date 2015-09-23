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

nazwy_stawow = struct('nazwa_stawu',{'Biodra', 'Lewe biodro', 'Lewe kolano', 'Lewa stopa', 'Prawe biodro', 'Prawe kolano', 'Prawa stopa', 'Kr�gos�up', 'Lewy bark', 'Lewe rami�', 'Lewe przedrami�', 'Lewa d�o�', 'Prawy bark', 'Prawe rami�', 'Prawe przedrami�', 'Prawa d�o�', 'Szyja', 'G�owa'}, ...
'numer_stawu',{1, 2, 3, 4, 6, 7, 8, 10, 11, 12, 13, 14, 35, 36, 37, 38, 59, 60});

figure(11);
hold on; grid on;
plot3(a,b,c, [kolory(mod(stawik,length(kolory))), znaczki(mod(length(t),length(znaczki)))]);
title(['Odleg�o�� DTW pomi�dzy szkieletem wzorcowym a zwyk�ym dla stawu: ', nazwy_stawow(stawik).nazwa_stawu]);
xlabel('Dla translacji wzgl�dem osi X');
ylabel('Dla translacji wzgl�dem osi Y');
zlabel('Dla translacji wzgl�dem osi Z');