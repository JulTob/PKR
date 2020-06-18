function val= PosAVal(Pos)
%Devuelve el valor de cierta posicion en palo
switch Pos
    case 1,14
        val='A';
    case 2
        val='2';
    case 3
        val='3';
    case 4
        val='4';
    case 5
        val='5';
    case 6
        val='6';
    case 7
        val='7';
    case 8
        val='8';
    case 9
        val='9';
    case 10
        val='10';
    case 11
        val='J';
    case 12
        val='Q';
    case 13
        val='K';
    otherwise
        val=0;
end
end
