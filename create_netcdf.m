clc
close all
clear all

% delete (file2)
%% Declaring variables from the input files

file1 = 'CL31.blockAvg_UTEP-003_20150305.nc' ;
% file1= uigetfile; % Get the desired input file
file2 = 'nov14.nc';

% time_offset = ncread(file1,'time_offset') ; %time_offset = time_offset(:) ;
%  backscatter = ncread(file1,'backscatter') ; 
height = ncread(file1,'height');
height_AGL = ncread(file1,'height_AGL');
%  base_time = ncread(file1,'base_time');
  base_time = 1496728800;
% t_new=linspace(0,85800,300);
% t_new=t_new(:);
r = dlmread('june06.dat');
  bc = r(:,(10:287));
  
 t_new=linspace(0,85800,size(bc,1));
t_new=t_new(:);
%% Write the desired variables  
%Base_time

nccreate(file2,'base_time') ;
ncwrite(file2,'base_time',base_time) ;
ncwriteatt(file2,'base_time','long_name','base_time');
ncwriteatt(file2,'base_time','units','seconds since 01 Jan 1970 00:00:00 UTC to starting_time');

%Heght_AGL

nccreate(file2,'height_AGL','datatype','single') ;
ncwrite(file2,'height_AGL',height_AGL) ;
ncwriteatt(file2,'height_AGL','long_name','height of ceilometer above ground');
ncwriteatt(file2,'height_AGL','units','meters');


%Height

nccreate(file2,'height','Dimensions',{'height',385},'datatype','single') ;
ncwrite(file2,'height',height) ;
ncwriteatt(file2,'height','long_name','height of center of range bin above ceilometer');
ncwriteatt(file2,'height','units','meters');



% Time offset
nccreate(file2,'time_offset','Dimensions',{'time',Inf},'datatype','int32') ;
ncwrite(file2,'time_offset',t_new) ;
ncwriteatt(file2,'time_offset','long_name','time offset from base_time');
ncwriteatt(file2,'time_offset','units','number of seconds since base_time');







% Backscatter
nccreate(file2,'backscatter','Dimensions',{'height',385,'time',Inf},'datatype','single','Fillvalue',9.969209968386869e+36) ;
ncwrite(file2,'backscatter',bc) ;
ncwriteatt(file2,'backscatter','long_name','two-way attenuated backscatter with sensitivity normalized units');
ncwriteatt(file2,'backscatter','units','1E5 srad km)^-1');





%% Creating global attributes
ncwriteatt(file2,'/','starting_time','09 June 2017 00:00:00 UTC');
ncwriteatt(file2,'/','ceilometer_type','CL31');
ncwriteatt(file2,'/','serial_number','K3710003');
ncwriteatt(file2,'/','site_id','UTEP');
ncwriteatt(file2,'/','site_elev_mASL',1171);
ncwriteatt(file2,'/','site_lat_N',31.76847);
ncwriteatt(file2,'/','site_lon_E',-106.50321);
ncwriteatt(file2,'/','time_avg_seconds',600);
ncwriteatt(file2,'/','height_avg_meters',0);
ncwriteatt(file2,'/','height_max_meters',7700);
ncwriteatt(file2,'/','creating_program','bscatBlockAvg_netCDF.py');
ncwriteatt(file2,'/','averaging_program','CL_C_functions.dll');
ncwriteatt(file2,'/','averaging_function','avgT_block')


ncdisp(file2)






