function [Players,Bote] = apuestas1( Players, NPlayers)

for n=1:NPlayers
    Players(n).money=Players(n).money-500;
    Players(n).in=500;
    Bote= 500*NPlayers;
    
end


end