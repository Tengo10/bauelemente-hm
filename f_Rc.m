function r_c = f_Rc(r_m, r_p)
    %Berechnet die Scherfestigkeit Rc
    %   TBD
    r_c1 = 0.6 * r_m;
    r_c2 = 0.9 * r_p;

    if r_c1 < r_c2
        r_c = r_c1;
    else 
        r_c = r_c2;
    end
end

