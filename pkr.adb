-----------------------------
--  Poker Library
--  Body File
--  -- Julio A. Toboso Garcia
-----------------------------


with Ada.Numerics.Discrete_Random;

package body PKR is

function Random_Color return Color_tp is
        package Rand_Color is new Ada.Numerics.Discrete_Random (Color_tp);
        Gen: Rand_Color.Generator;
begin --Random_Color
    Rand_Color.Reset(Gen);
    return Rand_Color.Random(Gen);
end Random_Color;

function Random_Value return Value_tp is
        package Rand_Valaue is new Ada.Numerics.Discrete_Random(Value_tp);
        Gen: Rand_Valaue.Generator;
begin -- Random_Value
    Rand_Valaue.Reset(Gen);
    return Rand_Valaue.Random(Gen);
end Random_Value;

function New_Card return Card_tp is
    Card: Card_tp;
begin -- Saca_Carta
    Card.Color:=Random_Color;
    Card.Value:=Random_Value;
    return Card;
end New_Card;


function New_Card (
      Value: Value_Type;
      color: color_type) return Card_t is
      Card: Card_t;
    begin
      Card.value := Value;
      Card.color := color;
      return Card;
    end New_Card;






procedure Sacar_Carta(Card: in out Card_tp) is
begin -- Sacar_Carta
    Card:=New_Card;
end Sacar_Carta;

function Sacar_Carta return Card_tp is
begin -- Sacar_Carta
    return New_Card;
end Sacar_Carta;

function Valor_N(N: Positive) return Value_tp is
   subtype N_tp is Positive range 1..Color_sz;
   N_v: N_tp;
begin --Valor_N
   case N is
      when 1..Color_sz => N_v:=N;
      when (Color_sz+1)..(Color_sz*2) => N_v:=N-Color_sz;
      when (Color_sz*2+1)..(Color_sz*3) => N_v:=N-(Color_sz*2);
      when (Color_sz*3+1)..(Color_sz*4) => N_v:=N-(Color_sz*3);
      when others => N_v:=1;
   end case;
   case N_v is
    when 1 => return As;
    when 2 => return Dos;
    when 3 => return Tres;
    when 4 => return Cuatro;
    when 5 => return Cinco;
    when 6 => return Seis;
    when 7 => return Siete;
    when 8 => return Ocho;
    when 9 => return Nueve;
    when 10 => return Diez;
    when 11 => return J;
    when 12 => return Q;
    when Color_sz => return K;
   end case;
end Valor_N;

function Color_N ( N: Positive) return Color_tp is
   subtype N_tp is Positive range 1..Deck_Sz;
   N_v: N_tp:=N;
begin -- Color_N
   case N_v is
      when 1..Color_sz => return Picas;
      when (Color_sz+1)..(Color_sz*2) => return Treboles;
      when (Color_sz*2+1)..(Color_sz*3)=> return Diamantes;
      when (Color_sz*3+1)..Deck_Sz => return Corazones;
   end case;
end Color_N;

function Sacar_Carta (N: Positive) return Card_tp is
   subtype N_tp is Positive range 1..Deck_Sz;
   N_v: N_tp:=N;
   Card: Card_tp;
begin -- Sacar_Carta
   Card.Value:=Valor_N(N_v);
   Card.Color:=Color_N(N_v);
   return Card;
end Sacar_Carta;

function Card_Image ( Card: Card_tp) return String is
begin -- Card_Image
   return (PKR.Value_tp'Image(Card.Value) & " " & PKR.Color_tp'Image(Card.Color) & " ");
end Card_Image;

function  Color_Base_N ( Color: Color_tp)
         return Natural is
begin -- Color_Base_N
   case Color is
      when Picas => return 0;
      when Treboles => return Color_sz;
      when Diamantes => return Color_sz*2;
      when Corazones => return Color_sz*3;
      when others => return 0;
   end case;
end Color_Base_N;

procedure Print_Baraja is
   Card:Card_tp;
