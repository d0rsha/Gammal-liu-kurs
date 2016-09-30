with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;
with Ada.Text_IO;          use Ada.Text_IO;

procedure Lab_3_B is
   
   type Char_Array_Type is
     array (1..257) of Character;
   
   type String_Type is
      record 
	 Char_Array : Char_Array_Type;
	 Length : Integer;
      end record;
   
   procedure Get_P (P : in out String_Type) is
      I : Integer := P.Char_Array'First;
   begin
      while (not End_Of_Line) loop
	 Get(P.Char_Array(I));
	 I := I + 1;   
      end loop;
      P.Length := I - 1; -- Pga. Char_Array_Type börjar i position 1..
   end Get_P;
   
   procedure Put_P (P : in String_Type) is
   begin
	 for I in P.Char_Array'First..P.Length loop
	    Put(P.Char_Array(I));
	 end loop;
   end Put_P;
   
   Function "=" (Left : in String_Type;
		 Right : in String_Type) return Boolean  is
   begin
      if Left.Length = Right.Length then
	 --! Can't compare empty elements -- 
	 for I in Left.Char_Array'First..Left.Length loop
	    if not(Left.Char_Array(I) = Right.Char_Array(I)) then
	      return FALSE;
	    end if;
	 end loop;
	 return TRUE;
      else 
	 return FALSE;
      end if;
   end "=";
   
   P1, P2 : String_Type;
begin
   Put("Mata in en sträng: ");
   Get_P(P1);
   Skip_Line;
   
   Put_P(P1);
   New_Line;
   
   Put("Mata in en sträng: ");
   Get_P(P2);
   Skip_Line;
   Put_P(P2);
   New_Line;
   
   if P1 = P2 then
      Put_Line("Lika!");
   end if;
   
   
end Lab_3_B;

   
