
%% standard parameter value
cyc_c=1;
S1=1.45;
S3=1.45;
S2=0.48;
S4=0.48;
S5=1.63;
S6=0.47;
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
C1=0;
C2=0;
C3=0;



%% initial value

T=100000;
dt=0.1;

Per_m = zeros(100000,3); %% 1 LN   2 DN   3 standard
Per_c = zeros(100000,3);
Tim_m = zeros(100000,3);
Tim_c = zeros(100000,3);
PT_c = zeros(100000,3);
PT_n = zeros(100000,3);
Clk_m = zeros(100000,3);
Clk_c = zeros(100000,3);
CC_c = zeros(100000,3);
CC_n = zeros(100000,3);

for i=1:3
    Per_m(1,i)=3;
    Tim_m(1,i)=0;
    PT_c(1,i)=0;
    PT_n(1,i)=0;
    Clk_m(1,i)=2;
    Clk_c(1,i)=0;
    CC_c(1,i)=0.05;
    CC_n(1,i)=0.05;
end


%% iteration

for t=1:T-1

        % for standard reference
        dPer_mdt = C1 + S1 * (((CC_n(t,3)/A1)^a + B1) / (1 + (PT_n(t,3)/R1)^r + (CC_n(t,3)/A1)^a + B1)) - D1 * (Per_m(t,3)/(L1 + Per_m(t,3))) - D0 * Per_m(t,3);
        dPer_cdt = S2 * Per_m(t,3) - V1 * Per_c(t,3) * Tim_c(t,3) + V2 * PT_c(t,3) - D2 * (Per_c(t,3)/(L2 + Per_c(t,3))) - D0 * Per_c(t,3);
        dTim_mdt = C2 + S3 * (((CC_n(t,3)/A2)^a + B2) / (1 + (PT_n(t,3)/R2)^r + (CC_n(t,3)/A2)^a + B2)) - D3 * (Tim_m(t,3)/(L3 + Tim_m(t,3))) - D0 * Tim_m(t,3);
        dTim_cdt = S4 * Tim_m(t,3) - V1 * Per_c(t,3) * Tim_c(t,3) + V2 * PT_c(t,3) - D4 * (Tim_c(t,3)/(L4 + Tim_c(t,3))) - D0 * Tim_c(t,3);
        dPT_cdt = V1 * Per_c(t,3) * Tim_c(t,3) - V2 * PT_c(t,3) - T1 * (PT_c(t,3)/(K1 + PT_c(t,3))) + T2 * (PT_n(t,3)/(K2 + PT_n(t,3))) - D5 * (PT_c(t,3)/(L5 + PT_c(t,3))) - D0 * PT_c(t,3);
        dPT_ndt = T1 * (PT_c(t,3)/(K1 + PT_c(t,3))) - T2 * (PT_n(t,3)/(K2 + PT_n(t,3))) - D6 * (PT_n(t,3)/(L6 + PT_n(t,3))) - D0 * PT_n(t,3);
        dClk_mdt = C3 + S5 * (((PT_n(t,3)/A3)^a + B3) / (1 + (CC_n(t,3)/R3)^r + (PT_n(t,3)/A3)^a + B3)) - D7 * (Clk_m(t,3)/(L7 + Clk_m(t,3))) - D0 * Clk_m(t,3);
        dClk_cdt = S6 * Clk_m(t,3) - V3 * Clk_c(t,3) * cyc_c + V4 * CC_c(t,3) - D8 * (Clk_c(t,3)/(L8 + Clk_c(t,3))) - D0 * Clk_c(t,3);
        dCC_cdt = V3 * Clk_c(t,3) * cyc_c - V4 * CC_c(t,3) - T3 * (CC_c(t,3)/(K3 + CC_c(t,3))) + T4 * (CC_n(t,3)/(K4 + CC_n(t,3))) - D9 * (CC_c(t,3)/(L9 + CC_c(t,3))) - D0 * CC_c(t,3);
        dCC_ndt = T3 * (CC_c(t,3)/(K3 + CC_c(t,3))) - T4 * (CC_n(t,3)/(K4 + CC_n(t,3))) - D10 * (CC_n(t,3)/(L10 + CC_n(t,3))) - D0 * CC_n(t,3);
        Per_m(t+1,3)=Per_m(t,3)+dPer_mdt*dt;
        Per_c(t+1,3)=Per_c(t,3)+dPer_cdt*dt;
        Tim_m(t+1,3)=Tim_m(t,3)+dTim_mdt*dt;
        Tim_c(t+1,3)=Tim_c(t,3)+dTim_cdt*dt;
        PT_c(t+1,3)=PT_c(t,3)+dPT_cdt*dt;
        PT_n(t+1,3)=PT_n(t,3)+dPT_ndt*dt;
        Clk_m(t+1,3)=Clk_m(t,3)+dClk_mdt*dt;
        Clk_c(t+1,3)=Clk_c(t,3)+dClk_cdt*dt;
        CC_c(t+1,3)=CC_c(t,3)+dCC_cdt*dt;
        CC_n(t+1,3)=CC_n(t,3)+dCC_ndt*dt;

        % for LN cell

        S1=S1*1.1;  % property of LN
        D1=D1*1.1;  % property of LN

        S1=interaction_DN2LN(Per_m(t,2),S1,D1).s1;
        D1=interaction_DN2LN(Per_m(t,2),S1,D1).d1;


        dPer_mdt = C1 + S1 * (((CC_n(t,1)/A1)^a + B1) / (1 + (PT_n(t,1)/R1)^r + (CC_n(t,1)/A1)^a + B1)) - D1 * (Per_m(t,1)/(L1 + Per_m(t,1))) - D0 * Per_m(t,1);
        dPer_cdt = S2 * Per_m(t,1) - V1 * Per_c(t,1) * Tim_c(t,1) + V2 * PT_c(t,1) - D2 * (Per_c(t,1)/(L2 + Per_c(t,1))) - D0 * Per_c(t,1);
        dTim_mdt = C2 + S3 * (((CC_n(t,1)/A2)^a + B2) / (1 + (PT_n(t,1)/R2)^r + (CC_n(t,1)/A2)^a + B2)) - D3 * (Tim_m(t,1)/(L3 + Tim_m(t,1))) - D0 * Tim_m(t,1);
        dTim_cdt = S4 * Tim_m(t,1) - V1 * Per_c(t,1) * Tim_c(t,1) + V2 * PT_c(t,1) - D4 * (Tim_c(t,1)/(L4 + Tim_c(t,1))) - D0 * Tim_c(t,1);
        dPT_cdt = V1 * Per_c(t,1) * Tim_c(t,1) - V2 * PT_c(t,1) - T1 * (PT_c(t,1)/(K1 + PT_c(t,1))) + T2 * (PT_n(t,1)/(K2 + PT_n(t,1))) - D5 * (PT_c(t,1)/(L5 + PT_c(t,1))) - D0 * PT_c(t,1);
        dPT_ndt = T1 * (PT_c(t,1)/(K1 + PT_c(t,1))) - T2 * (PT_n(t,1)/(K2 + PT_n(t,1))) - D6 * (PT_n(t,1)/(L6 + PT_n(t,1))) - D0 * PT_n(t,1);
        dClk_mdt = C3 + S5 * (((PT_n(t,1)/A3)^a + B3) / (1 + (CC_n(t,1)/R3)^r + (PT_n(t,1)/A3)^a + B3)) - D7 * (Clk_m(t,1)/(L7 + Clk_m(t,1))) - D0 * Clk_m(t,1);
        dClk_cdt = S6 * Clk_m(t,1) - V3 * Clk_c(t,1) * cyc_c + V4 * CC_c(t,1) - D8 * (Clk_c(t,1)/(L8 + Clk_c(t,1))) - D0 * Clk_c(t,1);
        dCC_cdt = V3 * Clk_c(t,1) * cyc_c - V4 * CC_c(t,1) - T3 * (CC_c(t,1)/(K3 + CC_c(t,1))) + T4 * (CC_n(t,1)/(K4 + CC_n(t,1))) - D9 * (CC_c(t,1)/(L9 + CC_c(t,1))) - D0 * CC_c(t,1);
        dCC_ndt = T3 * (CC_c(t,1)/(K3 + CC_c(t,1))) - T4 * (CC_n(t,1)/(K4 + CC_n(t,1))) - D10 * (CC_n(t,1)/(L10 + CC_n(t,1))) - D0 * CC_n(t,1);

        Per_m(t+1,1)=Per_m(t,1)+dPer_mdt*dt;
        Per_c(t+1,1)=Per_c(t,1)+dPer_cdt*dt;
        Tim_m(t+1,1)=Tim_m(t,1)+dTim_mdt*dt;
        Tim_c(t+1,1)=Tim_c(t,1)+dTim_cdt*dt;
        PT_c(t+1,1)=PT_c(t,1)+dPT_cdt*dt;
        PT_n(t+1,1)=PT_n(t,1)+dPT_ndt*dt;
        Clk_m(t+1,1)=Clk_m(t,1)+dClk_mdt*dt;
        Clk_c(t+1,1)=Clk_c(t,1)+dClk_cdt*dt;
        CC_c(t+1,1)=CC_c(t,1)+dCC_cdt*dt;
        CC_n(t+1,1)=CC_n(t,1)+dCC_ndt*dt;


        S1=1.45; %reset to ref
        D1=0.94; %reset to ref


        % for DN cell

        C3=0.56;      % property of DN
        S1=1.45*0.9;  % property of DN
        D1=0.94*0.9;  % property of DN

        S1=interaction_LN2DN(Per_m(t,1),S1,D1).s1;
        D1=interaction_LN2DN(Per_m(t,1),S1,D1).d1;

        dPer_mdt = C1 + S1 * (((CC_n(t,2)/A1)^a + B1) / (1 + (PT_n(t,2)/R1)^r + (CC_n(t,2)/A1)^a + B1)) - D1 * (Per_m(t,2)/(L1 + Per_m(t,2))) - D0 * Per_m(t,2);
        dPer_cdt = S2 * Per_m(t,2) - V1 * Per_c(t,2) * Tim_c(t,2) + V2 * PT_c(t,2) - D2 * (Per_c(t,2)/(L2 + Per_c(t,2))) - D0 * Per_c(t,2);
        dTim_mdt = C2 + S3 * (((CC_n(t,2)/A2)^a + B2) / (1 + (PT_n(t,2)/R2)^r + (CC_n(t,2)/A2)^a + B2)) - D3 * (Tim_m(t,2)/(L3 + Tim_m(t,2))) - D0 * Tim_m(t,2);
        dTim_cdt = S4 * Tim_m(t,2) - V1 * Per_c(t,2) * Tim_c(t,2) + V2 * PT_c(t,2) - D4 * (Tim_c(t,2)/(L4 + Tim_c(t,2))) - D0 * Tim_c(t,2);
        dPT_cdt = V1 * Per_c(t,2) * Tim_c(t,2) - V2 * PT_c(t,2) - T1 * (PT_c(t,2)/(K1 + PT_c(t,2))) + T2 * (PT_n(t,2)/(K2 + PT_n(t,2))) - D5 * (PT_c(t,2)/(L5 + PT_c(t,2))) - D0 * PT_c(t,2);
        dPT_ndt = T1 * (PT_c(t,2)/(K1 + PT_c(t,2))) - T2 * (PT_n(t,2)/(K2 + PT_n(t,2))) - D6 * (PT_n(t,2)/(L6 + PT_n(t,2))) - D0 * PT_n(t,2);
        dClk_mdt = C3 + S5 * (((PT_n(t,2)/A3)^a + B3) / (1 + (CC_n(t,2)/R3)^r + (PT_n(t,2)/A3)^a + B3)) - D7 * (Clk_m(t,2)/(L7 + Clk_m(t,2))) - D0 * Clk_m(t,2);
        dClk_cdt = S6 * Clk_m(t,2) - V3 * Clk_c(t,2) * cyc_c + V4 * CC_c(t,2) - D8 * (Clk_c(t,2)/(L8 + Clk_c(t,2))) - D0 * Clk_c(t,2);
        dCC_cdt = V3 * Clk_c(t,2) * cyc_c - V4 * CC_c(t,2) - T3 * (CC_c(t,2)/(K3 + CC_c(t,2))) + T4 * (CC_n(t,2)/(K4 + CC_n(t,2))) - D9 * (CC_c(t,2)/(L9 + CC_c(t,2))) - D0 * CC_c(t,2);
        dCC_ndt = T3 * (CC_c(t,2)/(K3 + CC_c(t,2))) - T4 * (CC_n(t,2)/(K4 + CC_n(t,2))) - D10 * (CC_n(t,2)/(L10 + CC_n(t,2))) - D0 * CC_n(t,2);

        Per_m(t+1,2)=Per_m(t,2)+dPer_mdt*dt;
        Per_c(t+1,2)=Per_c(t,2)+dPer_cdt*dt;
        Tim_m(t+1,2)=Tim_m(t,2)+dTim_mdt*dt;
        Tim_c(t+1,2)=Tim_c(t,2)+dTim_cdt*dt;
        PT_c(t+1,2)=PT_c(t,2)+dPT_cdt*dt;
        PT_n(t+1,2)=PT_n(t,2)+dPT_ndt*dt;
        Clk_m(t+1,2)=Clk_m(t,2)+dClk_mdt*dt;
        Clk_c(t+1,2)=Clk_c(t,2)+dClk_cdt*dt;
        CC_c(t+1,2)=CC_c(t,2)+dCC_cdt*dt;
        CC_n(t+1,2)=CC_n(t,2)+dCC_ndt*dt;

        C3=0; % reset to ref
        S1=1.45; %reset to ref
        D1=0.94; %reset to ref

