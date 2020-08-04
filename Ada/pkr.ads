with Ada.Text_IO; use Ada.Text_IO;

package PKR is
Deck_Sz: Constant Positive:= 52;
Color_sz: Constant Positive:= 13;
subtype Card_N_tp is Positive range 1..Deck_Sz;
subtype Card_P_tp is Positive range 1..Color_sz;
type H_tp is ( Alta, Par, Doble_Par, Trio, Escalera, ColorFlush, Full, Poker, Escalera_Color);

type Value_tp is ( Dos, Tres, Cuatro, Cinco, Seis, Siete, Ocho, Nueve, Diez, J, Q, K, As );
type Color_tp is ( Picas, Treboles, Diamantes, Corazones);
type Card_tp is record
    Color: Color_tp;
    Value : Value_tp;
end record;

type Five_Cards_tp is array(1..5) of Card_tp;

type Two_Cards_tp is array(1..2) of Card_tp;

type Seven_Cards_tp is array(1..7) of Card_tp;

type Token_tp is array (1..5) of Value_tp;

type Possible_Cards_tp is array(1..7) of Card_tp;

type Hand_tp is record
   H: H_Tp;
   Token: Token_tp;
end record;

type Player_tp is record
   Mano: Two_Cards_tp;
   Mira: Five_Cards_tp;
   Hand: Hand_tp;
--   Money: Natural:= 100;
--   Alive: Boolean:= True;
end record;



N_Players: Constant Positive := 5;
type Players_tp is array (1..N_Players) of Player_tp;



procedure Sacar_Carta(Card: in out Card_tp); --Gives Random
function Sacar_Carta return Card_tp; --Return Random Card
function Sacar_Carta(N: in Positive) return Card_tp; --Return ordered
function Card_Image ( Card: Card_tp) return String;
procedure Print_Baraja;
function Position (Card: in Card_tp) return Card_N_tp;
procedure Print_Card (Card: in Card_tp);
procedure Ordenar5 (Card1: in out Card_tp; Card2: in out Card_tp; Card3: in out Card_tp; Card4: in out Card_tp; Card5: in out Card_tp);
procedure Ordenar7 (Card1: in out Card_tp; Card2: in out Card_tp; Card3: in out Card_tp; Card4: in out Card_tp; Card5: in out Card_tp; Card6: in out Card_tp; Card7: in out Card_tp);


procedure Set_Token(Token: in out Token_tp);
function Set_Token return Token_tp;

function Is_Alta (Token: in out Token_tp; Card1: in Card_tp; Card2: in Card_tp; Card3: in Card_tp; Card4: in Card_tp; Card5: in Card_tp) return Boolean;

function Is_Par (Token: in out Token_tp; Card1: in Card_tp; Card2: in Card_tp; Card3: in Card_tp; Card4: in Card_tp; Card5: in Card_tp) return Boolean;

function Is_2Par (Token: in out Token_tp; Card1: in Card_tp; Card2: in Card_tp; Card3: in Card_tp; Card4: in Card_tp; Card5: in Card_tp) return Boolean;

function Is_Trio (Token: in out Token_tp; Card1: in Card_tp; Card2: in Card_tp; Card3: in Card_tp; Card4: in Card_tp; Card5: in Card_tp) return Boolean;


function Is_Escalera ( Token: in out Token_tp; Card1: in Card_tp; Card2: in Card_tp; Card3: in Card_tp; Card4: in Card_tp; Card5: in Card_tp) return Boolean;

function Is_Full (Token: in out Token_tp; Card1: in Card_tp; Card2: in Card_tp; Card3: in Card_tp; Card4: in Card_tp; Card5: in Card_tp) return Boolean;

function Is_Color( Token: in out Token_tp; Card1: in Card_tp; Card2: in Card_tp; Card3: in Card_tp; Card4: in Card_tp; Card5: in Card_tp) return Boolean;
function Is_EscaleraColor( Token: in out Token_tp; Card1: in Card_tp; Card2: in Card_tp; Card3: in Card_tp; Card4: in Card_tp; Card5: in Card_tp) return Boolean;

function Is_Poker (Token: in out Token_tp; Card1: in Card_tp; Card2: in Card_tp; Card3: in Card_tp; Card4: in Card_tp; Card5: in Card_tp)  return Boolean;


function what_hand(Token: in out Token_tp; Card1: in Card_tp; Card2: in Card_tp; Card3: in Card_tp; Card4: in Card_tp; Card5: in Card_tp) return H_tp;

function what_hand(Token: in out Token_tp; Card: in Five_Cards_tp) return H_tp ;

procedure tell_what_hand(Token: in out Token_tp;  Card1: in Card_tp; Card2: in Card_tp; Card3: in Card_tp; Card4: in Card_tp; Card5: in Card_tp);

procedure Sacar_5Cartas(Card: in out Five_Cards_tp); --Gives Random
function Sacar_5Cartas return Five_Cards_tp; --Return Random Card
function Sacar_5Cartas(N1: in Positive ; N2: in Positive; N3: in Positive; N4: in Positive ;N5: in Positive) return Five_Cards_tp; --Return ordered
procedure Print_5Cards (card: in Five_Cards_tp);
procedure Ordenar5 (card: in out Five_Cards_tp);
procedure tell_what_hand(Token: in out Token_tp;  card: in Five_Cards_tp);

function Mejor_mano (mano1: in Five_Cards_tp; mano2: in Five_Cards_tp) return Five_Cards_tp;

procedure Sacar_7Cartas(Card: in out Seven_Cards_tp); --Gives Random
function Sacar_7Cartas return Seven_Cards_tp; --Return Random Card
function Sacar_7Cartas(N1: in Positive ; N2: in Positive; N3: in Positive; N4: in Positive ;N5: in Positive; N6: in Positive; N7: in Positive) return Seven_Cards_tp; --Return ordered
procedure Print_7Cards (card: in Seven_Cards_tp);
procedure Ordenar7 (card: in out Seven_Cards_tp);

function Mejor5de7 (posibles: in Seven_Cards_tp) return Five_Cards_tp;

function Mejor5deManoYMesa (Mano: in Two_Cards_tp; Mesa: in Five_Cards_tp) return Five_Cards_tp;
function Sacar_2Cartas return Two_Cards_tp;
procedure Sacar_2Cartas(Card: in out Two_Cards_tp);
procedure what_hand(Hand: in out Hand_tp; Card: in Five_Cards_tp);
procedure tell_what_hand (player: in out Player_tp);
procedure what_hand(player: in out Player_tp);

--type crupier_tp;


--type gamed is access game_cards;
--type game_cards is record
--   card: Card_tp;
--   next: gamed;
--end record;




-- function what_best_hand (Token: in out Token_tp; PCards: in out Possible_Cards_tp) return Hand_tp;
--
-- procedure Tell_Me_What_Hand (Hand: in Hand_tp);
-- function Default_Hand return Hand_tp;
--
-- procedure Save(Card: in out Card_tp);
-- procedure Save(Card1: in out Card_tp; Card2: in out Card_tp);

end PKR;
