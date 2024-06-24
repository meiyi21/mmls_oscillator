%% LN parameters

% 定义参数结构体 paramLN 并存储各参数值
paramLN.cyc_c = 1;
paramLN.S1 = 1.45*1.1; %%% Per mRNA synthesis rate, increase
paramLN.S3 = 1.45;
paramLN.S2 = 0.48;
paramLN.S4 = 0.48;
paramLN.S5 = 1.63; 
paramLN.S6 = 0.47;
paramLN.r = 4;
paramLN.R1 = 1.02;
paramLN.R2 = 1.02;
paramLN.R3 = 0.89;
paramLN.a = 1;
paramLN.A1 = 0.45;
paramLN.A2 = 0.45;
paramLN.A3 = 0.8;
paramLN.B1 = 0;
paramLN.B2 = 0;
paramLN.B3 = 0.6;
paramLN.V1 = 1.45;
paramLN.V2 = 1.45;
paramLN.V3 = 1.63;
paramLN.V4 = 1.63;
paramLN.T1 = 1.73;
paramLN.T2 = 0.72;
paramLN.T3 = 1.63; 
paramLN.T4 = 0.52; 
paramLN.K1 = 2;
paramLN.K2 = 2;
paramLN.K3 = 2;
paramLN.K4 = 2;
paramLN.D1 = 0.94*1.1; %%% Per mRNA degrading rate, increase
paramLN.D3 = 0.94;
paramLN.D2 = 0.44;
paramLN.D4 = 0.44;
paramLN.D5 = 0.44;
paramLN.D6 = 0.29;
paramLN.D7 = 0.54;
paramLN.D8 = 0.6;
paramLN.D9 = 0.6;
paramLN.D10 = 0.3; 
paramLN.L1 = 0.3;
paramLN.L3 = 0.3;
paramLN.L2 = 0.2;
paramLN.L4 = 0.2;
paramLN.L5 = 0.2;
paramLN.L6 = 0.2;
paramLN.L7 = 0.13;
paramLN.L8 = 0.2;
paramLN.L9 = 0.2;
paramLN.L10 = 0.2;
paramLN.D0 = 0.012;
paramLN.C1 = 0;
paramLN.C2 = 0;
paramLN.C3 = 0;

%% DN parameters
% 定义参数结构体 paramDN 并存储各参数值
paramDN.cyc_c = 1;
paramDN.S1 = 1.45*0.9; %%% Per mRNA synthesis rate, decrease
paramDN.S3 = 1.45;
paramDN.S2 = 0.48;
paramDN.S4 = 0.48;
paramDN.S5 = 1.63;  
paramDN.S6 = 0.47;
paramDN.r = 4;
paramDN.R1 = 1.02;
paramDN.R2 = 1.02;
paramDN.R3 = 0.89;
paramDN.a = 1;
paramDN.A1 = 0.45;
paramDN.A2 = 0.45;
paramDN.A3 = 0.8;
paramDN.B1 = 0;
paramDN.B2 = 0;
paramDN.B3 = 0.6;
paramDN.V1 = 1.45;
paramDN.V2 = 1.45;
paramDN.V3 = 1.63;
paramDN.V4 = 1.63;
paramDN.T1 = 1.73;
paramDN.T2 = 0.72;
paramDN.T3 = 1.63;
paramDN.T4 = 0.52;
paramDN.K1 = 2;
paramDN.K2 = 2;
paramDN.K3 = 2;
paramDN.K4 = 2;
paramDN.D1 = 0.94*0.9; %%% Per mRNA synthesis rate, decrease
paramDN.D3 = 0.94;
paramDN.D2 = 0.44;
paramDN.D4 = 0.44;
paramDN.D5 = 0.44;
paramDN.D6 = 0.29;
paramDN.D7 = 0.54; 
paramDN.D8 = 0.6;
paramDN.D9 = 0.6;
paramDN.D10 = 0.3;
paramDN.L1 = 0.3;
paramDN.L3 = 0.3;
paramDN.L2 = 0.2;
paramDN.L4 = 0.2;
paramDN.L5 = 0.2;
paramDN.L6 = 0.2;
paramDN.L7 = 0.13;
paramDN.L8 = 0.2;
paramDN.L9 = 0.2;
paramDN.L10 = 0.2;
paramDN.D0 = 0.012;
paramDN.C1 = 0;
paramDN.C2 = 0;
paramDN.C3 = 0.56;  %%%%% Clkm level increase from 0