begin -- Print_Baraja
   for index in Card_N_tp loop
      Card:=Sacar_Carta(index);
      Put_Line(Card_Image(Card));
      Put_Line(Card_N_tp'Image(Position(Card)));
   end loop;
end Print_Baraja;

function Position (
         Card: in Card_tp
   ) return Card_N_tp is

begin -- Position
   return Color_Base_N(Card.Color)+Value_tp'Pos(Card.Value)+1;
end Position;

procedure Sort_By_Position (
          Card1: in out Card_tp;
          Card2: in out Card_tp) is
   Aux_Card: Card_tp:= Card1;
begin -- Sort_By_Position
   if Position(Card1)>Position(Card2) then
      Card1:=Card2;
      Card2:=Aux_Card;
   end if;
end Sort_By_Position;


 procedure Sort_Value (Card1: in out Card_tp; Card2: in out Card_tp) is
    Aux_Card: Card_tp;
 begin
    if Card1.value>Card2.value then
      Aux_Card:=Card1;
      Card1:=Card2;
      Card2:=Aux_Card;
    end if;
end Sort_Value;


procedure Ordenar5 (Card1: in out Card_tp; Card2: in out Card_tp; Card3: in out Card_tp; Card4: in out Card_tp; Card5: in out Card_tp) is
begin
   <<Order_here>>
   if Card1.value>Card2.value then
      Sort_Value(Card1,Card2);
      goto Order_here;
   end if;
   if Card2.value>Card3.value then
      Sort_Value(Card2,Card3);
      goto Order_here;
   end if;
   if Card3.value>Card4.value then
      Sort_Value(Card3,Card4);
      goto Order_here;
   end if;
   if Card4.value>Card5.value then
      Sort_Value(Card4,Card5);
      goto Order_here;
   end if;

end Ordenar5;

procedure Ordenar7 (Card1: in out Card_tp; Card2: in out Card_tp; Card3: in out Card_tp; Card4: in out Card_tp; Card5: in out Card_tp; Card6: in out Card_tp; Card7: in out Card_tp) is
begin
   <<Order_here>>
   if Card1.value>Card2.value then
      Sort_Value(Card1,Card2);
      goto Order_here;
   end if;
   if Card2.value>Card3.value then
      Sort_Value(Card2,Card3);
      goto Order_here;
   end if;
   if Card3.value>Card4.value then
      Sort_Value(Card3,Card4);
      goto Order_here;
   end if;
   if Card4.value>Card5.value then
      Sort_Value(Card4,Card5);
      goto Order_here;
   end if;
   if Card5.value>Card6.value then
      Sort_Value(Card5,Card6);
      goto Order_here;
   end if;
   if Card6.value>Card7.value then
      Sort_Value(Card6,Card7);
      goto Order_here;
   end if;

end Ordenar7;

procedure Print_Card (Card: in Card_tp) is
begin -- Print_Baraja
   Put_Line(Card_Image(Card));
end Print_Card;


procedure Set_Token(Token: in out Token_tp) is
begin
   Token(1):=Value_tp'First;
   Token(2):=Value_tp'First;
   Token(3):=Value_tp'First;
   Token(4):=Value_tp'First;
   Token(5):=Value_tp'First;

end;

function Set_Token return Token_tp is
   Token : Token_tp;
begin
   Token(1):=Value_tp'First;
   Token(2):=Value_tp'First;
   Token(3):=Value_tp'First;
   Token(4):=Value_tp'First;
   Token(5):=Value_tp'First;
   Return Token;
end;







--Asume Ordered Cards.

function Is_Alta (Token: in out Token_tp; Card1: in Card_tp; Card2: in Card_tp; Card3: in Card_tp; Card4: in Card_tp; Card5: in Card_tp) return Boolean is
begin
   Token(1):=card5.value;
   Token(2):=card4.value;
   Token(3):=card3.value;
   Token(4):=card2.value;
   Token(5):=card1.value;
   return true;
end Is_Alta;

function Is_Par (Token: in out Token_tp; Card1: in Card_tp; Card2: in Card_tp; Card3: in Card_tp; Card4: in Card_tp; Card5: in Card_tp) return Boolean is
   Found: Boolean:=False;
begin
   --|x|x|0|0|0|
   if card1.value=card2.value then
         Token(1):=card1.value;
         Token(2):=card5.value;
         Token(3):=card4.value;
         Token(4):=card3.value;
         Token(5):=Dos;
      Found:=True;
   end if;
   --|0|x|x|0|0|
   if card2.value=card3.value  then
         Token(1):=card2.value;
         Token(2):=card5.value;
         Token(3):=card4.value;
         Token(4):=card1.value;
         Token(5):=Dos;
      Found:=True;
   end if;
   --|0|0|x|x|0|
   if card3.value=card4.value then
         Token(1):=card3.value;
         Token(2):=card5.value;
         Token(3):=card2.value;
         Token(4):=card1.value;
         Token(5):=Dos;
      Found:=True;
   end if;
   --|0|0|0|x|x|
   if card4.value=card5.value then
         Token(1):=card4.value;
         Token(2):=card3.value;
         Token(3):=card2.value;
         Token(4):=card1.value;
         Token(5):=Dos;

      Found:=True;
   end if;
   return Found;
end Is_Par;

function Is_2Par (Token: in out Token_tp; Card1: in Card_tp; Card2: in Card_tp; Card3: in Card_tp; Card4: in Card_tp; Card5: in Card_tp) return Boolean is
   Found: Boolean:=False;
begin
   Set_Token(Token);
-- Cases
  --|1|2|3|4|5|
  --|x|x|z|z|0|
   if card1.value=card2.value and card3.value=card4.value then
      if Value_tp'Pos(card1.value)>Value_tp'Pos(card3.value) then
         Token(1):=card1.value;
         Token(2):=card3.value;
         Token(3):=card5.value;

      else
         Token(1):=card3.value;
         Token(2):=card1.value;
         Token(3):=card5.value;
      end if;
      Return True;
   end if;

   --|x|x|0|z|z|
   if card1.value=card2.value and card4.value=card5.value then
      if Value_tp'Pos(card1.value)>Value_tp'Pos(card4.value) then
         Token(1):=card1.value;
         token(2):=card4.value;
      else
         Token(1):=card4.value;
         token(2):=card1.value;
      end if;
      token(3):=card3.value;
      Return True;
   end if;

   --|0|x|x|z|z|
   if card2.value=card3.value and card4.value=card5.value then
      if Value_tp'Pos(card3.value)>Value_tp'Pos(card4.value) then
         Token(1):=card3.value;
         token(2):=card4.value;
      else
         Token(1):=card4.value;
         token(2):=card3.value;
      end if;
      token(3):=card1.value;

      Return True;
   end if;
   Return False;
end Is_2Par;

function Is_Trio (Token: in out Token_tp; Card1: in Card_tp; Card2: in Card_tp; Card3: in Card_tp; Card4: in Card_tp; Card5: in Card_tp) return Boolean is
   Found: Boolean:=False;
begin
   Set_Token(Token);

   --|1|2|3|4|5|

   --|x|x|x|0|0|.

   if (card1.value=card2.value and card2.value=card3.value) then
         Token(1):=card1.value;
         Token(2):=card5.value;
         Token(3):=card4.value;
      Return True;
   end if;
   --|0|x|x|x|0|
   if (card2.value=card3.value and card3.value=card4.value) then
         Token(1):=card2.value;
         Token(2):=card5.value;
         Token(3):=card1.value;
      Return True;
   end if;

   --|0|0|x|x|x|
   if (card5.value=card3.value and card3.value=card4.value) then
         Token(1):=card4.value;
         Token(2):=card2.value;
         Token(3):=card1.value;
      Return True;
   end if;
   return Found;
end Is_Trio;


function Is_Escalera ( Token: in out Token_tp; Card1: in Card_tp; Card2: in Card_tp; Card3: in Card_tp; Card4: in Card_tp; Card5: in Card_tp) return Boolean is
   Found: Boolean:=False;
begin -- Is_Escalera
   Set_Token(Token);

   --|1|2|3|4|5|

   if (card1.value=Dos AND card2.value=Tres AND card3.value=Cuatro AND card4.value=Cinco AND card5.value=As) then
      Found:=True;
      Token(1):=Cinco;
   elsif (card1.value=Dos AND card2.value=Tres AND card3.value=Cuatro AND card4.value=Cinco AND card5.value=Seis) then
      Found:=True;
      Token(1):=Seis;
   elsif (card1.value=Tres AND card2.value=Cuatro AND card3.value=Cinco AND card4.value=Seis AND card5.value=Siete) then
      Found:=True;
      Token(1):=Siete;
   elsif (card1.value=Cuatro AND card2.value=Cinco AND card3.value=Seis AND card4.value=Siete AND card5.value=Ocho) then
      Found:=True;
      Token(1):=Ocho;
   elsif (card1.value=Cinco AND card2.value=Seis AND card3.value=Siete AND card4.value=Ocho AND card5.value=Nueve) then
      Found:=True;
      Token(1):=Nueve;
   elsif (card1.value=Seis AND card2.value=Siete AND card3.value=Ocho AND card4.value=Nueve AND card5.value=Diez) then
      Found:=True;
      Token(1):=Diez;
   elsif (card1.value=Siete AND card2.value=Ocho AND card3.value=Nueve AND card4.value=Diez AND card5.value=J) then
      Found:=True;
      Token(1):=Siete;
   elsif (card1.value=Ocho AND card2.value=Nueve AND card3.value=Diez AND card4.value=J AND card5.value=Q) then
      Found:=True;
      Token(1):=Q;
   elsif (card1.value=Nueve AND card2.value=Diez AND card3.value=J AND card4.value=Q AND card5.value=K) then
      Found:=True;
      Token(1):=K;
   elsif (card1.value=Diez AND card2.value=J AND card3.value=Q AND card4.value=K AND card5.value=As) then
      Found:=True;
      Token(1):=As;
   end if;
   Return Found;
end Is_Escalera;

function Is_Full (Token: in out Token_tp; Card1: in Card_tp; Card2: in Card_tp; Card3: in Card_tp; Card4: in Card_tp; Card5: in Card_tp) return Boolean is
   Found: Boolean:=False;
begin
   Set_Token(Token);

   --|z|z|z|x|x|
   if card1.value=card2.value and card2.value=card3.value and card4.value=card5.value then
      Found:=True;
      Token(1):=card1.value;
      token(2):=card5.value;

      --|z|z|x|x|x|
   elsif card1.value=card2.value and card4.value=card3.value and card4.value=card5.value then
      Found:=True;
      Token(1):=card5.value;
      token(2):=card1.value;
   end if;
   return Found;
end Is_Full;

function Is_Color( Token: in out Token_tp; Card1: in Card_tp; Card2: in Card_tp; Card3: in Card_tp; Card4: in Card_tp; Card5: in Card_tp) return Boolean is
   Found: Boolean:=False;
begin
   Set_Token(Token);
      if card1.Color=card2.Color and then card1.Color=card3.Color and then card1.Color=card4.Color and then card1.Color=card5.Color then
         Found:=True;
         Token(1):=card5.value;
         Token(2):=card4.value;
         Token(3):=card3.value;
         Token(4):=card2.value;
         Token(5):=card1.value;
      end if;
      return Found;
end Is_Color;

function Is_EscaleraColor( Token: in out Token_tp; Card1: in Card_tp; Card2: in Card_tp; Card3: in Card_tp; Card4: in Card_tp; Card5: in Card_tp) return Boolean is
   Found: Boolean:=False;
begin
   if Is_Color( Token, card1, card2, card3, card4, card5) then
   if Is_Escalera( Token, card1, card2, card3, card4, card5) then
      Found:=True;
   end if;
   end if;
   return Found;
end Is_EscaleraColor;


function Is_Poker (Token: in out Token_tp; Card1: in Card_tp; Card2: in Card_tp; Card3: in Card_tp; Card4: in Card_tp; Card5: in Card_tp) return Boolean is
   Found: Boolean:=False;
begin
   Set_Token(Token);
   --|z|z|z|z|x|
   if card1.value=card2.value and card2.value=card3.value and card3.value=card4.value then
      Found:=True;
      Token(1):=card1.value;
      Token(2):=card5.value;


      --|z|x|x|x|x|
   elsif card2.value=card3.value and card3.value=card4.value and card4.value=card5.value then
      Found:=True;
      Token(1):=card5.value;
      Token(2):=card1.value;

   end if;
   return Found;
end Is_Poker;

function what_hand(Token: in out Token_tp; Card1: in Card_tp; Card2: in Card_tp; Card3: in Card_tp; Card4: in Card_tp; Card5: in Card_tp) return H_tp is
begin

   if Is_EscaleraColor( Token, card1, card2, card3, card4, card5) then
      return Escalera_Color;
   elsif Is_Poker( Token, card1, card2, card3, card4, card5) then
      return Poker;
   elsif Is_Full( Token, card1, card2, card3, card4, card5) then
      return Full;
   elsif Is_Color( Token, card1, card2, card3, card4, card5) then
      return ColorFlush;
   elsif Is_Escalera( Token, card1, card2, card3, card4, card5) then
      return Escalera;
   elsif Is_Trio(Token, card1, card2, card3, card4, card5) then
      return Trio;
   elsif Is_2Par(Token, card1, card2, card3, card4, card5) then
      return Doble_Par;
   elsif Is_Par(Token, card1, card2, card3, card4, card5) then
      return Par;
   elsif Is_Alta(Token, card1, card2, card3, card4, card5) then
      return Alta;
   end if;
   return Alta;
end what_hand;

function what_hand(Token: in out Token_tp; Card: in Five_Cards_tp) return H_tp is
begin
   if Is_EscaleraColor( Token, card(1), card(2), card(3), card(4), card(5)) then
      return Escalera_Color;
   elsif Is_Poker( Token, card(1), card(2), card(3), card(4), card(5)) then
      return Poker;
   elsif Is_Full( Token, card(1), card(2), card(3), card(4), card(5)) then
      return Full;
   elsif Is_Color( Token, card(1), card(2), card(3), card(4), card(5)) then
      return ColorFlush;
   elsif Is_Escalera( Token, card(1), card(2), card(3), card(4), card(5)) then
      return Escalera;
   elsif Is_Trio(Token, card(1), card(2), card(3), card(4), card(5)) then
      return Trio;
   elsif Is_2Par(Token, card(1), card(2), card(3), card(4), card(5)) then
      return Doble_Par;
   elsif Is_Par(Token, card(1), card(2), card(3), card(4), card(5)) then
      return Par;
   elsif Is_Alta(Token, card(1), card(2), card(3), card(4), card(5)) then
      return Alta;
   end if;
   return Alta;
end what_hand;


function Default_Hand return Hand_tp is
begin
   return (Alta, (Dos,Dos,Dos,Dos,Dos));
end Default_Hand;

procedure tell_what_hand(Token: in out Token_tp; Card1: in Card_tp; Card2: in Card_tp; Card3: in Card_tp; Card4: in Card_tp; Card5: in Card_tp) is
begin
   if Is_EscaleraColor(Token, card1, card2, card3, card4, card5) then
     Put_Line(" ") ;
      Put_Line("EscaleraColor") ;
      Put_Line(Value_tp'Image(Token(1)));
      Put_Line(" ") ;
   elsif Is_Poker(Token, card1, card2, card3, card4, card5) then
        Put_Line(" ") ;
        Put_Line("Poker") ;
        Put_Line(Value_tp'Image(Token(1)));
        Put_Line(" ") ;

   elsif Is_Full(Token, card1, card2, card3, card4, card5) then
     Put_Line(" ") ;
      Put_Line("Full") ;
      Put_Line(Value_tp'Image(Token(1)));
      Put_Line(Value_tp'Image(Token(2)));

      Put_Line(" ") ;
 elsif Is_Color(Token, card1, card2, card3, card4, card5) then
        Put_Line(" ") ;
        Put_Line("Color") ;
        Put_Line(Value_tp'Image(Token(1)));
        Put_Line(" ") ;
   elsif Is_Escalera(Token, card1, card2, card3, card4, card5) then
     Put_Line(" ") ;
      Put_Line("Escalera") ;
      Put_Line(Value_tp'Image(Token(1)));
      Put_Line(" ") ;
   elsif Is_Trio(Token, card1, card2, card3, card4, card5) then
     Put_Line(" ") ;
      Put_Line("Trio") ;
      Put_Line(Value_tp'Image(Token(1)));
      Put_Line(" ") ;
 elsif Is_2Par(Token, card1, card2, card3, card4, card5) then
     Put_Line(" ") ;
      Put_Line("2Par") ;
      Put_Line(Value_tp'Image(Token(1)));
      Put_Line(Value_tp'Image(Token(2)));
      Put_Line(" ") ;
 elsif Is_Par(Token, card1, card2, card3, card4, card5) then
     Put_Line(" ") ;
      Put_Line("Par") ;
      Put_Line(Value_tp'Image(Token(1)));
      Put_Line(" ") ;

   elsif Is_Alta(Token, card1, card2, card3, card4, card5) then
     Put_Line(" ") ;
      Put_Line("Alta") ;
      Put_Line(Value_tp'Image(Token(1)));
      Put_Line(" ") ;

 end if;
end;

procedure Sacar_5Cartas(Card: in out Five_Cards_tp) is --Gives Random
begin --Sacar_5Cartas
   Card:= (others => Sacar_Carta);
end Sacar_5Cartas;

function Sacar_5Cartas return Five_Cards_tp is --Return Random Cards
   card: Five_Cards_tp;
begin --Sacar_5Cartas
   Card:= (others => Sacar_Carta);
   return card;
end Sacar_5Cartas;
function Sacar_5Cartas(N1: in Positive; N2: in Positive; N3: in Positive; N4: in Positive; N5: in Positive) return Five_Cards_tp is --Return ordered
   card: Five_Cards_tp;
begin --Sacar_5Cartas
   Card:= (1 => Sacar_Carta(N1),2 => Sacar_Carta(N2),3 => Sacar_Carta(N3), 4 => Sacar_Carta(N4), 5 => Sacar_Carta(N5));
   return card;
end Sacar_5Cartas;

procedure Print_5Cards (card: in Five_Cards_tp) is
   begin
      Print_Card(card(1));
      Print_Card(card(2));
      Print_Card(card(3));
      Print_Card(card(4));
      Print_Card(card(5));
      New_Line;
   end Print_5Cards;


   procedure Ordenar5 (card: in out Five_Cards_tp) is
   begin
      <<Order_here>>
      if Card(1).value>Card(2).value then
         Sort_Value(Card(1),Card(2));
         goto Order_here;
      end if;
      if Card(2).value>Card(3).value then
         Sort_Value(Card(2),Card(3));
         goto Order_here;
      end if;
      if Card(3).value>Card(4).value then
         Sort_Value(Card(3),Card(4));
         goto Order_here;
      end if;
      if Card(4).value>Card(5).value then
         Sort_Value(Card(4),Card(5));
         goto Order_here;
      end if;

   end Ordenar5;

   procedure tell_what_hand(Token: in out Token_tp; card: in Five_Cards_tp) is
   begin
      if Is_EscaleraColor(Token, card(1), card(2), card(3), card(4), card(5)) then
        Put_Line(" ") ;
         Put_Line("EscaleraColor") ;
         Put_Line(Value_tp'Image(Token(1)));
         Put_Line(" ") ;
      elsif Is_Poker(Token, card(1), card(2), card(3), card(4), card(5)) then
           Put_Line(" ") ;
           Put_Line("Poker") ;
           Put_Line(Value_tp'Image(Token(1)));
           Put_Line(" ") ;

      elsif Is_Full(Token, card(1), card(2), card(3), card(4), card(5)) then
        Put_Line(" ") ;
         Put_Line("Full") ;
         Put_Line(Value_tp'Image(Token(1)));
         Put_Line(Value_tp'Image(Token(2)));

         Put_Line(" ") ;
    elsif Is_Color(Token, card(1), card(2), card(3), card(4), card(5)) then
           Put_Line(" ") ;
           Put_Line("Color") ;
           Put_Line(Value_tp'Image(Token(1)));
           Put_Line(" ") ;
      elsif Is_Escalera(Token, card(1), card(2), card(3), card(4), card(5)) then
        Put_Line(" ") ;
         Put_Line("Escalera") ;
         Put_Line(Value_tp'Image(Token(1)));
         Put_Line(" ") ;
      elsif Is_Trio(Token, card(1), card(2), card(3), card(4), card(5)) then
        Put_Line(" ") ;
         Put_Line("Trio") ;
         Put_Line(Value_tp'Image(Token(1)));
         Put_Line(" ") ;
    elsif Is_2Par(Token, card(1), card(2), card(3), card(4), card(5)) then
        Put_Line(" ") ;
         Put_Line("2Par") ;
         Put_Line(Value_tp'Image(Token(1)));
         Put_Line(Value_tp'Image(Token(2)));
         Put_Line(" ") ;
    elsif Is_Par(Token, card(1), card(2), card(3), card(4), card(5)) then
        Put_Line(" ") ;
         Put_Line("Par") ;
         Put_Line(Value_tp'Image(Token(1)));
         Put_Line(" ") ;

      elsif Is_Alta(Token, card(1), card(2), card(3), card(4), card(5)) then
        Put_Line(" ") ;
         Put_Line("Alta") ;
         Put_Line(Value_tp'Image(Token(1)));
         Put_Line(" ") ;

    end if;
   end;

function Mejor_mano (mano1: in Five_Cards_tp; mano2: in Five_Cards_tp) return Five_Cards_tp is
      hand1: Hand_tp;
      hand2: Hand_tp;
   begin
      hand1.H:=what_hand(hand1.Token, mano1);
      hand2.H:=what_hand(hand2.Token, mano2);
      if hand1.H>hand2.H then
         return mano1;
      elsif hand1.H<hand2.H then
         return mano2;
      else
         if hand1.token(1)>hand2.token(1) then
            return mano1;
         elsif hand1.token(1)<hand2.token(1) then
            return mano2;
         else
            if hand1.token(2)>hand2.token(2) then
               return mano1;
            elsif hand1.token(2)<hand2.token(2) then
               return mano2;
            else
               if hand1.token(3)>hand2.token(3) then
                  return mano1;
               elsif hand1.token(3)<hand2.token(3) then
                  return mano2;
               else
                  if hand1.token(4)>hand2.token(4) then
                     return mano1;
                  elsif hand1.token(4)<hand2.token(4) then
                     return mano2;
                  else
                     if hand1.token(5)>hand2.token(5) then
                        return mano1;
                     elsif hand1.token(5)<hand2.token(5) then
                        return mano2;
                     else
                        return mano1;
                     end if;
                  end if;
               end if;
            end if;
         end if;
      end if;
   --   return mano1;
   end Mejor_mano;


   procedure Sacar_7Cartas(Card: in out Seven_Cards_tp) is --Gives Random
   begin --Sacar_7Cartas
      Card:= (others => Sacar_Carta);
   end Sacar_7Cartas;

   function Sacar_7Cartas return Seven_Cards_tp is --Return Random Cards
      card: Seven_Cards_tp;
   begin --Sacar_5Cartas
      Card:= (others => Sacar_Carta);
      return card;
   end Sacar_7Cartas;
   function Sacar_7Cartas(N1: in Positive; N2: in Positive; N3: in Positive; N4: in Positive; N5: in Positive; N6: in Positive; N7: in Positive) return Seven_Cards_tp is --Return ordered
      card: Seven_Cards_tp;
   begin --Sacar_5Cartas
      Card:= (1 => Sacar_Carta(N1),2 => Sacar_Carta(N2),3 => Sacar_Carta(N3), 4 => Sacar_Carta(N4), 5 => Sacar_Carta(N5), 6 => Sacar_Carta(N6), 7 => Sacar_Carta(N7));
      return card;
   end Sacar_7Cartas;

   procedure Print_7Cards (card: in Seven_Cards_tp) is
   begin --Print_7Cards
      Print_Card(card(1));
      Print_Card(card(2));
      Print_Card(card(3));
      Print_Card(card(4));
      Print_Card(card(5));
      Print_Card(card(6));
      Print_Card(card(7));
      New_Line;
   end Print_7Cards;

   procedure Ordenar7 (card: in out Seven_Cards_tp) is
   begin
      <<Order_here>>
      if Card(1).value>Card(2).value then
         Sort_Value(Card(1),Card(2));
         goto Order_here;
      end if;
      if Card(2).value>Card(3).value then
         Sort_Value(Card(2),Card(3));
         goto Order_here;
      end if;
      if Card(3).value>Card(4).value then
         Sort_Value(Card(3),Card(4));
         goto Order_here;
      end if;
      if Card(4).value>Card(5).value then
         Sort_Value(Card(4),Card(5));
         goto Order_here;
      end if;
      if Card(5).value>Card(6).value then
         Sort_Value(Card(5),Card(6));
         goto Order_here;
      end if;
      if Card(6).value>Card(7).value then
         Sort_Value(Card(6),Card(7));
         goto Order_here;
      end if;

   end Ordenar7;


function Mejor5de7 (posibles: in Seven_Cards_tp) return Five_Cards_tp is
   best_card: Five_Cards_tp;
   Candidate: Five_Cards_tp;
begin --Mejor5de7
   --|x|x|x|x|x|0|0|
<script src="https://gist.github.com/JulTob/cdbf8e9e11264f1b139f2cd52a8d03c3.js"></script>
   best_card(1):= posibles(1);
   best_card(2):= posibles(2);
   best_card(3):= posibles(3);
   best_card(4):= posibles(4);
   best_card(5):= posibles(5);

   --|x|x|x|x|0|x|0|
   Candidate(1):= posibles(1);
   Candidate(2):= posibles(2);
   Candidate(3):= posibles(3);
   Candidate(4):= posibles(4);
   Candidate(5):= posibles(6);

   best_card:= Mejor_mano(best_card,candidate);

   --|x|x|x|0|x|x|0|
   Candidate(1):= posibles(1);
   Candidate(2):= posibles(2);
   Candidate(3):= posibles(3);
   Candidate(4):= posibles(5);
   Candidate(5):= posibles(6);

   best_card:= Mejor_mano(best_card,candidate);

   --|x|x|0|x|x|x|0|
   Candidate(1):= posibles(1);
   Candidate(2):= posibles(2);
   Candidate(3):= posibles(4);
   Candidate(4):= posibles(5);
   Candidate(5):= posibles(6);

   best_card:= Mejor_mano(best_card,candidate);

   --|x|0|x|x|x|x|0|
   Candidate(1):= posibles(1);
   Candidate(2):= posibles(3);
   Candidate(3):= posibles(4);
   Candidate(4):= posibles(5);
   Candidate(5):= posibles(6);

   best_card:= Mejor_mano(best_card,candidate);

   --|0|x|x|x|x|x|0|
   Candidate(1):= posibles(2);
   Candidate(2):= posibles(3);
   Candidate(3):= posibles(4);
   Candidate(4):= posibles(5);
   Candidate(5):= posibles(6);

   best_card:= Mejor_mano(best_card,candidate);

   --|x|x|x|x|0|0|x|
   Candidate(1):= posibles(1);
   Candidate(2):= posibles(2);
   Candidate(3):= posibles(3);
   Candidate(4):= posibles(4);
   Candidate(5):= posibles(7);

   best_card:= Mejor_mano(best_card,candidate);

   --|x|x|x|0|x|0|x|
   Candidate(1):= posibles(1);
   Candidate(2):= posibles(2);
   Candidate(3):= posibles(3);
   Candidate(4):= posibles(5);
   Candidate(5):= posibles(7);

   best_card:= Mejor_mano(best_card,candidate);

   --|x|x|0|x|x|0|x|
   Candidate(1):= posibles(1);
   Candidate(2):= posibles(2);
   Candidate(3):= posibles(4);
   Candidate(4):= posibles(5);
   Candidate(5):= posibles(7);

   best_card:= Mejor_mano(best_card,candidate);

   --|x|0|x|x|x|0|x|
   Candidate(1):= posibles(1);
   Candidate(2):= posibles(3);
   Candidate(3):= posibles(4);
   Candidate(4):= posibles(5);
   Candidate(5):= posibles(7);

   best_card:= Mejor_mano(best_card,candidate);

   --|0|x|x|x|x|0|x|
   Candidate(1):= posibles(2);
   Candidate(2):= posibles(3);
   Candidate(3):= posibles(4);
   Candidate(4):= posibles(5);
   Candidate(5):= posibles(7);

   best_card:= Mejor_mano(best_card,candidate);

   --|x|x|x|0|0|x|x|
   Candidate(1):= posibles(1);
   Candidate(2):= posibles(2);
   Candidate(3):= posibles(3);
   Candidate(4):= posibles(6);
   Candidate(5):= posibles(7);

   best_card:= Mejor_mano(best_card,candidate);

   --|x|x|0|x|0|x|x|
   Candidate(1):= posibles(1);
   Candidate(2):= posibles(2);
   Candidate(3):= posibles(4);
   Candidate(4):= posibles(6);
   Candidate(5):= posibles(7);
      best_card:= Mejor_mano(best_card,candidate);

   --|x|0|x|x|0|x|x|
   Candidate(1):= posibles(1);
   Candidate(2):= posibles(3);
   Candidate(3):= posibles(4);
   Candidate(4):= posibles(6);
   Candidate(5):= posibles(7);
      best_card:= Mejor_mano(best_card,candidate);

   --|0|x|x|x|0|x|x|
   Candidate(1):= posibles(2);
   Candidate(2):= posibles(3);
   Candidate(3):= posibles(4);
   Candidate(4):= posibles(6);
   Candidate(5):= posibles(7);
   best_card:= Mejor_mano(best_card,candidate);

   --|x|x|0|0|x|x|x|
   Candidate(1):= posibles(1);
   Candidate(2):= posibles(2);
   Candidate(3):= posibles(5);
   Candidate(4):= posibles(6);
   Candidate(5):= posibles(7);
   best_card:= Mejor_mano(best_card,candidate);

   --|x|0|x|0|x|x|x|
   Candidate(1):= posibles(1);
   Candidate(2):= posibles(3);
   Candidate(3):= posibles(5);
   Candidate(4):= posibles(6);
   Candidate(5):= posibles(7);
   best_card:= Mejor_mano(best_card,candidate);

   --|0|x|x|0|x|x|x|
   Candidate(1):= posibles(2);
   Candidate(2):= posibles(3);
   Candidate(3):= posibles(5);
   Candidate(4):= posibles(6);
   Candidate(5):= posibles(7);
   best_card:= Mejor_mano(best_card,candidate);
   --|x|0|0|x|x|x|x|
   Candidate(1):= posibles(1);
   Candidate(2):= posibles(4);
   Candidate(3):= posibles(5);
   Candidate(4):= posibles(6);
   Candidate(5):= posibles(7);
   best_card:= Mejor_mano(best_card,candidate);
   --|0|x|0|x|x|x|x|
   Candidate(1):= posibles(2);
   Candidate(2):= posibles(4);
   Candidate(3):= posibles(5);
   Candidate(4):= posibles(6);
   Candidate(5):= posibles(7);
   best_card:= Mejor_mano(best_card,candidate);

   --|0|0|x|x|x|x|x|
   Candidate(1):= posibles(3);
   Candidate(2):= posibles(4);
   Candidate(3):= posibles(5);
   Candidate(4):= posibles(6);
   Candidate(5):= posibles(7);
   best_card:= Mejor_mano(best_card,candidate);

   return best_card;
end Mejor5de7;

function Mejor5deManoYMesa (Mano: in Two_Cards_tp; Mesa: in Five_Cards_tp) return Five_Cards_tp is
   posibles: Seven_Cards_tp;
begin --Mejor5deManoYMesa
   posibles(1):=Mano(1);
   posibles(2):=Mano(2);
   posibles(3):=Mesa(1);
   posibles(4):=Mesa(2);
   posibles(5):=Mesa(3);
   posibles(6):=Mesa(4);
   posibles(7):=Mesa(5);

   Ordenar7 (posibles);

   return Mejor5de7(posibles);

end Mejor5deManoYMesa;

procedure Sacar_2Cartas(Card: in out Two_Cards_tp) is --Gives Random
begin --Sacar_2Cartas
   Card:= (others => Sacar_Carta);
end Sacar_2Cartas;

function Sacar_2Cartas return Two_Cards_tp is --Return Random Cards
   card: Two_Cards_tp;
begin --Sacar_5Cartas
   Card:= (others => Sacar_Carta);
   return card;
end Sacar_2Cartas;

procedure what_hand(Hand: in out Hand_tp; Card: in Five_Cards_tp) is
begin --what_hand
   Hand.h:=what_hand(Hand.Token, Card);
end what_hand;

procedure what_hand(player: in out Player_tp) is
begin --what_hand
   what_hand(player.hand,player.mira);
end what_hand;

procedure tell_what_hand (player: in out Player_tp) is
begin --tell_what_hand
   tell_what_hand(player.hand.Token, player.mira);
end tell_what_hand;
----------
--
-- function what_best_hand (Token: in out Token_tp; PCards: in out Possible_Cards_tp) return Hand_tp is
--    Candidate: Hand_tp:=Default_Hand;
--    Handed: Hand_tp:=Default_Hand;
--    Get_Cards: Five_Cards_tp;
--    Get_Count: Natural;
-- begin
--    for ii in 1..7 loop
--    for iii in 1..7 loop
--    if not(ii=iii) then
--       Get_Count:=1;
--       for iv in 1..7 loop
--          if not(iv=ii) and not(iv=iii) then
--             Get_Cards(Get_Count):=PCards(iv);
--             Get_Count:=Get_Count+1;
--          end if;
--       end loop;
--       Candidate.Cards:=Get_Cards;
--       Candidate.H:=what_hand(Candidate.Token,Candidate.Cards);
--       if Candidate.H>Handed.H then
--          Handed:=Candidate;
--       elsif Candidate.H=Handed.H AND Candidate.Token(1)>Handed.Token(1) then
--          Handed:=Candidate;
--       elsif Candidate.H=Handed.H AND Candidate.Token(1)=Handed.Token(1) AND Candidate.Token(2)>Handed.Token(2) then
--       Handed:=Candidate;
--       elsif Candidate.H=Handed.H AND Candidate.Token(1)=Handed.Token(1) AND Candidate.Token(2)=Handed.Token(2) AND Candidate.Token(3)>Handed.Token(3) then
--       Handed:=Candidate;
--       elsif Candidate.H=Handed.H AND Candidate.Token(1)=Handed.Token(1) AND Candidate.Token(2)=Handed.Token(2) AND Candidate.Token(3)=Handed.Token(3) AND Candidate.Token(4)>Handed.Token(4) then
--             Handed:=Candidate;
--       elsif Candidate.H=Handed.H AND Candidate.Token(1)=Handed.Token(1) AND Candidate.Token(2)=Handed.Token(2) AND Candidate.Token(3)=Handed.Token(3) AND Candidate.Token(4)=Handed.Token(4) AND Candidate.Token(5)>Handed.Token(5)then
--             Handed:=Candidate;
--       end if;
--    end if;
--    end loop;
--    end loop;
--
--    return Handed;
-- end what_best_hand;
--
--
-- procedure Tell_Me_What_Hand (
--           Hand: in Hand_tp) is
-- begin -- Tell_Me_What_Hand
--    case Hand.H is
--       when Escalera_Color =>
--          Put("Madafaka! escalera color!! al ");
--          Put_Line(PKR.Value_tp'Image(Hand.Token(1)));
--       when Poker =>
--          Put("Poker al ");
--          Put_Line(PKR.Value_tp'Image(Hand.Token(1)));
--       when Full =>
--          Put("Full a la ");
--          Put(PKR.Value_tp'Image(Hand.Token(1)));
--          Put(" con ");
--          Put_Line(PKR.Value_tp'Image(hand.token(2)));
--       when ColorFlush =>
--          Put("Color al ");
--          Put_Line(PKR.Value_tp'Image(hand.Token(1)));
--       when Escalera =>
--          Put("Escalera a la ");
--          Put_Line(PKR.Value_tp'Image(hand.Token(1)));
--       when Trio =>
--          Put("Trio a la ");
--          Put_Line(PKR.Value_tp'Image(hand.Token(1)));
--       when Doble_Par =>
--          Put("Doble par a la ");
--          Put(PKR.Value_tp'Image(hand.Token(1)));
--          Put(" con ");
--          Put_Line(PKR.Value_tp'Image(Hand.Token(2)));
--       when Par =>
--          Put("Par a la ");
--          Put_Line(PKR.Value_tp'Image(hand.Token(1)));
--       when Alta =>
--          Put("Alta a la ");
--          Put_Line(PKR.Value_tp'Image(hand.Token(1)));
--    end case;
--
--    Put_Line(" ");
--    Put(Card_Image(hand.cards(1)));
--    Put(", ");
--    Put(Card_Image(hand.cards(2)));
--    Put(", ");
--    Put(Card_Image(hand.cards(3)));
--    Put(", ");
--    Put(Card_Image(hand.cards(4)));
--    Put(", ");
--    Put(Card_Image(hand.cards(5)));
--    Put_Line(" ");
-- end Tell_Me_What_Hand;
--
--
--
-- procedure Save(
--           Card: in out Card_tp) is
-- begin -- Save_Input
--    Put_Line(Card_Image(Card));
-- end Save;
--
-- procedure Save(
--           Card1: in out Card_tp;
--           Card2: in out Card_tp) is
-- begin -- Save_Input
--    Sort_Value(Card1,Card2);
--    Put_Line( Card_Image(Card1) & " " & Card_Image(Card2));
-- end Save;
--

end PKR;
