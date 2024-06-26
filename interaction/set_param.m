function param=set_param()
    E = struct('cyc_c', 1, 'S1', 1.45, 'S2', 0.48, 'S3', 1.45, 'S4', 0.48, ...
         'S5', 1.63, 'S6', 0.47, 'r', 4, 'R1', 1.02, 'R2', 1.02, ...
         'R3', 0.89, 'a', 1, 'A1', 0.45, 'A2', 0.45, 'A3', 0.8, ...
         'B1', 0, 'B2', 0, 'B3', 0.6, 'V1', 1.45, 'V2', 1.45, ...
         'V3', 1.63, 'V4', 1.63, 'T1', 1.73, 'T2', 0.72, 'T3', 1.63, ...
         'T4', 0.52, 'K1', 2, 'K2', 2, 'K3', 2, 'K4', 2, 'D1', 0.94, ...
         'D2', 0.44, 'D3', 0.94, 'D4', 0.44, 'D5', 0.44, 'D6', 0.29, ...
         'D7', 0.54, 'D8', 0.6, 'D9', 0.6, 'D10', 0.3, 'L1', 0.3, ...
         'L2', 0.2, 'L3', 0.3, 'L4', 0.2, 'L5', 0.2, 'L6', 0.2, ...
         'L7', 0.13, 'L8', 0.2, 'L9', 0.2, 'L10', 0.2, 'D0', 0.012);
     M=E;
     M.T1=2;% transportation rate of PT_c; ref:Zhuoran Li
     param.E=E; 
     param.M=M;
     param.dt=0.1;
     param.Enum=2;
     param.Mnum=2;
     param.actualTime=720;
     param.dt=0.1;
end
