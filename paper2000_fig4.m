T=100000;
dt=0.1;

param1=load('params.mat').params;
param2=load('params_per.mat').params_per;
param3=load('params_dclk.mat').params_dclk;
param4=load('params_per_dclk.mat').params_per_dclk;

res1=simu_protein(param1,T,dt);
res2=simu_protein(param2,T,dt);
res3=simu_protein(param3,T,dt);
res4=simu_protein(param4,T,dt);


refc=5.52867;
refp=4.29768;


figure;
subplot(2, 2, 1);
plot(res1.per_m(5000:6000)/refp*100, 'k', 'DisplayName', 'Per_m');
hold on;
plot(res1.clk_m(5000:6000)/refc*100, 'red', 'DisplayName', 'Clk_m');
legend('Location', 'northwest');
xlabel('Time (hr)');
ylabel('Relative Concentration(%)');
ylim([0,140]);
title('WT');
set(gca,'XTickLabel',num2str(str2double(get(gca,'XTickLabel'))/10));

subplot(2, 2, 2);
plot(res2.per_m(5000:6000)/refp*100, 'k', 'DisplayName', 'Per_m');
hold on;
plot(res2.clk_m(5000:6000)/refc*100, 'red', 'DisplayName', 'Clk_m');
legend('Location', 'northwest');
xlabel('Time (hr)');
ylabel('Relative Concentration(%)');
ylim([0,140]);
title('Per Mutant');
set(gca,'XTickLabel',num2str(str2double(get(gca,'XTickLabel'))/10));

subplot(2, 2, 3);
plot(res3.per_m(5000:6000)/refp*100, 'k', 'DisplayName', 'Per_m');
hold on;
plot(res3.clk_m(5000:6000)/refc*100, 'red', 'DisplayName', 'Clk_m');
legend('Location', 'northwest');
xlabel('Time (hr)');
ylabel('Relative Concentration(%)');
ylim([0,140]);
title('Dclk Mutant');
set(gca,'XTickLabel',num2str(str2double(get(gca,'XTickLabel'))/10));

subplot(2, 2, 4);
plot(res4.per_m(5000:6000)/refp*100, 'k', 'DisplayName', 'Per_m');
hold on;
plot(res4.clk_m(5000:6000)/refc*100, 'red', 'DisplayName', 'Clk_m');
legend('Location', 'northwest');
xlabel('Time (hr)');
ylabel('Relative Concentration(%)');
ylim([0,140]);
title('Per+Dclk Mutant');
set(gca,'XTickLabel',num2str(str2double(get(gca,'XTickLabel'))/10));

saveas(gcf, './res_pic/paper2000_fig4.png');
