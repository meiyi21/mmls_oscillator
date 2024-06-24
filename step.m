function next_state = step(state, param, interaction)
    dt = param.dt;
    Enum = param.Enum;
    Mnum = param.Mnum;
    total_num = Enum + Mnum;
    
    next_state = state; % 初始化下一状态
    
    % 处理交互
    for category = 1:2 % 1 对应 E，2 对应 M
        for interaction_type = 1:4 % M_inh, M_act, E_inh, E_act
            for param_index = 1:50
                if interaction(category, interaction_type, param_index) == 1
                    param_name = pos_to_param(param_index);
                    if ~isempty(param_name)
                        for i = 1:total_num
                            if (category == 1 && i <= Enum) || (category == 2 && i > Enum)
                                % 根据需要的参数计算
                                if contains(param_name, 'inh')
                                    factor = Inhibition(state(1, i)); % 假设Per_m为第一列
                                elseif contains(param_name, 'act')
                                    factor = Activation(state(1, i)); % 假设Per_m为第一列
                                else
                                    factor = 1;
                                end
                                if category == 1
                                    if isfield(param.E, param_name)
                                        param.E.(param_name) = param.E.(param_name) * factor;
                                    end
                                else
                                    if isfield(param.M, param_name)
                                        param.M.(param_name) = param.M.(param_name) * factor;
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    
    % 初始化变量并计算 E 细胞的状态变化
    for i = 1:Enum
        v.Per_m = state(1, i);
        v.Per_c = state(2, i);
        v.Tim_m = state(3, i);
        v.Tim_c = state(4, i);
        v.PT_c = state(5, i);
        v.PT_n = state(6, i);
        v.Clk_m = state(7, i);
        v.Clk_c = state(8, i);
        v.CC_c = state(9, i);
        v.CC_n = state(10, i);

        % 提取参数
        p = param.E;

        % 计算下一时刻的状态变化量
        dstate = compute_ode(v, p);

        % 更新下一时刻状态
        next_state(1, i) = v.Per_m + dstate(1) * dt;
        next_state(2, i) = v.Per_c + dstate(2) * dt;
        next_state(3, i) = v.Tim_m + dstate(3) * dt;
        next_state(4, i) = v.Tim_c + dstate(4) * dt;
        next_state(5, i) = v.PT_c + dstate(5) * dt;
        next_state(6, i) = v.PT_n + dstate(6) * dt;
        next_state(7, i) = v.Clk_m + dstate(7) * dt;
        next_state(8, i) = v.Clk_c + dstate(8) * dt;
        next_state(9, i) = v.CC_c + dstate(9) * dt;
        next_state(10, i) = v.CC_n + dstate(10) * dt;
    end
    
    % 初始化变量并计算 M 细胞的状态变化
    for i = Enum+1:total_num
        v.Per_m = state(1, i);
        v.Per_c = state(2, i);
        v.Tim_m = state(3, i);
        v.Tim_c = state(4, i);
        v.PT_c = state(5, i);
        v.PT_n = state(6, i);
        v.Clk_m = state(7, i);
        v.Clk_c = state(8, i);
        v.CC_c = state(9, i);
        v.CC_n = state(10, i);

        % 提取参数
        p = param.M;

        % 计算下一时刻的状态变化量
        dstate = compute_ode(v, p);

        % 更新下一时刻状态
        next_state(1, i) = v.Per_m + dstate(1) * dt;
        next_state(2, i) = v.Per_c + dstate(2) * dt;
        next_state(3, i) = v.Tim_m + dstate(3) * dt;
        next_state(4, i) = v.Tim_c + dstate(4) * dt;
        next_state(5, i) = v.PT_c + dstate(5) * dt;
        next_state(6, i) = v.PT_n + dstate(6) * dt;
        next_state(7, i) = v.Clk_m + dstate(7) * dt;
        next_state(8, i) = v.Clk_c + dstate(8) * dt;
        next_state(9, i) = v.CC_c + dstate(9) * dt;
        next_state(10, i) = v.CC_n + dstate(10) * dt;
    end
end

function dstate = compute_ode(v, p)
    dstate = zeros(size(v));
    dstate(1) = p.S1*(((v.CC_n/p.A1)^p.a+p.B1)/(1+(v.PT_n/p.R1)^p.r+(v.CC_n/p.A1)^p.a+p.B1))-p.D1*(v.Per_m/(p.L1+v.Per_m))-p.D0*v.Per_m;
    dstate(2) = p.S2*v.Per_m-p.V1*v.Per_c*v.Tim_c+p.V2*v.PT_c-p.D2*(v.Per_c/(p.L2+v.Per_c))-p.D0*v.Per_c;
    dstate(3) = p.S3*(((v.CC_n/p.A2)^p.a+p.B2)/(1+(v.PT_n/p.R2)^p.r+(v.CC_n/p.A2)^p.a+p.B2))-p.D3*(v.Tim_m/(p.L3+v.Tim_m))-p.D0*v.Tim_m;
    dstate(4) = p.S4*v.Tim_m-p.V1*v.Per_c*v.Tim_c+p.V2*v.PT_c-p.D4*(v.Tim_c/(p.L4+v.Tim_c))-p.D0*v.Tim_c;
    dstate(5) = p.V1*v.Per_c*v.Tim_c-p.V2*v.PT_c-p.T1*(v.PT_c/(p.K1+v.PT_c))+p.T2*(v.PT_n/(p.K2+v.PT_n))-p.D5*(v.PT_c/(p.L5+v.PT_c))-p.D0*v.PT_c;
    dstate(6) = p.T1*(v.PT_c/(p.K1+v.PT_c))-p.T2*(v.PT_n/(p.K2+v.PT_n))-p.D6*(v.PT_n/(p.L6+v.PT_n))-p.D0*v.PT_n;
    dstate(7) = p.S5*(((v.PT_n/p.A3)^p.a+p.B3)/(1+(v.CC_n/p.R3)^p.r+(v.PT_n/p.A3)^p.a+p.B3))-p.D7*(v.Clk_m/(p.L7+v.Clk_m))-p.D0*v.Clk_m;
    dstate(8) = p.S6*v.Clk_m-p.V3*v.Clk_c*p.cyc_c+p.V4*v.CC_c-p.D8*(v.Clk_c/(p.L8+v.Clk_c))-p.D0*v.Clk_c;
    dstate(9) = p.V3*v.Clk_c*p.cyc_c-p.V4*v.CC_c-p.T3*(v.CC_c/(p.K3+v.CC_c))+p.T4*(v.CC_n/(p.K4+v.CC_n))-p.D9*(v.CC_c/(p.L9+v.CC_c))-p.D0*v.CC_c;
    dstate(10) = p.T3*(v.CC_c/(p.K3+v.CC_c))-p.T4*(v.CC_n/(p.K4+v.CC_n))-p.D10*(v.CC_n/(p.L10+v.CC_n))-p.D0*v.CC_n;
end