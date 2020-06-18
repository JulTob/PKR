function [Is, upto]= Par(card1,card2,card3,card4,card5)
%Determina si una mano es par
    steps= sort([card1.pos,card2.pos,card3.pos,card4.pos,card5.pos]);
    
if (isequaln(steps(1:2),steps(2:-1:1)))
    Is=true;
    upto=steps(1);
elseif (isequaln(steps(2:3),steps(3:-1:2)))
        Is=true;
    upto=steps(2);
elseif (isequaln(steps(3:4),steps(4:-1:3)))
        Is=true;
       upto=steps(3);
elseif (isequaln(steps(4:5),steps(5:-1:4)))
        Is=true;
    upto=steps(5);
else
    Is=false;
    upto=0;
end
end
