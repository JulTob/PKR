function [Value, s] = RandVal()
% Devuelve Un valor aleatorio para una carta, y s la pos
s=randi(13);
switch s
    case 1
        Value='A';
    case 2
        Value='2';
    case 3
        Value='3';
    case 4
        Value='4';
    case 5
        Value='5';
    case 6
        Value='6';
    case 7
        Value='7';
    case 8
        Value='8';
    case 9
        Value='9';
    case 10
        Value='10';
    case 11
        Value='J';
    case 12
        Value='Q';
    case 13
        Value='K';
    otherwise
        Value='null';
end



end
