T=100000;
dt=0.1;

param1=load('params.mat').params;
res1=simu_protein(param1,T,dt);

param2=load('params_cper.mat').params_cper;
res2=simu_protein(param2,T,dt);

param3=load('params_ctim.mat').params_ctim;
res3=simu_protein(param3,T,dt);

param4=load('params_cdclk.mat').params_cdclk;
res4=simu_protein(param4,T,dt);

figure;
set(gcf, 'Position', [100, 100, 800, 400]);
subplot(2,2,1);
scatter(res1.clk_m(2000:3000),res1.cc_n(2000:3000),6,'red','filled');
hold on;
scatter(res1.tim_m(2000:3000),res1.pt_n(2000:3000),6,'green','filled');
hold on;
scatter(res1.per_m(2000:3000),res1.pt_n(2000:3000),6,'blue','filled');
title('wt','FontSize', 16);
xlabel('mRNA');
ylabel('Nuclear Complex');
legend('(Clk_m, CC_n)','(Tim_m, PT_n)','(Per_m, PT_n)', 'Location', 'northeastoutside');


subplot(2,2,2);
scatter(res2.clk_m(2000:3000),res2.cc_n(2000:3000),6,'red','filled');
hold on;
scatter(res2.tim_m(2000:3000),res2.pt_n(2000:3000),6,'green','filled');
hold on;
scatter(res2.per_m(2000:3000),res2.pt_n(2000:3000),6,'blue','filled');
title('c-per','FontSize', 16);
xlabel('mRNA');
ylabel('Nuclear Complex');
legend('(Clk_m, CC_n)','(Tim_m, PT_n)','(Per_m, PT_n)', 'Location', 'northeastoutside');

subplot(2,2,3);
scatter(res3.clk_m(2000:3000),res3.cc_n(2000:3000),6,'red','filled');
hold on;
scatter(res3.tim_m(2000:3000),res3.pt_n(2000:3000),6,'green','filled');
hold on;
scatter(res3.per_m(2000:3000),res3.pt_n(2000:3000),6,'blue','filled');
title('c-tim','FontSize', 16);
xlabel('mRNA');
ylabel('Nuclear Complex');
legend('(Clk_m, CC_n)','(Tim_m, PT_n)','(Per_m, PT_n)', 'Location', 'northeastoutside');


subplot(2,2,4);
scatter(res4.clk_m(2000:3000),res4.cc_n(2000:3000),6,'red','filled');
hold on;
scatter(res4.tim_m(2000:3000),res4.pt_n(2000:3000),6,'green','filled');
hold on;
scatter(res4.per_m(2000:3000),res4.pt_n(2000:3000),6,'blue','filled');
title('c-dClk','FontSize', 16);
xlabel('mRNA');
ylabel('Nuclear Complex');
legend('(Clk_m, CC_n)','(Tim_m, PT_n)','(Per_m, PT_n)', 'Location', 'northeastoutside');

saveas(gcf, './res_pic/paper2000_fig5-1.png');

figure;
set(gcf, 'Position', [100, 100, 480, 250]);

plot(res2.per_c(5001:6000), 'color','blue','DisplayName', 'Per_c', 'LineWidth', 2);
hold on;
plot(res2.pt_n(5001:6000)+res2.pt_c(5001:6000)+res2.per_c(5001:6000), 'color','red','DisplayName', 'total PER', 'LineWidth', 2);
hold on;
plot(res2.pt_n(5001:6000), 'color','#00FF00','DisplayName', 'PT_m', 'LineWidth', 2);
hold on;
plot(res2.pt_c(5001:6000), 'color','#66CC99','DisplayName', 'PT_c', 'LineWidth', 2);

legend('Location', 'northeastoutside');
xlabel('Time (hr)');
ylabel('Concentration(nM)');
ylim([0,7]);
title('c-per','FontSize', 16);
set(gca,'XTickLabel',num2str(str2double(get(gca,'XTickLabel'))/10));

saveas(gcf, './res_pic/paper2000_fig5-2.png');


