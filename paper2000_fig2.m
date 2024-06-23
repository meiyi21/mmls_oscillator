T=100000;
dt=0.1;

param1=load('params.mat').params;
res1=simu_protein(param1,T,dt);

figure;
set(gcf, 'Position', [100, 100, 800, 400]);
subplot(2,2,1);
plot(res1.per_m(5000:6000), 'color','#000000', 'DisplayName', 'Per_m');
hold on;
plot(res1.per_c(5000:6000), 'color','#333333','DisplayName', 'Per_c');
hold on;
plot(res1.tim_m(5000:6000), 'color','#0000FF','DisplayName', 'Tim_m');
hold on;
plot(res1.tim_c(5000:6000), 'color','#3366CC','DisplayName', 'Tim_c');
hold on;
plot(res1.pt_n(5000:6000), 'color','#00FF00','DisplayName', 'PT_m');
hold on;
plot(res1.pt_c(5000:6000), 'color','#66CC99','DisplayName', 'PT_c');
legend('Location', 'northeastoutside');
xlabel('Time (hr)');
ylabel('Concentration(nM)');
ylim([0,7]);
title('Per-Tim loop');
set(gca,'XTickLabel',num2str(str2double(get(gca,'XTickLabel'))/10));

subplot(2,2,2);
plot(res1.clk_m(5000:6000), 'color','#FF0000', 'DisplayName', 'CLK_m');
hold on;
plot(res1.clk_c(5000:6000), 'color','#CC3333', 'DisplayName', 'CLK_c');
hold on;
plot(res1.cc_c(5000:6000), 'color','#FFFF00',  'DisplayName', 'CC_c');
hold on;
plot(res1.cc_n(5000:6000), 'color','#CCCC33',  'DisplayName', 'CC_n');
legend('Location', 'northeastoutside');
xlabel('Time (hr)');
ylabel('Concentration(nM)');
ylim([0,7]);
title('dCLK loop');
set(gca,'XTickLabel',num2str(str2double(get(gca,'XTickLabel'))/10));

subplot(2,2,3);
scatter(res1.per_m(2000:3000),res1.tim_m(2000:3000),6,'k','filled');
xlabel('per mRNA');
ylabel('tim mRNA');
xlim([-0.2,4.5]);
ylim([-0.2,4.5]);

subplot(2,2,4);
scatter(res1.per_m(2000:3000),res1.clk_m(2000:3000),6,'red','filled');
xlabel('per mRNA');
ylabel('dClk mRNA');
xlim([0,4.8]);
ylim([0,5.6]);

saveas(gcf, './res_pic/paper2000_fig2.png');
