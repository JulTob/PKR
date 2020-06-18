function [Is, upto]= Escalera(card1,card2,card3,card4,card5)
    steps= sort([card1.pos,card2.pos,card3.pos,card4.pos,card5.pos]);
if steps(1:4)+1==steps(2:5)
    Is=true;
    upto=max(steps);
elseif steps(1:5)==[1,10,11,12,13]
    Is=true;
    upto=14;
else
    Is=false;
    upto=0;
end
end