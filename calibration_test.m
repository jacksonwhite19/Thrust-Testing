%comment out each section as tests are run
% 1) tare scale (no weight)
% 2) place a known weight on scale
% 3) use


a = arduino('com3','Uno','libraries','basicHX711/basic_HX711')
LoadCell = addon(a,'basicHX711/basic_HX711',{'D2','D3'})
w = 139;
tiledlayout(2,1)
% T = zeros(50,1); %tare
% for x = 1:1:51
%     T(x,1) = read_HX711(LoadCell);
% 
% end


% P = zeros(50:1); %put D battery on motor for this
% 
% for x = 1:1:51
%     P(x,1) = read_HX711(LoadCell);
% end
%  p = mean(P);
% t=mean(T);

for x = 1:1:200
reading = read_HX711(LoadCell);
weight = 0.0020001*reading-17710.2931;
%s(x,1)=readDigitalPin(a,'D6');
if weight < 0
    weight = 0;
else
    weight = weight;
end

d(x,1) = weight;
end

nexttile
plot(d)
xlabel('time (s*10)')
ylabel('weight (g)')

nexttile
force = d*9.81/1000;
plot(force,'k')
xlabel('time (s*10)')
ylabel('force (N)')

clear reading
clear weight
clear W