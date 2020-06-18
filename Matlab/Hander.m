function [hand, UpTo] = Hander( card1,card2,card3,card4,card5,card6,card7 )
Is=0;
UpTo=0;

%Escalera Color // StraightFlush

[Is, UpTo]=EscaleraColor(card1,card2,card3,card4,card5);
if Is    
    hand='EscCol';
    return;
end;
[Is, UpTo]=EscaleraColor(card1,card2,card3,card4,card6);
if Is    
    hand='EscCol';
    return;
end;
[Is, UpTo]=EscaleraColor(card1,card2,card3,card4,card7);
if Is    
    hand='EscCol';
    return;
end;
[Is, UpTo]=EscaleraColor(card1,card2,card3,card6,card5);
if Is    
    hand='EscCol';
    return;
end;
[Is, UpTo]=EscaleraColor(card1,card2,card3,card7,card5);
if Is    
    hand='EscCol';
    return;
end;
[Is, UpTo]=EscaleraColor(card1,card2,card6,card4,card5);
if Is    
    hand='EscCol';
    return;
end;
[Is, UpTo]=EscaleraColor(card1,card2,card7,card4,card5);
if Is    
    hand='EscCol';
    return;
end;
[Is, UpTo]=EscaleraColor(card1,card6,card3,card4,card5);
if Is    
    hand='EscCol';
    return;
end;
[Is, UpTo]=EscaleraColor(card1,card7,card3,card4,card5);
if Is    
    hand='EscCol';
    return;
end;
[Is, UpTo]=EscaleraColor(card6,card2,card3,card4,card5);
if Is    
    hand='EscCol';
    return;
end;
[Is, UpTo]=EscaleraColor(card7,card2,card3,card4,card5);
if Is    
    hand='EscCol';
    return;
end;

% % % Poker % % %
[Is, UpTo]=IsPoker(card1,card2,card3,card4,card5);
if Is    
    hand='Poker';
    return;
end;
[Is, UpTo]=IsPoker(card1,card2,card3,card4,card6);
if Is    
    hand='Poker';
    return;
end;
[Is, UpTo]=IsPoker(card1,card2,card3,card4,card7);
if Is    
    hand='Poker';
    return;
end;
[Is, UpTo]=IsPoker(card1,card2,card3,card6,card5);
if Is    
    hand='Poker';
    return;
end;
[Is, UpTo]=IsPoker(card1,card2,card3,card7,card5);
if Is    
    hand='Poker';
    return;
end;
[Is, UpTo]=IsPoker(card1,card2,card6,card4,card5);
if Is    
    hand='Poker';
    return;
end;
[Is, UpTo]=IsPoker(card1,card2,card7,card4,card5);
if Is    
    hand='Poker';
    return;
end;
[Is, UpTo]=IsPoker(card1,card6,card3,card4,card5);
if Is    
    hand='Poker';
    return;
end;
[Is, UpTo]=IsPoker(card1,card7,card3,card4,card5);
if Is    
    hand='Poker';
    return;
end;
[Is, UpTo]=IsPoker(card6,card2,card3,card4,card5);
if Is    
    hand='Poker';
    return;
end;
[Is, UpTo]=IsPoker(card7,card2,card3,card4,card5);
if Is    
    hand='Poker';
    return;
end;

% % % Full House % % %
[Is, UpTo]=FullHouse(card1,card2,card3,card4,card5);
if Is    
    hand='Full';
    return;
end;
[Is, UpTo]=FullHouse(card1,card2,card3,card4,card6);
if Is    
    hand='Full';
    return;
end;
[Is, UpTo]=FullHouse(card1,card2,card3,card4,card7);
if Is    
    hand='Full';
    return;
end;
[Is, UpTo]=FullHouse(card1,card2,card3,card6,card5);
if Is    
    hand='Full';
    return;
end;
[Is, UpTo]=FullHouse(card1,card2,card3,card7,card5);
if Is    
    hand='Full';
    return;
end;
[Is, UpTo]=FullHouse(card1,card2,card6,card4,card5);
if Is    
    hand='Full';
    return;
end;
[Is, UpTo]=FullHouse(card1,card2,card7,card4,card5);
if Is    
    hand='Full';
    return;
end;
[Is, UpTo]=FullHouse(card1,card6,card3,card4,card5);
if Is    
    hand='Full';
    return;
end;
[Is, UpTo]=FullHouse(card1,card7,card3,card4,card5);
if Is    
    hand='Full';
    return;
end;
[Is, UpTo]=FullHouse(card6,card2,card3,card4,card5);
if Is    
    hand='Full';
    return;
end;
[Is, UpTo]=FullHouse(card7,card2,card3,card4,card5);
if Is    
    hand='Full';
    return;
end;

% % % Color % % %


[Is, UpTo]=Color(card1,card2,card3,card4,card5);
if Is    
    hand='Col';
    return;
end;
[Is, UpTo]=Color(card1,card2,card3,card4,card6);
if Is    
    hand='Col';
    return;
end;
[Is, UpTo]=Color(card1,card2,card3,card4,card7);
if Is    
    hand='Col';
    return;
end;
[Is, UpTo]=Color(card1,card2,card3,card6,card5);
if Is    
    hand='Col';
    return;
