function [Is, upto]= Color(card1,card2,card3,card4,card5)
    Is=false;
    steps= sort([card1.pos,card2.pos,card3.pos,card4.pos,card5.pos]);
    if card1.pal==card2.pal
        if card2.pal==card3.pal
            if card3.pal==card4.pal
                if card4.pal==card5.pal
    Is= true;
                end
            end
        end
    end
if steps(1)==1
    upto=14;
elseif Is==true
    upto=max(steps);
else
    upto=0;
end
end