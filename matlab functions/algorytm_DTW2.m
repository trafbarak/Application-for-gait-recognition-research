function [odleglosc] = algorytm_DTW2(X, Y, w)
%X, Y - dwa szeregi czasowe, kt�re chcemy por�wna�
%w - algorytm DTW z metod� okienkow�
n = length(X); %d�ugo�� pierwszego szeregu
m = length(Y); %d�ugo�� drugiego szeregu
%metoda DTW pozwala na znalezienie najmniejszej odleg�o�ci mi�dzy 
%dwoma szeregami czasowymi przy dopuszczeniu transformacji czasu 
%dla obu szereg�w
%funkcja odleglosci pomiedzy dwoma punktami
%d1 - modu� z r�nicy lub d2 - kwadrat z r�nicy

%macierz koszt�w DTW
DTW = zeros(n+1,m+1);
w = max(w,abs(n-m)); %adapt window size (szeroko�� okna)

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



