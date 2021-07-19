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
    s_lx = f_Slx(0, 0, r_m, r_p, f_b, f_02);
else
    ed = input("ed: ");
    s_lx = f_Slx(wrk, ed, r_m, r_p, 0, 0);
end

disp("S_lx: " + s_lx);

