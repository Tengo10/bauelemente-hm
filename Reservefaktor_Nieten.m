disp("Angr. Kräfte");
Fs = input("Fs in N: ");
Fz = input("Fz in N: ");
disp("Bruchkräft");
Fsb = input("Fsb in N: ");
Fzb = input("Fsz in N: ");
disp("1: Paßniete, 2: Vollniete, 3: Blindniete")
N = input("Nietentype Nr: ");
Niet_db = [
    0.4, 0.8;
    0.25, 0.5;
    0.1, 0.2;
    ];

Rz = Fz/Fzb;
Rs = Fs/Fsb;
Rn = Rz/Rs;
OP = sqrt(Rz*Rz+Rs*Rs);

Kl = [Niet_db(N, 1), Niet_db(N, 2)];
if Rn*0.5 > Kl(1)
    S = Kl(1)/Rn;
    OS = sqrt(S*S+0.25);
    RF = OS/OP;
    
else 
    Sx = Kl(2)/(Rn+Kl(2));
    Sy = -Kl(2)*Sx+Kl(2);
    OS = sqrt(Sx*Sx+Sy*Sy);
    RF = OS/OP;
end


disp("Reservefaktor RF: " + RF);
    