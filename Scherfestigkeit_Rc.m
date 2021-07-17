r_m = input("R_m in MPa: ");
r_p = input("R_p0.2 in MPa: ");
%rand = input("Randabstand e/d: ");

r_c1 = 0.6 * r_m;
r_c2 = 0.9 * r_p;

if r_c1 < r_c2
    r_c = r_c1;
else 
    r_c = r_c2;
end

disp("Rc = " + r_c + " MPa");