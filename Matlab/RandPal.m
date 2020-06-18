function Palo = RandPal()
% Devuelve un palo aleatorio
s=randi(4);
switch s
    case 1
        Palo='T';
    case 2
        Palo='P';
    case 3
        Palo='C';
    case 4
        Palo='D';
    otherwise
        Palo='null';
end



end
