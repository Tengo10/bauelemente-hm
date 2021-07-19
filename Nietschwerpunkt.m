i = 1;
Nx = zeros(1);
Ny = zeros(1);
A = ones(1);
disp("Unterschiedliche Durchmesser?");
u_a = input("Ja = 1, Nein = 0: ");

disp("Koordinaten der Nieten(mm): ");
disp("Leere Koordinate um Eingabe zu beenden");

while true
    in = input("Niete " + i + " X: ");
    if isempty(in)
        break
    end
    Nx(i) = in;
    
    in = input("Niete " + i + " Y: ");
    if isempty(in)
        Ny(i) = 0;
        break
    end
    Ny(i) = in;
    
    if u_a == 1
        in = input("Niete " + i + " A: ");
        if isempty(in)
            Ny(i) = 0;
            break
        end
        A(i) = in;
    else
        A(i) = 1;
    end
    i = i + 1;
end


disp("Koordinaten der Kraft: ");
Kx = input("Kraft X Koordinate(mm): ");
Ky = input("Kraft Y Koordinate(mm): ");
Fx = input("Kraft in X Richtung(N): ");
Fy = input("Kraft in Y Richtung(N): ");

Sx = sum(Nx)/length(Nx);                                    % calculate x center coords
Sy = sum(Ny)/length(Nx);                                    % calculate y center coords


% calculate force from x & y
Fxn = -Fx*A/sum(A);
Fyn = -Fy*A/sum(A);


% calculate force from moment
m_0 = Fx *(Sy-Ky) + Fy * (Kx-Sx);                           % moment around center
rn = sqrt((Sx-Nx).*(Sx-Nx) + (Sy-Ny).*(Sy-Ny));             % distance from center for each rivet
Fm = m_0 .* rn .* A / sum(rn.*rn.*A);                       % force acting on each rivet


% converting moment force to X,Y
Vrx = -(Sy-Ny);
Vry = Sx-Nx;
Vx = Vrx./abs(Vrx);
Vy = Vry./abs(Vry);

Va = atan(Vry./Vrx);
Fxm = -abs(cos(Va)).*Fm.*Vx;
Fym = -abs(sin(Va)).*Fm.*Vy;


% combining both X Y
Fxt = Fxm + Fxn;
Fyt = Fym + Fyn;

Ft = sqrt(Fxt.*Fxt + Fyt.*Fyt);


% plot results
for c = 1:length(Nx)
    line([Sx, Nx(c)], [Sy, Ny(c)] ,"Color", "blue");
    line([Nx(c), Nx(c) + 0.01*Fxm(c)], [Ny(c), Ny(c) + 0.01*Fym(c)], "Color", "red");
    line([Nx(c), Nx(c) + 0.01*Fxt(c)], [Ny(c), Ny(c)], "Color", "green");
    line([Nx(c), Nx(c)], [Ny(c), Ny(c) + 0.01*Fyt(c)], "Color", "green");
    line([Nx(c), Nx(c) + 0.01*Fxt(c)], [Ny(c), Ny(c) + 0.01*Fyt(c)], "Color", "#EDB120");
end


% print results
disp("Rx        Ry        Fx        Fy        Fres");
for c = 1:length(Ft)
    disp(Fxn(c) + "     " + Fyn(c) + "   " + Fxt(c) + "   " + Fyt(c) + "   " + Ft(c))
end
disp(Ft);