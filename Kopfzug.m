Dn = input("Durchmesser der Niete in mm: ");
Hn = input("Höhe der Niete in mm: ");
Rc = input("Rc der Niete in MPa: ");


K1 = Dn*Dn*pi/4 * Rc;
K2 = 2 * Dn * Hn * Rc;

if K1 < K2
    Kb = K1;
else
    Kb = K2;
end

disp("Kopfzug in MPa: " + Kb);