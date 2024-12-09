function matrix = struct_to_matrix(cellular_interactions)
    % 初始化一个大小为 2*4*50 的三维数组，全为 0
    matrix = zeros(2, 4, 50);
    
    % 定义位置索引函数
    
    % 辅助函数，用于更新矩阵
    function update_matrix(category, interaction_type, list)
        % category: 1 对应 E, 2 对应 M
        % interaction_type: 1 对应 M_inh, 2 对应 M_act, 3 对应 E_inh, 4 对应 E_act
        for i = 1:length(list)
            pos = param_pos(list(i));
            if pos ~= -1
                matrix(category, interaction_type, pos) = 1;
            end
        end
    end

    % 更新矩阵，根据 cell_interactions 结构体
    update_matrix(1, 1, cellular_interactions.E.M_inh);
    update_matrix(1, 2, cellular_interactions.E.M_act);
    update_matrix(1, 3, cellular_interactions.E.E_inh);
    update_matrix(1, 4, cellular_interactions.E.E_act);

    update_matrix(2, 1, cellular_interactions.M.M_inh);
    update_matrix(2, 2, cellular_interactions.M.M_act);
    update_matrix(2, 3, cellular_interactions.M.E_inh);
    update_matrix(2, 4, cellular_interactions.M.E_act);
end
