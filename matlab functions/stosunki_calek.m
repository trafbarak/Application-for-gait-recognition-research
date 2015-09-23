function [stosunki_P_L, stosunki_bks, roznice_bks, stosunki_roznic] = stosunki_calek(calki)
%prawa_strona = [6 7 8 35 36 37 38]; %numery stawów z prawej strony
%lewa_strona = [2 3 4 11 12 13 14]; %numery stawów z lewej strony
%stosunki_P_L = zeros(length(prawa_strona), 3); %na 3 osie
stosunki_P_L = zeros(3,3); %biodra, kolana, stopy po 3 osie
kolory = 'rgbkmc';
znaczki = '*vs^+o';
figure();
hold on; grid on;
for j=1:3
    %stosunki prawej strony do lewej
    stosunki_P_L(1,j) = calki(5,j) / calki(2,j); %biodra
    stosunki_P_L(2,j) = calki(6,j) / calki(3,j); %kolana
    stosunki_P_L(3,j) = calki(7,j) / calki(4,j); %stopy
%     stosunki_P_L(4,j) = calki(13,j) / calki(9,j); %barki
%     stosunki_P_L(5,j) = calki(14,j) / calki(10,j); %ramiona
%     stosunki_P_L(6,j) = calki(15,j) / calki(11,j); %przedramiona
%     stosunki_P_L(7,j) = calki(16,j) / calki(12,j); %d³onie
    for i=1:3
        plot(i, stosunki_P_L(i,j), [kolory(i), znaczki(j)]);
    end;
end;


%stosunki biodro, kolano i staw skokowy (stopa)
stosunki_bks = zeros(6,3);
figure();
hold on; grid on;
for j = 1:3
    stosunki_bks(1,j) = calki(5,j) / calki(6,j); %biodro / kolano -> prawa strona
    stosunki_bks(2,j) = calki(2,j) / calki(3,j); %biodro / kolano -> lewa strona
    stosunki_bks(3,j) = calki(6,j) / calki(7,j); %kolano / stopa -> prawa strona
    stosunki_bks(4,j) = calki(3,j) / calki(4,j); %kolano / stopa -> lewa strona
    stosunki_bks(5,j) = calki(5,j) / calki(7,j); %biodro / stopa -> prawa strona
    stosunki_bks(6,j) = calki(2,j) / calki(4,j); %biodro / stopa -> lewa strona
    for i=1:6
        plot(i,stosunki_bks(i,j), [kolory(i), znaczki(j)]);
    end;
end;

%roznice biodro, kolano, staw skokowy (stopa)
roznice_bks = zeros(6,3);
figure();
hold on; grid on;
for j = 1:3
    roznice_bks(1,j) = calki(5,j) - calki(6,j); %biodro - kolano -> prawa strona
    roznice_bks(2,j) = calki(2,j) - calki(3,j); %biodro - kolano -> lewa strona
    roznice_bks(3,j) = calki(6,j) - calki(7,j); %kolano - stopa -> prawa strona
    roznice_bks(4,j) = calki(3,j) - calki(4,j); %kolano - stopa -> lewa strona
    roznice_bks(5,j) = calki(5,j) - calki(7,j); %biodro - stopa -> prawa strona
    roznice_bks(6,j) = calki(2,j) - calki(4,j); %biodro - stopa -> lewa strona
    for i=1:6
        plot(i,roznice_bks(i,j), [kolory(i), znaczki(j)]);
    end;
end;

%stosunki ró¿nic (biodro-kolano) / (kolano-stopa)
stosunki_roznic = zeros(2,3);
figure();
hold on;
grid on;
for j=1:3
    stosunki_roznic(1,j) = roznice_bks(1,j) / roznice_bks(3,j); %prawa strona
    stosunki_roznic(2,j) = roznice_bks(2,j) / roznice_bks(4,j); %lewa strona
    for i=1:2
        plot(i,stosunki_bks(i,j), [kolory(i), znaczki(j)]);
    end;
end;

