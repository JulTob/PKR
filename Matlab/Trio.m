function [Is, upto]= Trio(card1,card2,card3,card4,card5)
% Determina si es un trio

    steps= sort([card1.pos,card2.pos,card3.pos,card4.pos,card5.pos]);
    
if (isequaln(steps(1:3),steps(3:-1:1)))
    Is=true;
    upto=steps(3);
elseif (isequaln(steps(2:4),steps(4:-1:2)))
        Is=true;
    upto=steps(3);
elseif (isequaln(steps(3:5),steps(5:-1:3)))
        Is=true;
       upto=steps(3);
else
    Is=false;
    upto=0;
end