%% reference parameters
% 定义参数结构体 param_ref 并存储各参数值
param_ref.cyc_c = 1;
param_ref.S1 = 1.45;
param_ref.S3 = 1.45;
param_ref.S2 = 0.48;
param_ref.S4 = 0.48;
param_ref.S5 = 1.63;
param_ref.S6 = 0.47;
param_ref.r = 4;
param_ref.R1 = 1.02;
param_ref.R2 = 1.02;
param_ref.R3 = 0.89;
param_ref.a = 1;
param_ref.A1 = 0.45;
param_ref.A2 = 0.45;
param_ref.A3 = 0.8;
param_ref.B1 = 0;
param_ref.B2 = 0;
param_ref.B3 = 0.6;
param_ref.V1 = 1.45;
param_ref.V2 = 1.45;
param_ref.V3 = 1.63;
param_ref.V4 = 1.63;
param_ref.T1 = 1.73;
param_ref.T2 = 0.72;
param_ref.T3 = 1.63;
param_ref.T4 = 0.52;
param_ref.K1 = 2;
param_ref.K2 = 2;
param_ref.K3 = 2;
param_ref.K4 = 2;
param_ref.D1 = 0.94;
param_ref.D3 = 0.94;
param_ref.D2 = 0.44;
param_ref.D4 = 0.44;
param_ref.D5 = 0.44;
param_ref.D6 = 0.29;
param_ref.D7 = 0.54;
param_ref.D8 = 0.6;
param_ref.D9 = 0.6;
param_ref.D10 = 0.3;
param_ref.L1 = 0.3;
param_ref.L3 = 0.3;
param_ref.L2 = 0.2;
param_ref.L4 = 0.2;
param_ref.L5 = 0.2;
param_ref.L6 = 0.2;
param_ref.L7 = 0.13;
param_ref.L8 = 0.2;
param_ref.L9 = 0.2;
param_ref.L10 = 0.2;
param_ref.D0 = 0.012;
param_ref.C1 = 0;
param_ref.C2 = 0;
param_ref.C3 = 0;


%%
T=100000;
dt=0.1;

res_LN =simu_protein(paramLN,  T,dt);
res_DN =simu_protein(paramDN,  T,dt);
res_ref=simu_protein(param_ref,T,dt);

%%

subplot(2, 1, 1);
plot(res_LN.per_m(7000:9999), 'color', 'blue', 'LineWidth', 1.5,'DisplayName', 'sLNv');
hold on;
plot(res_DN.per_m(7000:9999), 'color', 'green', 'LineWidth', 1.5,'DisplayName', 'DN1p');
hold on;
plot(res_ref.per_m((7000-175):(9999-175)), 'color', 'red','LineStyle', '--', 'DisplayName', 'standard ref');
legend('show');
title('Per_m Plot'); % 添加标题
hold off;

% 激活第二个子图
subplot(2, 1, 2);
plot(res_LN.clk_c(7000:9999), 'color', 'blue','LineWidth', 1.5,'DisplayName', 'sLNv');
hold on;
plot(res_DN.clk_c(7000:9999), 'color', 'green', 'LineWidth', 1.5,'DisplayName', 'DN1p');
hold on;
plot(res_ref.clk_c((7000-175):(9999-175)), 'color', 'red','LineStyle', '--', 'DisplayName', 'standard ref');
legend('show');
title('Clk_c Plot'); % 添加标题
hold off;

% 添加整体的X轴和Y轴标签
xlabel('Time');



