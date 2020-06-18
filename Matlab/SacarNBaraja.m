function [Carta,Baraja]=SacarNBaraja(Baraja,N)
% Saca la carta en la posición N de la Baraja si está

Carta=CartaN(N);


if CartaEnBaraja(Carta,Baraja)
    Baraja(Carta.pos,PaloANum(Carta.pal))=0;
else
    Carta=CartaNull();

end
