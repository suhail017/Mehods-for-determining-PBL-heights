clc
close all


%% Bulk Richardson Method

g = 9.8;
Theta_V=PotTemp;      %virtaul potential temperature at height z
Theta_v0= Theta_V(1); %virtual potential temperature at surface
z=Altitude;           %height of the radiosonde
WS(WS==99999)=0;
w= WS;                %wind components of the radiosonde
for i=1:length(Altitude)
br(i)= ((0.5)*(w(i)^2)/((g/Theta_v0)*(Theta_V(i)-Theta_v0)*z(i)-z(1)));
end

br_final = br(br>0.5);
% br_final = br_final(1);
% br2 = br(:);
