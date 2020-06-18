function Palo= NumAPalo(numb)
%Da un Palo en char a los Numeros 1 a 4 correspondiendose con PaloANum
switch numb
    case 1
        Palo='P';
    case 2
        Palo='T';
    case 3
        Palo='C';
    case 4
        Palo='D';
    otherwise
        Palo='null';
end
end
