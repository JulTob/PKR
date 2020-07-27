function Is=saca_carta (Size)

palo=   N_Random_In_Range(1,4,Size);
carta= N_Random_In_Range(1,10,Size);
for i=1:Size
    if carta(i)>7
        carta(i)= carta(i)+2;
    end
end
Is = [ carta , palo];
end