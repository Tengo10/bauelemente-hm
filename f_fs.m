function type = f_fs(Rc, s_lx, d, k, f)
%FS_DIAGRAMM erzeugt FS Diagramm
%   TBD
    niet_db = [
            [0.85, 1.3, 0];                 % Passniete
            [0.75, 1.5, 0];                 % Vollniete
            [0.6, 1.7, 0.05*d];             % Blindniete
        ];
    
    niet = niet_db(k,:);                    
    Fsb = Rc * d*d*pi/4;

    s = Fsb/d/s_lx;

    Ll = Fsb/s;                             % Lochleibungsbereich

    Usy = niet(1) * Fsb;                    % intermediate area start
    Usx = Usy/Ll;
    Uex = niet(2) * s;                      % intermediate area start
    Uey = Fsb;

    Smin = d/5.5;                           % min plate thickness

    
    % draw some pretty graphs
    line([0, Uex*2], [Fsb, Fsb], "Color", "blue");
    line([0, 1.2*Fsb/Ll], [0, 1.2*Fsb], "Color", "blue");
    line([0, Usx], [Usy, Usy], "Color", "blue");
    line([Uex, Uex], [0, Uey], "Color", "blue");
    line([s, s], [0, Fsb], "Color", "blue");

    line([Smin, Smin], [0, Smin*Ll], "Color", "red");
    line([Smin, Usx], [Smin*Ll, Usy],  "Color", "red");
    line([Usx, Uex], [Usy, Uey], "Color", "red");
    line([Uex, Uex*2], [Uey, Fsb], "Color", "red");
    
    type = 0                                % TBD
end

