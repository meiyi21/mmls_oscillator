function state_record = simulation(initial_state, param, interaction, simulation_time)
    % 初始化记录数组
    [num_eqns, num_cells] = size(initial_state);
    state_record = zeros(num_eqns, num_cells, simulation_time + 1);
    
    % 记录初始状态
    state_record(:, :, 1) = initial_state;
    
    % 当前状态
    current_state = initial_state;
    
    % 运行仿真
    for t = 1:simulation_time
        next_state = step(current_state, param, interaction);
        state_record(:, :, t + 1) = next_state;
        current_state = next_state;
    end
end
