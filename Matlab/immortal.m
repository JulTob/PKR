function spqu = immortal( Players, NPlayers )
%Solo puede quedar uno

spqu=false;

for n=1:NPlayers
    boolean=true;
     if Players(n).money>0
         for m=1:NPlayers
             if not(m==n)
                boolean= boolean && Players(m).money<=0;
             end
         end
         if boolean
             spqu=true;
         end
     end
end

end
