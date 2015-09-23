function [os, oska] = wybor_osi(wybrana_os)
%Oœ z - skierowana do kamery - 3
%Oœ y - skierowana do góry - 2
%Oœ x - skierowana w prawo (patrz¹c od strony kamery) - 1

if (wybrana_os == 1)
    os = 'x';
else if (wybrana_os == 2)
        os = 'y';
    else if (wybrana_os == 3)
            os = 'z';
        end;
    end;
end;
oska = wybrana_os;
%os - sting
%oska - int