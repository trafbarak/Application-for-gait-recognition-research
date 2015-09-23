function [stosunki_P_L, stosunki_bks, roznice_bks, stosunki_roznic] = stosunki_calek_y(calki)
stosunki_P_L = zeros(3,1); %biodra, kolana, stopy - os y
kolory = 'rgbkmc';
figure();
hold on; grid on;
%stosunki prawej strony do lewej
stosunki_P_L(1) = calki(5) / calki(2); %biodra
stosunki_P_L(2) = calki(6) / calki(3); %kolana
stosunki_P_L(3) = calki(7) / calki(4); %stopy
%     stosunki_P_L(4) = calki(13) / calki(9); %barki
%     stosunki_P_L(5) = calki(14) / calki(10); %ramiona
%     stosunki_P_L(6) = calki(15) / calki(11); %przedramiona
%     stosunki_P_L(7) = calki(16) / calki(12); %d³onie
for i=1:3
    plot(i, stosunki_P_L(i), [kolory(i) '*']);
end;
title({'Wykres stosunków ca³ek prawej do lewej strony.';'1 - Biodra, 2 - kolana, 3 - kostki'});


%stosunki biodro, kolano i staw skokowy (stopa)
stosunki_bks = zeros(3,2);
figure();
hold on; grid on;
stosunki_bks(1,1) = calki(5) / calki(6); %biodro / kolano -> prawa strona
stosunki_bks(1,2) = calki(2) / calki(3); %biodro / kolano -> lewa strona
stosunki_bks(2,1) = calki(6) / calki(7); %kolano / stopa -> prawa strona
stosunki_bks(2,2) = calki(3) / calki(4); %kolano / stopa -> lewa strona
stosunki_bks(3,1) = calki(5) / calki(7); %biodro / stopa -> prawa strona
stosunki_bks(3,2) = calki(2) / calki(4); %biodro / stopa -> lewa strona
for i=1:6
    plot(i,stosunki_bks(i), [kolory(i) '*']);
end;
title({'Wykres stosunków ca³ek dolnej czêœci cia³a.';'1,2 - Biodro/kolano, 3,4 - kolano/kostka, 5,6 - biodro/kostka'});


%roznice biodro, kolano, staw skokowy (stopa)
roznice_bks = zeros(3,2);
figure();
hold on; grid on;
roznice_bks(1,1) = calki(5) - calki(6); %biodro - kolano -> prawa strona
roznice_bks(1,2) = calki(2) - calki(3); %biodro - kolano -> lewa strona
roznice_bks(2,1) = calki(6) - calki(7); %kolano - stopa -> prawa strona
roznice_bks(2,2) = calki(3) - calki(4); %kolano - stopa -> lewa strona
roznice_bks(3,1) = calki(5) - calki(7); %biodro - stopa -> prawa strona
roznice_bks(3,2) = calki(2) - calki(4); %biodro - stopa -> lewa strona
for i=1:6
    plot(i,roznice_bks(i), [kolory(i) '*']);
end;
title({'Wykres ró¿nic ca³ek dolnej czêœci cia³a.','1,2 - Biodro/kolano, 3,4 - kolano/kostka, 5,6 - biodro/kostka'});


%stosunki ró¿nic (biodro-kolano) / (kolano-stopa)
stosunki_roznic = zeros(1,2);
figure();
hold on; grid on;
stosunki_roznic(1,1) = roznice_bks(1) / roznice_bks(3); %prawa strona
stosunki_roznic(1,2) = roznice_bks(2) / roznice_bks(4); %lewa strona
for i=1:2
    plot(i,stosunki_bks(i), [kolory(i) '*']);
end;
title({'Wykres stosunków ró¿nic ca³ek dolnej czêœci cia³a.','Biodro-kolano / kolano-kostka : 1 - prawa strona, 2 - lewa strona'});
