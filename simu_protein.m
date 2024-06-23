function res=simu_protein(params,T,dt)

     cyc_c = params.cyc_c;
     S1 = params.S1;
     S3 = params.S3;
     S2 = params.S2;
     S4 = params.S4;
     S5 = params.S5;
     S6 = params.S6;
     r = params.r;
     R1 = params.R1;
     R2 = params.R2;
     R3 = params.R3;
     a = params.a;
     A1 = params.A1;
     A2 = params.A2;
     A3 = params.A3;
     B1 = params.B1;
     B2 = params.B2;
     B3 = params.B3;
     V1 = params.V1;
     V2 = params.V2;
     V3 = params.V3;
     V4 = params.V4;
     T1 = params.T1;
     T2 = params.T2;
     T3 = params.T3;
     T4 = params.T4;
     K1 = params.K1;
     K2 = params.K2;
     K3 = params.K3;
     K4 = params.K4;
     D1 = params.D1;
     D3 = params.D3;
     D2 = params.D2;
     D4 = params.D4;
     D5 = params.D5;
     D6 = params.D6;
     D7 = params.D7;
     D8 = params.D8;
     D9 = params.D9;
     D10 = params.D10;
     L1 = params.L1;
     L3 = params.L3;
     L2 = params.L2;
     L4 = params.L4;
     L5 = params.L5;
     L6 = params.L6;
     L7 = params.L7;
     L8 = params.L8;
     L9 = params.L9;
     L10 = params.L10;
     D0 = params.D0;
     C1 = params.C1;
     C2 = params.C2;
     C3 = params.C3;

    Per_m = zeros(100000,1);
    Per_c = zeros(100000,1);
    Tim_m = zeros(100000,1);
    Tim_c = zeros(100000,1);
    PT_c = zeros(100000,1);
    PT_n = zeros(100000,1);
    Clk_m = zeros(100000,1);
    Clk_c = zeros(100000,1);
    CC_c = zeros(100000,1);
    CC_n = zeros(100000,1);

    Per_m(1)=3;
    Tim_m(1)=0;
    PT_c(1)=0;
    PT_n(1)=0;
    Clk_m(1)=2;
    Clk_c(1)=0;
    CC_c(1)=0.05;
    CC_n(1)=0.05;

    for t=1:T-1

        dPer_mdt = C1+S1*(((CC_n(t)/A1)^a+B1)/(1+(PT_n(t)/R1)^r+(CC_n(t)/A1)^a+B1))-D1*(Per_m(t)/(L1+Per_m(t)))-D0*Per_m(t);
        dPer_cdt = S2*Per_m(t)-V1*Per_c(t)*Tim_c(t)+V2*PT_c(t)-D2*(Per_c(t)/(L2+Per_c(t)))-D0*Per_c(t);
        dTim_mdt = C2+S3*(((CC_n(t)/A2)^a+B2)/(1+(PT_n(t)/R2)^r+(CC_n(t)/A2)^a+B2))-D3*(Tim_m(t)/(L3+Tim_m(t)))-D0*Tim_m(t);
        dTim_cdt = S4*Tim_m(t)-V1*Per_c(t)*Tim_c(t)+V2*PT_c(t)-D4*(Tim_c(t)/(L4+Tim_c(t)))-D0*Tim_c(t);
        dPT_cdt = V1*Per_c(t)*Tim_c(t)-V2*PT_c(t)-T1*(PT_c(t)/(K1+PT_c(t)))+T2*(PT_n(t)/(K2+PT_n(t)))-D5*(PT_c(t)/(L5+PT_c(t)))-D0*PT_c(t);
        dPT_ndt = T1*(PT_c(t)/(K1+PT_c(t)))-T2*(PT_n(t)/(K2+PT_n(t)))-D6*(PT_n(t)/(L6+PT_n(t)))-D0*PT_n(t);
        dClk_mdt = C3+S5*(((PT_n(t)/A3)^a+B3)/(1+(CC_n(t)/R3)^r+(PT_n(t)/A3)^a+B3))-D7*(Clk_m(t)/(L7+Clk_m(t)))-D0*Clk_m(t);
        dClk_cdt = S6*Clk_m(t)-V3*Clk_c(t)*cyc_c+V4*CC_c(t)-D8*(Clk_c(t)/(L8+Clk_c(t)))-D0*Clk_c(t);
        dCC_cdt = V3*Clk_c(t)*cyc_c-V4*CC_c(t)-T3*(CC_c(t)/(K3+CC_c(t)))+T4*(CC_n(t)/(K4+CC_n(t)))-D9*(CC_c(t)/(L9+CC_c(t)))-D0*CC_c(t);
        dCC_ndt = T3*(CC_c(t)/(K3+CC_c(t)))-T4*(CC_n(t)/(K4+CC_n(t)))-D10*(CC_n(t)/(L10+CC_n(t)))-D0*CC_n(t);

        Per_m(t+1)=Per_m(t)+dPer_mdt*dt;
        Per_c(t+1)=Per_c(t)+dPer_cdt*dt;
        Tim_m(t+1)=Tim_m(t)+dTim_mdt*dt;
        Tim_c(t+1)=Tim_c(t)+dTim_cdt*dt;
        PT_c(t+1)=PT_c(t)+dPT_cdt*dt;
        PT_n(t+1)=PT_n(t)+dPT_ndt*dt;
        Clk_m(t+1)=Clk_m(t)+dClk_mdt*dt;
        Clk_c(t+1)=Clk_c(t)+dClk_cdt*dt;
        CC_c(t+1)=CC_c(t)+dCC_cdt*dt;
        CC_n(t+1)=CC_n(t)+dCC_ndt*dt;

    end

res.per_m=Per_m;
res.per_c=Per_c;
res.tim_m=Tim_m;
res.tim_c=Tim_c;
res.pt_c=PT_c;
res.pt_n=PT_n;
res.clk_m=Clk_m;
res.clk_c=Clk_c;
res.cc_c=CC_c;
res.cc_n=CC_n;

end

