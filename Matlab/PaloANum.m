function numb= PaloANum(Palo)
%Da un valor numerico a los palos
switch Palo
    case 'P'
        numb=1;
    case 'T'
        numb=2;
    case 'C'
        numb=3;
    case 'D'
        numb=4;
    otherwise
        numb=0;
end
end
