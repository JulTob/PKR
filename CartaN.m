function Carta=CartaN(N)

if ismember(N,(1:13))
        Carta.val=PosAVal(N);
        Carta.pos=N;
        Carta.Pal='P';
        return;
        
elseif ismember(N,(14:26))
        Carta.val=PosAVal(N-13);
        Carta.pos=N-13;
        Carta.Pal='T';  
         return;
elseif ismember(N,(27:38))
        Carta.val=PosAVal(N-26);
        Carta.pos=N-26;
        Carta.Pal='C'; 
         return;
elseif ismember(N,(39:52))
        Carta.val=PosAVal(N-38);
        Carta.pos=N-38;
        Carta.Pal='D'; 
         return;
else
       
        Carta.val='null';
        Carta.pos=0;
        Carta.Pal='null';
         return;
end







end