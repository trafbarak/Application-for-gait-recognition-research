function [os, oska] = wybor_osi(wybrana_os)
%O� z - skierowana do kamery - 3
%O� y - skierowana do g�ry - 2
%O� x - skierowana w prawo (patrz�c od strony kamery) - 1

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