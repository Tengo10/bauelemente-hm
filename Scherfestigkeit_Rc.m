r_m = input("R_m in MPa: ");
r_p = input("R_p0.2 in MPa: ");
%rand = input("Randabstand e/d: ");

r_c = f_Rc(r_m, r_p);

disp("Rc = " + r_c + " MPa");