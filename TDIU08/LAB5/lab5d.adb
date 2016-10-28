with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO;         use Ada.Text_IO;

procedure Lab5d is

type Char_Array_Type is
     array (1..257) of Character;
   
   type String_Type is
      record 
	 Char_Array : Char_Array_Type;
	 Length : Integer;
      end record;
   
   procedure Get (P : out String_Type;
		  I : in Positive := Char_Array_Type'First) is
      Tmp : Integer;
   begin
      if (End_Of_Line) then
	 P.Length := I - 1;
	 return;
      end if;
      Get(P.Char_Array(I));
      Tmp := I + 1;
      Get(P, Tmp);
   end Get;
   
      procedure Put(P : in String_Type;
		    Index : in Integer := 1) is
	 I : Integer;
      begin
	 I := Index;
	 if I <= P.Length then
	    Put(P.Char_Array(I));
	    I := I + 1;
	    Put(P, I);
	 end if;
      end Put;
   
   Function "=" (Left : in String_Type;
		 Right : in String_Type) return Boolean  is
      
      function Iteration(Left : in String_Type;
			 Right : in String_Type;
			 Indx : in Integer) return Boolean is
	 Index : Integer;
      begin
	 Index := Indx;
	 if Index <= Left.Length then
	 --! Cannot compare empty elements -- 	    
	    if (Left.Char_Array(Index) = Right.Char_Array(Index)) then
	       Index := Index + 1;
	       return Iteration(Left, Right,Index);
	    else
	       return FALSE;
	    end if; 
	 else --When Index > Left.Length // Check is already made
	    return True;
	 end if;
      end Iteration;
      Index : Integer := Left.Char_Array'First;
   begin
      if Left.Length = Right.Length then
	 return Iteration(Left,Right,Index);
      end if;
      return FALSE;
   end "=";

   P1, P2 : String_Type;
begin
   Put("Skriv vad du vill här: ");
   Get(P1);
   Skip_Line;
   Put("Skriv det igen tack  : ");
   Get(P2);
   Skip_Line;
   Put(P1); Put(" / "); Put(P2);
   New_Line;
   if P1 = P2 then
      Put("Duktigt!");
   else
      Put("Fy");
   end if;
   
   
end Lab5d;
