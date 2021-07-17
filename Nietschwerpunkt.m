i = 1;
exit = false;
Nx = zeros(1);
Ny = zeros(1);
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
        break
    end
    Ny(i) = in;
    i = i + 1;
  
end

disp("Koordinaten der Kraft: ");
Kx = input("Kraft X Koordinate: ");
Ky = input("Kraft Y Koordinate: ");
Fx = input("Kraft in X Richtung: ");
Fy = input("Kraft in Y Richtung: ");
M_0 = Fx *(Sx-Kx) + Fy * (Sy-Ky);


Sx = sum(Nx)/length(Nx);
Sy = sum(Ny)/length(Nx);
disp(Sx);
disp(Sy);