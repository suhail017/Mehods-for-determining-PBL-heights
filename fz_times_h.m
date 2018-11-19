clc 
close all



%% Variables of the Function

z = VarName2; %Range/Height  of the ABL

f_z = [VarName4]; %Backscattering intensity

 a = (max(z) + min(z))/2; %Dialation of the haar fucntion (Needs to change
% in every step to find the PBL
 %a=300;
 
b = 0.5*max(z);% Translator of the Haar function (middle of the altitude)


%% Haar Function
for s=1:length(z)
if ((b-a/2)<= z(s) && z(s)<=b)
     h(s)=1;
%      z1(s)=h(s)*z(s);
     elseif (b<=z(s) && z(s)<=(b+a/2))
     h(s)=-1;
%      z2(s)=h(s)*z(s);
 else
     h(s)=0;
%      z3(s)=h(s)*z(s);
end

end


%% WCT method

for i = 1:length(f_z)
     w(i) = abs((a^-1 * f_z(i) * h(i) * (max(z) - min(z)))); %Brooke et al,.2003
end


subplot(2,1,1), plot(f_z,z),title('Normal Signal')
subplot(2,1,2),plot(w,z),title('WCT Signal')


