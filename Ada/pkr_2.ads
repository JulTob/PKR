---------------------
 -- Poker Library --
---------------------

with Ada.Strings.Wide_Wide_Unbounded;
with Ada.Wide_Wide_Text_IO;
with Ada.Wide_Wide_Text_IO.Wide_Wide_Unbounded_IO;

use Ada.Strings.Wide_Wide_Unbounded;
use Ada.Wide_Wide_Text_IO;
use Ada.Wide_Wide_Text_IO.Wide_Wide_Unbounded_IO;

package PKR is

  subtype Letter is Wide_Wide_Character;
  subtype Text is Wide_Wide_String;
  subtype Dynamic_Text is Unbounded_Wide_Wide_String;

  type Value_Type is new Positive range 1..13;
  type Color_type is (diamonds, clubs, hearts, spades);
--diamonds (♦), clubs (♣), hearts (♥) and spades (♠)

  	type 	Card_type is record
    	Value: Value_Type;
    	color: color_type;
	  	end record;

	type Deck_t is array (1 .. 52) of Card_t;

  	function New_Card return Card_type;
  	function New_Card (
      	Value: Value_Type;
      	color: color_type) return Card_type;

  	function  Image(Card : Card_type) return Text;

	function New_Deck return Deck_t;
    procedure Shuffle(Deck : in out Deck_t);
    function Deal(Deck : in out Deck_t) return Card_t;

	Hand_Size: Natural := 7; -- Maximum of 7 cards in Texas Hold'em

    type Hand_t is array (1 .. Hand_Size) of Card_t;

    type Game_State is record
       	Player_Hand    : Hand_t(1 .. 2);   -- The player's two hole cards
       	Community_Cards: Hand_t(1 .. 5);   -- The flop, turn, and river
       	Opponents      : Natural := 1;     -- Number of opponents
    	end record;

	type Hand_Rank is (
		High_Card,
		One_Pair,
		Two_Pair,
		Three_of_a_Kind,
		Straight,
		Flush,
		Full_House,
		Four_of_a_Kind,
		Straight_Flush,
		Royal_Flush
		);

	function Evaluate_Hand(Hand : Hand_t) return Hand_Rank;

	procedure Simulate_Games(
		Game        	: in Game_State;
		Num_Simulations : in Natural;
		Winning_Hands   : out Natural
		);

end PKR;
