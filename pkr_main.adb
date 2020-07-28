with Ada.Text_IO;
use Ada.Text_IO;
with PKR;
use PKR;
with PKRability;
use PKRability;

procedure PKR_main is
   player: Player_tp;
   player2: Player_tp;

   mesa: Five_Cards_tp:= Sacar_5Cartas;
   Token: Token_tp:= Set_Token;
begin --PKR_main
   New_Line;
   player.mano:=Sacar_2Cartas;
   player2.mano:=Sacar_2Cartas;

   Print_Card (player.mano(1));
   Print_Card (player.mano(2));
   New_Line;
   Print_Card (player2.mano(1));
   Print_Card (player2.mano(2));
   New_Line;
   Print_5Cards(mesa);

   player.mira:= Mejor5deManoYMesa(player.mano,mesa);
   player2.mira:= Mejor5deManoYMesa(player2.mano,mesa);
   what_hand(player);
   tell_what_hand(player);
   what_hand(player2);
   tell_what_hand(player2);

   Print_5Cards(Mejor_mano(player.mira,player2.mira));

   if Mejor_mano(player.mira,player2.mira)=player.mira then
      Put_Line("P1 wins");
   end if;
   if Mejor_mano(player.mira,player2.mira)=player2.mira then
      Put_Line("P2 wins");
   end if;
end PKR_main;