end;
[Is, UpTo]=Color(card1,card2,card3,card7,card5);
if Is    
    hand='Col';
    return;
end;
[Is, UpTo]=Color(card1,card2,card6,card4,card5);
if Is    
    hand='Col';
    return;
end;
[Is, UpTo]=Color(card1,card2,card7,card4,card5);
if Is    
    hand='Col';
    return;
end;
[Is, UpTo]=Color(card1,card6,card3,card4,card5);
if Is    
    hand='Col';
    return;
end;
[Is, UpTo]=Color(card1,card7,card3,card4,card5);
if Is    
    hand='Col';
    return;
end;
[Is, UpTo]=Color(card6,card2,card3,card4,card5);
if Is    
    hand='Col';
    return;
end;
[Is, UpTo]=Color(card7,card2,card3,card4,card5);
if Is    
    hand='Col';
    return;
end;

% % % Escalera % % %

[Is, UpTo]=Escalera(card1,card2,card3,card4,card5);
if Is    
    hand='Escl';
    return;
end;
[Is, UpTo]=Escalera(card1,card2,card3,card4,card6);
if Is    
    hand='Escl';
    return;
end;
[Is, UpTo]=Escalera(card1,card2,card3,card4,card7);
if Is    
    hand='Escl';
    return;
end;
[Is, UpTo]=Escalera(card1,card2,card3,card6,card5);
if Is    
    hand='Escl';
    return;
end;
[Is, UpTo]=Escalera(card1,card2,card3,card7,card5);
if Is    
    hand='Escl';
    return;
end;
[Is, UpTo]=Escalera(card1,card2,card6,card4,card5);
if Is    
    hand='Escl';
    return;
end;
[Is, UpTo]=Escalera(card1,card2,card7,card4,card5);
if Is    
    hand='Escl';
    return;
end;
[Is, UpTo]=Escalera(card1,card6,card3,card4,card5);
if Is    
    hand='Escl';
    return;
end;
[Is, UpTo]=Escalera(card1,card7,card3,card4,card5);
if Is    
    hand='Escl';
    return;
end;
[Is, UpTo]=Escalera(card6,card2,card3,card4,card5);
if Is    
    hand='Escl';
    return;
end;
[Is, UpTo]=Escalera(card7,card2,card3,card4,card5);
if Is    
    hand='Escl';
    return;
end;

% % % Trio % % %
[Is, UpTo]=Trio(card1,card2,card3,card4,card5);
if Is    
    hand='3ok';
    return;
end;
[Is, UpTo]=Trio(card1,card2,card3,card4,card6);
if Is    
    hand='3ok';
    return;
end;
[Is, UpTo]=Trio(card1,card2,card3,card4,card7);
if Is    
    hand='3ok';
    return;
end;
[Is, UpTo]=Trio(card1,card2,card3,card6,card5);
if Is    
    hand='3ok';
    return;
end;
[Is, UpTo]=Trio(card1,card2,card3,card7,card5);
if Is    
    hand='3ok';
    return;
end;
[Is, UpTo]=Trio(card1,card2,card6,card4,card5);
if Is    
    hand='3ok';
    return;
end;
[Is, UpTo]=Trio(card1,card2,card7,card4,card5);
if Is    
    hand='3ok';
    return;
end;

[Is, UpTo]=Trio(card1,card6,card3,card4,card5);
if Is    
    hand='3ok';
    return;
end;

[Is, UpTo]=Trio(card1,card7,card3,card4,card5);
if Is    
    hand='3ok';
    return;
end;

[Is, UpTo]=Trio(card6,card2,card3,card4,card5);
if Is    
    hand='3ok';
    return;
end;
[Is, UpTo]=Trio(card7,card2,card3,card4,card5);
if Is    
    hand='3ok';
    return;
end;

% % % Par % % %

[Is, UpTo]=Par(card1,card2,card3,card4,card5);
if Is    
    hand='Par';
    return;
end;
[Is, UpTo]=Par(card1,card2,card3,card4,card6);
if Is    
    hand='Par';
    return;
end;
[Is, UpTo]=Par(card1,card2,card3,card4,card7);
if Is    
    hand='Par';
    return;
end;
[Is, UpTo]=Par(card1,card2,card3,card6,card5);
if Is    
    hand='Par';
    return;
end;
[Is, UpTo]=Par(card1,card2,card3,card7,card5);
if Is    
    hand='Par';
    return;
end;
[Is, UpTo]=Par(card1,card2,card6,card4,card5);
if Is    
    hand='Par';
    return;
end;
[Is, UpTo]=Par(card1,card2,card7,card4,card5);
if Is    
    hand='Par';
    return;
end;

[Is, UpTo]=Par(card1,card6,card3,card4,card5);
if Is    
    hand='Par';
    return;
end;

[Is, UpTo]=Par(card1,card7,card3,card4,card5);
if Is    
    hand='Par';
    return;
end;

[Is, UpTo]=Par(card6,card2,card3,card4,card5);
if Is    
    hand='Par';
    return;
end;
[Is, UpTo]=Par(card7,card2,card3,card4,card5);
if Is    
    hand='Par';
    return;
end;


% % % Nada % % %
 hand='null'; 
 UpTo=max([card1.pos,card2.pos,card3.pos,card4.pos,card5.pos,card6.pos,card7.pos]);
end
