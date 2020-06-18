function [Is, upto]= EscaleraColor(card1,card2,card3,card4,card5)
[IsEscalera, upto1]= Escalera(card1,card2,card3,card4,card5);
[IsColor, upto2]=Color(card1,card2,card3,card4,card5);
if IsEscalera &&  IsColor
    Is=true;
    upto=upto1;
else
    Is=false;
    upto=0;
end
end