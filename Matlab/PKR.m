% % % PKR
% % Julio Toboso Garcia

%Partida

NPlayers=5;

PKRdata=openPKRdata();

Players= NewTablePlayers(NPlayers);

while not(immortal(Players, NPlayers))
    
    Baraja=NewBaraja();

    [Players,Baraja]=repartir(Players,NPlayers,Baraja);
	
    Bote=0;
    [Players, Bote]= apuestas1(Players,NPlayers);
    
    [mesa.a1,Baraja]=SacarRBaraja(Baraja);
    [mesa.a2,Baraja]=SacarRBaraja(Baraja);
    [mesa.a3,Baraja]=SacarRBaraja(Baraja);
    [mesa.b,Baraja]=SacarRBaraja(Baraja);
    [mesa.c,Baraja]=SacarRBaraja(Baraja);

   Players=UploadHands(Players,NPlayers,mesa);
    
    WinnerN=WhoWins(Players,mesa);
    Players(WinnerN).money=Players(WinnerN).money+Bote;
    
end

savePKRdata(PKRdata);
