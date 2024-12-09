function plot_simulation(state_record, param, thres)
    % 提取参数
    dt = param.dt;
    Enum = param.Enum;
    Mnum = param.Mnum;
    total_num = Enum + Mnum;
    
    % 计算时间向量
    t = dt:dt:(size(state_record, 3) * dt);
    
    % 计算绘图起始点
    lab = floor(thres / dt) + 1;
    
    % 初始化图例字符串
    leg_str = {};
    
    % 提取 E 细胞和 M 细胞的 Per_m 数据，并绘制
    hold on;
    for i = 1:Enum
        x = reshape(state_record(1, i, :), 1, []);
        plot(t(lab:end), x(lab:end));
        leg_str{end+1} = ['E' num2str(i)];
    end
    for i = 1:Mnum
        x = reshape(state_record(1, Enum + i, :), 1, []);
        plot(t(lab:end), x(lab:end));
        leg_str{end+1} = ['M' num2str(i)];
    end
    hold off;
    L_show=(param.actualTime-thres)/dt;
    [pks, locs] = findpeaks(x(end-L_show+1:end));
    period=mean(diff(locs))*0.1;

    xlabel('t(h)');
    ylabel('Per_m');
    legend(leg_str);
    title(['T=' num2str(period) 'h']);
end

