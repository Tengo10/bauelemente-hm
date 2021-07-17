disp("Werkstoffe:");
disp("0: Anderer");
disp("1: Unlegierte Stähle Rm < 2000 N/mm²,");
disp("2: Legierte Stähle Rm < 1400 N/mm²,");
disp("3: Legierte Stähle Rm > 1400 N/mm²,");
disp("4: Messing, 5: Kupfer-Beryllium,");
disp("6: Al-Cu, 7: Al-Si, 8: Al-Mg-Si, 9: Al-Zn");
disp("10: Mg-Legierungen, 11: Titanlegierungen");

wrk = input("Werkstoff: ");

r_m = input("Rm in MPa: ");
r_p = input("Rp0.2 in MPa: ");
  
if wrk == 0
    f_b = input("f_b: ");
    f_02 = input("f_0.2: "); 
    
    s_lb = f_b * r_n;
    s_l2 = f_02 * r_p;
    
    if s_lb < 1.5*s_l2
        s_lx = s_lb;
    else 
        s_lx = 1.5 * s_l2;
    end
    
else
    wrk_db = [
        [1.35, 1.3], [1.65, 1.5]; 
        [1.5, 1.4], [2.0, 1.65]; 
        [2100 + 0.56*(r_m - 1400), 1960 + 0.8*(r_p - 1400)], [2800 + 0.8*(r_m - 1400), 2310 + 0.6*(r_p - 1400)]; 
        [1.1, 1.1], [1.2, 1.2]; 
        [1.0, 1.0], [1.08, 1.1];
        [1.5, 1.2], [2.0, 1.45]; 
        [1.3, 0], [1.7, 0]; 
        [1.55, 1.4], [0, 1.53]; 
        [1.25, 0], [1.65, 0]; 
        [1.0, 0], [1.0, 0];
        [1.4, 1.35], [1.7, 1.5];
    ];
  
    ed = input("ed: ");
    
    f_b = [wrk_db(wrk, 1), wrk_db(wrk, 3)];
    f_02 = [wrk_db(wrk, 2), wrk_db(wrk, 4)];
    
    s_lb = f_b * r_m;
    s_l2 = f_02 * r_p;

    if s_lb < 1.5*s_l2
        s_lx = s_lb;
    else 
        s_lx = 1.5*s_l2;
    end
    
    if ed >= 2.0
        s_lx = s_lx(2);
    elseif ed >= 1.5
        s_lx = s_lx(1) + (s_lx(2) - s_lx(1))*2*(ed - 1.5);
    elseif ed > 1
        s_lx = s_lx(1) * (ed - 0.5);
    else
        s_lx = 0;
    end
end

disp("S_lx: " + s_lx);

