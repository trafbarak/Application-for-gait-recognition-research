function [SKELETON] = filtr(SKELETON, staw, oska)
a=SKELETON(staw).Dxyz(oska,:);
m=mean(a);
s=sqrt(var(a));
for i=1:length(a)
	if a(i)>m+3*s
		a(i)=m+3*s;
	elseif a(i)<m-3*s
		a(i)=m-3*s;
	end
end
SKELETON(staw).Dxyz(oska,:) = a;