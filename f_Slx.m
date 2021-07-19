function s_lx = f_Slx(wrk, ed, r_m, r_p, f_b, f_02)
    %F_SLX 
    %   TBD
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
    if 0 < wrk && wrk <= length(wrk_db)

        f_b = [wrk_db(wrk, 1), wrk_db(wrk, 3)];     % get f_b from wrk table
        f_02 = [wrk_db(wrk, 2), wrk_db(wrk, 4)];    % get f_02 from wrk table
        
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
        
    else
        s_lb = f_b * r_n;
        s_l2 = f_02 * r_p;

        if s_lb < 1.5*s_l2
            s_lx = s_lb;
        else 
            s_lx = 1.5 * s_l2;
        end
    end
end

