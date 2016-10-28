with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Strings.Fixed;    use Ada.Strings.Fixed;
procedure Labb is
   type Char_Array_Type is
     array (1..257) of Character;
   
   type String_Type is
      record 
	 Char_Array : Char_Array_Type;
	 Length : Integer;
      end record;
   
   procedure Get (P : in out String_Type) is
   I : Integer := P.Char_Array'First;   
   begin
      while not(End_Of_Line) loop
	 Get(P.Char_Array(I));
	 I := I + 1;
      end loop;
      P.Length := I - 1; -- Pga. Char_Array_Type börjar i position 1..
   end Get;
   
   procedure Find_Token(S : in String_Type;
			First : out Integer;
			Second : out Positive) is
      First_Ready : Boolean := False;
   begin
      for I in S.Char_Array'First..S.Char_Array'Last loop
	 
	 if (First_Ready and S.Char_Array(I) = '-') then
	    Second := I;
	    return;
	 end if;
	 if ( not(First_Ready) and S.Char_Array(I) = '-') then 
	    First := I;
	    First_Ready := True;
	 end if;
      end loop;
   end Find_Token;
   
   S : String_Type;
   F,L : Integer;
begin
   Get(S);
   Find_Token(S,F,L);
   Put(F,0);Put(" ");Put(L,0);
end Labb;

   
