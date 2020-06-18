function [Is, upto]= FullHouse(card1,card2,card3,card4,card5)
    steps= sort([card1.pos,card2.pos,card3.pos,card4.pos,card5.pos]);
    
if (isequaln(steps(1:3),steps(3:-1:1))...
  && isequaln(steps(4:5),steps(5:-1:4)))
    Is=true;
    upto=steps(1);
elseif (isequaln(steps(3:5),steps(5:-1:3))...
        && isequaln(steps(1:2),steps(2:-1:1)))
        Is=true;
    upto=steps(3);
else
    Is=false;
    upto=0;
end
