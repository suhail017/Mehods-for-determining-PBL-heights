% This code is to read the csv file given by TDI

%% Reading the csv file
A = xlsread('D:\Arrest_Data_from_2010.xlsx');

%% Problem 1(find the # of arestee in 2018)

Year = year(ArrestDate);
B = find(Year(Year==2018));
year_2018_idx = find(Year==2018);
%% Convert it to charecter and find the patterns (problem 2/95% quantile)
ChargeGroupDescription = ChargeGroupDescription(year_2018_idx);
baal = char(ChargeGroupDescription);

magi = ismember(baal,'Robbery','rows');
magi1 =  ismember(baal,'Vehicle Theft','rows');
magi2 =  ismember(baal,'Burglary','rows');
magi3 =  ismember(baal,'Receive Stolen Property','rows');
idx_robber = find(magi>0);
idx_vehicle = find(magi1>0);
idx_Burglary = find(magi2>0);
idx_RSP = find(magi3>0);


Age_robbers = Age(idx_robber);
Age_vehicle = Age(idx_vehicle);
Age_Burglary = Age(idx_Burglary);
Age_RSP = Age(idx_RSP);

Age_data = [Age_robbers;Age_vehicle;Age_Burglary;Age_RSP];

y = quantile(Age_data,0.95);

%% How many bookings of arrestees were made in the area with the most arrests in 2018?

area_name_2018 = AreaName(year_2018_idx);
Location = categorical(area_name_2018);
histogram(Location);
summary(Location);

%% calculate the Z-score of the average age for each charge group
Chargedes_new = find(~cellfun(@isempty,ChargeGroupDescription)); % which function is not empty 
baal_new =char(Chargedes_new);
age_2018 = Age(year_2018_idx);
magi_new = ~ismember(baal_new,'Pre-Delinquency','rows');
magi_new_1 = ~ismember(baal_new,'Non-Criminal Detention','rows');
idx_magi_new = find(magi_new>0);
idx_magi_new_1 = find(magi_new_1>0);
age_2018 = Age(idx_magi_new);
age_2018 = Age(idx_magi_new_1);



