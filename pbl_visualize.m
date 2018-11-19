clc
clear all
close all


%% Input the netcdf file that you want to visualize
file1=uigetfile('*.nc');
ncdisp(file1)


%% Storing them in a Variable


Combined_Mixing_Height = ncread(file1,'Combined_Mixing_Height');

%Hybrid Lowest Method for Derived mixing heights from CL31 observations using large wavelet dilation
H_L_MH_Method_L_dilation = ncread(file1,'H-L_MH_Method L-dilation');

%Hybrid Lowest Method for Derived mixing heights from CL31 observations using small wavelet dilation
H_L_MH_Method_S_dilation = ncread(file1,'H-L_MH_Method S-dilation');

%Wavelet 1D Haar Method Derived mixing heights from CL31 observations with small dilation
Wavelet_1D_MH_Method_S_dilation = ncread(file1,'Wavelet_1D_MH_Method S-dilation');

%Wavelet 1D Haar Method Derived mixing heights from CL31 observations with large dilation
Wavelet_1D_MH_Method_L_dilation = ncread(file1,'Wavelet_1D_MH_Method L-dilation');

%Hybrid Method Derived mixing heights from CL31 observations
Hybrid_Method = ncread(file1,'Hybrid_Method');

%Derived Lifting Condensation Level with ASOS surface data using Espys formula
LCL_height = ncread(file1,'LCL height');

Time_Stamp_of_Mixing_Heights = ncread(file1,'Time Stamp of Mixing Heights');   

MT=max(Time_Stamp_of_Mixing_Heights)/3600;
%% Visualization

figure();
plot((Time_Stamp_of_Mixing_Heights)/3600,Hybrid_Method,'--','Linewidth',2,'color','g')
xlim([0 MT])
xlabel('Time (Hour)','Fontsize',14');
ylabel('Mixing Heights (km)','Fontsize',14')
title('Hybrid Method Derived mixing heights from CL31 observations')

figure();
plot((Time_Stamp_of_Mixing_Heights)/3600,LCL_height,'-.','Linewidth',2,'color','r')
xlim([0 MT])
xlabel('Time (Hour)','Fontsize',14');
ylabel('Mixing Heights (km)','Fontsize',14')
title('LCL Method Derived mixing heights from CL31 observations')


figure();
plot((Time_Stamp_of_Mixing_Heights)/3600,Combined_Mixing_Height,':.','Linewidth',2,'color','k')
xlim([0 MT])
xlabel('Time (Hour)','Fontsize',14');
ylabel('Mixing Heights (km)','Fontsize',14')
title('Combined Mixing Height Derived mixing heights from CL31 observations')


figure();
plot((Time_Stamp_of_Mixing_Heights)/3600,H_L_MH_Method_L_dilation,':.','Linewidth',2,'color','c')
xlim([0 MT])
xlabel('Time (Hour)','Fontsize',14');
ylabel('Mixing Heights (km)','Fontsize',14')
title('Hybrid Lowest Method for Derived mixing heights from CL31 observations using large wavelet dilation')


figure();
plot((Time_Stamp_of_Mixing_Heights)/3600,H_L_MH_Method_S_dilation,':.','Linewidth',2,'color','b')
xlim([0 MT])
xlabel('Time (Hour)','Fontsize',14');
ylabel('Mixing Heights (km)','Fontsize',14')
title('Hybrid Lowest Method for Derived mixing heights from CL31 observations using small wavelet dilation')


figure();
plot((Time_Stamp_of_Mixing_Heights)/3600,Wavelet_1D_MH_Method_L_dilation,':.','Linewidth',2,'color','m')
xlim([0 MT])
xlabel('Time (Hour)','Fontsize',14');
ylabel('Mixing Heights (km)','Fontsize',14')
title('Wavelet 1D Haar Method Derived mixing heights from CL31 observations with large dilation')

figure();
plot((Time_Stamp_of_Mixing_Heights)/3600,Wavelet_1D_MH_Method_S_dilation,':.','Linewidth',2,'color','y')
xlim([0 MT])
xlabel('Time (Hour)','Fontsize',14');
ylabel('Mixing Heights (km)','Fontsize',14')
title('Wavelet 1D Haar Method Derived mixing heights from CL31 observations with small dilation')