end

%%
subplot(2, 1, 1);
plot(Per_m(7000:9999,1), 'color', 'blue', 'LineWidth', 1.5, 'DisplayName', 'sLNv');
hold on;
plot(Per_m(7000:9999,2), 'color', 'green', 'LineWidth', 1.5, 'DisplayName', 'DN1p');
hold on;
plot(Per_m((7000-130):(9999-130),3), 'color', 'red','LineStyle', '--', 'DisplayName', 'standard ref');
legend('show');
title('Per_m Plot'); % 添加标题
hold off;

% 激活第二个子图
subplot(2, 1, 2);
plot(Clk_c(7000:9999,1), 'color', 'blue',  'LineWidth', 1.5,'DisplayName', 'sLNv');
hold on;
plot(Clk_c(7000:9999,2), 'color', 'green',  'LineWidth', 1.5,'DisplayName', 'DN1p');
hold on;
plot(Clk_c((7000-130):(9999-130),3), 'color', 'red', 'LineStyle', '--', 'DisplayName', 'standard ref');
legend('show');
title('Clk_c Plot'); % 添加标题
hold off;

% 添加整体的X轴和Y轴标签
xlabel('Time');

function res=interaction_DN2LN(perm,s1now,d1now)
    res.s1=s1now-s1now*((1.45/7)*(perm/5));
    res.d1=d1now-d1now*((0.94/7)*(perm/5));
end
function res=interaction_LN2DN(perm,s1now,d1now)
    res.s1=s1now+s1now*((1.45/6)*(perm/5));
    res.d1=d1now+d1now*((0.94/6)*(perm/5));
end

