i = 1;
exit = false;
Nx = zeros(1);
Ny = zeros(1);
A = ones(1);
disp("Unterschiedliche Durchmesser?");
u_a = input("Ja = 1, Nein = 0: ");

disp("Koordinaten der Nieten: ");
disp("Leere Koordinate um Eingabe zu beenden");

while ~exit
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
Kx = input("Kraft X Koordinate: ");
Ky = input("Kraft Y Koordinate: ");
Fx = input("Kraft in X Richtung: ");
Fy = input("Kraft in Y Richtung: ");

Sx = sum(Nx)/length(Nx);                                    % calculate x center coords
Sy = sum(Ny)/length(Nx);                                    % calculate y center coords

% calculate force from x & y
Rx = -Fx*A/sum(A);
Ry = -Fy*A/sum(A);

% calculate force from moment
m_0 = Fx *(Sx-Kx) + Fy * (Sy-Ky);                           % moment around center
rn = sqrt((Sx-Nx).*(Sx-Nx) + (Sy-Ny).*(Sy-Ny));             % distance from center for each rivet
Fm = m_0 .* rn .* A / sum(rn.*rn.*A);                       % force acting on each rivet

