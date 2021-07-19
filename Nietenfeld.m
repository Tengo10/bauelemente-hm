disp("Berücksichtigung der Verformung:");
v_o = input(" Ja = 1, Nein = 0: ");
if isempty(v_o)
    disp("Defaulting to 0");
    v_o = 0;
end
disp("Unterschiedlicher Durchmesser:");
a_o = input(" Ja = 1, Nein = 0: ");
if isempty(a_o)
    disp("Defaulting to 0");
    a_o = 0;
end

Dn = zeros(1);
An = zeros(1);

i = 1;
F = input("Kraft in N: ");
if a_0
    disp("Durchmesser Nieten: ")
    while true
        in = input("D " + i + " in mm: ");    
        if isempty(in)
            break
        end
        Dn(i) = in;
        An(i) = in*in*pi/4;
        i = i + 1;
    end
               
    disp(Qn);
else
   n = input("Anzahl Nieten: ");
   Dn =  input("Durchmesser in mm: ");
   An = ones(n);
end

Qn = An/sum(An) * F;             % calculating force on rivets