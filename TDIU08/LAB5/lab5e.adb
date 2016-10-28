with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO;         use Ada.Text_IO;

procedure Lab5e is
 --   Lager(Index) = (B+2) * (L+1);
   function Building_Height(Height : in Integer) return Integer is 
     function Count_Blocks(Height: in  Positive;
		    Index : in out Positive;
		    Width : in Positive := 1;
		    Length: in Positive := 1) return Integer is
     begin
	if Height <= Index then
	   return 0;
	end if;
	Index := Index + 1;
	return ((Width) * (Length) + Count_Blocks(Height, Index,(Width+1),(Length+2)));
     end Count_Blocks;
     I : Integer := 1;
  begin
     return Count_Blocks(Height,I);
  end Building_Height;
  
   X, Height : Integer;
begin
   Put("Mata in husets höjd (HH = antal stenar i höjdled): ");
   Get(Height);
   X := Building_Height(Height);
   Put("Det behövs ");Put(X,0);Put(" stenar för att bygga trappan");  
end Lab5e;




