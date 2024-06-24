%% parameter setting

dt = 0.1;
T = 100000;
eps = 1e-6;
eqn_num = 10;
num_simulations = 25;
initPos = randi([0, 1], 1, eqn_num);%生成行向量
T_pre = 24 * 30;
T_sim = 72 * 10;
T_show = 72;
L_pre = floor(T_pre / dt);
L_sim = floor(T_sim / dt);
L_show = floor(T_show / dt);

% condition parameters
cyc_c=1;
S1=1.45;
S3=1.45;
S2=0.48;
S4=0.48;
S5=1.63;
S6=0.47;
%S6=0.8
r=4;
R1=1.02;
R2=1.02;
R3=0.89;
a=1;
A1=0.45;
A2=0.45;
A3=0.8;
B1=0;
B2=0;
B3=0.6;
V1=1.45;
V2=1.45;
V3=1.63;
V4=1.63;
T1=1.73;
T2=0.72;
T3=1.63;
T4=0.52;
K1=2;
K2=2;
K3=2;
K4=2;
D1=0.94;
D3=0.94;
D2=0.44;
D4=0.44;
D5=0.44;
D6=0.29;
D7=0.54;
D8=0.6;
D9=0.6;
D10=0.3;
L1=0.3;
L3=0.3;
L2=0.2;
L4=0.2;
L5=0.2;
L6=0.2;
L7=0.13;
L8=0.2;
L9=0.2;
L10=0.2;
D0=0.012;
C1=0;C2=0;C3=0;

% 10 variables
Per_m = zeros(100000,1);
Per_c = zeros(100000,1);
Tim_m = zeros(100000,1);
Tim_c = zeros(100000,1);
PT_c = zeros(100000,1);
PT_n = zeros(100000,1);
Clk_m = zeros(100000,1);
Clk_c = zeros(100000,1);
CC_c = zeros(100000,1);
CC_n = zeros(100000,1);

%% different light proportion
L_time=16; %changeable
%L_time=8
%L_time=12
%L_time=16
%L_time=18
D_time=24-L_time;
Per_m(1)=3;
Tim_m(1)=0;
PT_c(1)=0;
PT_n(1)=0;
Clk_m(1)=2;
Clk_c(1)=0;
CC_c(1)=0.05;
CC_n(1)=0.05;

flag=0;
flag_list=zeros(100000,1);
count=0;
rf=2;
D4_0=D4;

% iteration
for t=1:T-1
    
    if flag==0
        if count==L_time/dt
            flag=1;
            count=0;
        end
    else
        if count==D_time/dt
            flag=0;
            count=0;
        end
    end
    
    if flag==0
        D4=D4_0*rf;
    end
    
    flag_list(t)=flag;

    dPer_mdt = C1+S1*(((CC_n(t)/A1)^a+B1)/(1+(PT_n(t)/R1)^r+(CC_n(t)/A1)^a+B1))-D1*(Per_m(t)/(L1+Per_m(t)))-D0*Per_m(t);
    dPer_cdt = S2*Per_m(t)-V1*Per_c(t)*Tim_c(t)+V2*PT_c(t)-D2*(Per_c(t)/(L2+Per_c(t)))-D0*Per_c(t);
    dTim_mdt = C2+S3*(((CC_n(t)/A2)^a+B2)/(1+(PT_n(t)/R2)^r+(CC_n(t)/A2)^a+B2))-D3*(Tim_m(t)/(L3+Tim_m(t)))-D0*Tim_m(t);
    dTim_cdt = S4*Tim_m(t)-V1*Per_c(t)*Tim_c(t)+V2*PT_c(t)-D4*(Tim_c(t)/(L4+Tim_c(t)))-D0*Tim_c(t);
    dPT_cdt = V1*Per_c(t)*Tim_c(t)-V2*PT_c(t)-T1*(PT_c(t)/(K1+PT_c(t)))+T2*(PT_n(t)/(K2+PT_n(t)))-D5*(PT_c(t)/(L5+PT_c(t)))-D0*PT_c(t);
    dPT_ndt = T1*(PT_c(t)/(K1+PT_c(t)))-T2*(PT_n(t)/(K2+PT_n(t)))-D6*(PT_n(t)/(L6+PT_n(t)))-D0*PT_n(t);
    dClk_mdt = C3+S5*(((PT_n(t)/A3)^a+B3)/(1+(CC_n(t)/R3)^r+(PT_n(t)/A3)^a+B3))-D7*(Clk_m(t)/(L7+Clk_m(t)))-D0*Clk_m(t);
    dClk_cdt = S6*Clk_m(t)-V3*Clk_c(t)*cyc_c+V4*CC_c(t)-D8*(Clk_c(t)/(L8+Clk_c(t)))-D0*Clk_c(t);
    dCC_cdt = V3*Clk_c(t)*cyc_c-V4*CC_c(t)-T3*(CC_c(t)/(K3+CC_c(t)))+T4*(CC_n(t)/(K4+CC_n(t)))-D9*(CC_c(t)/(L9+CC_c(t)))-D0*CC_c(t);
    dCC_ndt = T3*(CC_c(t)/(K3+CC_c(t)))-T4*(CC_n(t)/(K4+CC_n(t)))-D10*(CC_n(t)/(L10+CC_n(t)))-D0*CC_n(t);

    Per_m(t+1)=Per_m(t)+dPer_mdt*dt;
    Per_c(t+1)=Per_c(t)+dPer_cdt*dt;
    Tim_m(t+1)=Tim_m(t)+dTim_mdt*dt;
    Tim_c(t+1)=Tim_c(t)+dTim_cdt*dt;
    PT_c(t+1)=PT_c(t)+dPT_cdt*dt;
    PT_n(t+1)=PT_n(t)+dPT_ndt*dt;
    Clk_m(t+1)=Clk_m(t)+dClk_mdt*dt;
    Clk_c(t+1)=Clk_c(t)+dClk_cdt*dt;
    CC_c(t+1)=CC_c(t)+dCC_cdt*dt;
    CC_n(t+1)=CC_n(t)+dCC_ndt*dt;

    D4=D4_0;
    count=count+1;
end

figure;

hold on;


plot(time_steps(1:L_show)*dt, (1-flag_list(end-L_show+1:end))*5, 'y', 'DisplayName', 'Light/Dark');
hold on;
plot(time_steps(1:L_show)*dt, Per_m(end-L_show+1:end), 'b', 'DisplayName', 'Per_m');

legend('Location', 'northeast');
xlabel('Time (hr)');
ylabel('Concentration');

[pks, locs] = findpeaks(Per_m(end-L_show+1:end),time_steps(1:L_show));


period=mean(diff(locs))*0.1;

titleStr = sprintf('period = %d h, light= %d h, dark = %d h', period, L_time, D_time);

% 设置标题
title(titleStr);

hold off;
