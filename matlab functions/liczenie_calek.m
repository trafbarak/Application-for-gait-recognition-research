function [calki] = liczenie_calek( SKELETON, t)
stawy = [1 2 3 4 6 7 8 10 11 12 13 14 35 36 37 38 59 60;
         1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18];
liczba_stawow = size(stawy,2);
%macierz calki zawiera calki wszystkich stawow po wszystkich 3. osiach
%calki = zeros(liczba_stawow, 3); %3 - liczba osi
calki = zeros(liczba_stawow, 1); %tylko dla osi y
%sprawdzenie, czy nie ma ujemnych wartoœci
m1 = min(SKELETON(4).Dxyz(2,:)); %lewa kostka
m2 = min(SKELETON(8).Dxyz(2,:)); %prawa kostka
if m1 < m2 
    minimum = m1;
else
    minimum = m2;
end;
minimum = abs(minimum) + 10; %bo kostka jest ok. 10cm nad ziemi¹
for j=1:liczba_stawow
    %skorygowanie wszystkich wartoœci, ¿eby najmniejsz¹ by³a wartoœæ 0
    %(przy kostce)
    for i=1:length(t)
        SKELETON(stawy(1,j)).Dxyz(2,i) = SKELETON(stawy(1,j)).Dxyz(2,i) + minimum;
    end;

    %for k=1:3 %po wszystkich osiach
        calka = 0;
        for i=1:length(t)
            calka = calka + SKELETON(stawy(1,j)).Dxyz(2,i);
        end;
        %calki(j, k) = calka;
        calki(j,1) = calka;
    %end;
end;
