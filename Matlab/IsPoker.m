function [Is, upto]= IsPoker(card1,card2,card3,card4,card5)
    steps= sort([card1.pos,card2.pos,card3.pos,card4.pos,card5.pos]);

    
if (steps(1:4)==steps(4:-1:1))
    Is=true;
    upto=steps(1);
elseif (steps(2:5)==steps(5:-1:2))
        Is=true;
    upto=steps(2);
else
    Is=false;
    upto=0;
end


end
