function [Players,Baraja] = repartir( Players, NPlayers, Baraja)

for n=1:NPlayers
    [Players(n).C1,Baraja]=SacarRBaraja(Baraja);


end
