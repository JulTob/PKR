function [Carta,Baraja]=SacarRBaraja(Baraja)
%Saca una Carta de la Baraja aleatoriamente

Carta=RandCard();


if CartaEnBaraja(Carta,Baraja)
    Baraja(Carta.pos,PaloANum(Carta.pal))=0;
elseif ~isequal(Baraja,zeros(13,4))
    [Carta,Baraja]=SacarRBaraja(Baraja);
else
    Carta=CartaNull();

end
