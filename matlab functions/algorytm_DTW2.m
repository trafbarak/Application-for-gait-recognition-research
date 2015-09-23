function [odleglosc] = algorytm_DTW2(X, Y, w)
%X, Y - dwa szeregi czasowe, które chcemy porównaæ
%w - algorytm DTW z metod¹ okienkow¹
n = length(X); %d³ugoœæ pierwszego szeregu
m = length(Y); %d³ugoœæ drugiego szeregu
%metoda DTW pozwala na znalezienie najmniejszej odleg³oœci miêdzy 
%dwoma szeregami czasowymi przy dopuszczeniu transformacji czasu 
%dla obu szeregów
%funkcja odleglosci pomiedzy dwoma punktami
%d1 - modu³ z ró¿nicy lub d2 - kwadrat z ró¿nicy

%macierz kosztów DTW
DTW = zeros(n+1,m+1);
w = max(w,abs(n-m)); %adapt window size (szerokoœæ okna)

for i=1:n+1
    for j=1:m+1
        DTW(i,j) = Inf;
    end;
end;
DTW(1,1) = 0;

for i=2:n+1
    for j=max(2,i-w):min(m+1,i+w)
        cost = d2(X(i-1),Y(j-1));
        a = DTW(i,j-1);
        b = DTW(i-1,j-1);
        c = DTW(i-1,j);
        A = [a b c];
        DTW(i,j) = cost + min(A);
    end;
end;
odleglosc = DTW(n+1,m+1);



