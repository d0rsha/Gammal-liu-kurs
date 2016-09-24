with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;

procedure Binary_name is
   
   --Skriver ut ett tal "X" i binär form, 
   --skönsvärde är satt till 8 bitars tal
   procedure Print_Binary2 (X : in Integer;
			    Bitar : in Integer := 8) is
      X_Summa, N : Integer;
   begin
      X_Summa := X;
      N := Bitar - 1;
      if N < 0 then
	 return;
      end if;
      
      if X_Summa >= (2 **(N)) then
	 Put("1");
	 X_Summa := X_Summa - (2 **(N));
      else
	 Put("0");
      end if;

      Print_Binary2(X_Summa,N);   
   end Print_Binary2;   
 
   Char_In: Character;
   ASCII_Siffra : Integer := 1;
   
begin
   put("Mata in ditt namn binärt: ");
   
   --   Hämta characters från tangentbordsbufferten 
   --   tills "End_Of_line"-tecknet dyker upp
   while (not Ada.Text_IO.End_Of_Line) loop
      
      if ASCII_Siffra = 1 then
	 Put_Line("Ditt namn binärt: ");
      end if;
      ASCII_Siffra := 65;
      
      get(Char_In);
      
      for Char_ASCII in Character range 'A'..'z' loop
	 if Char_ASCII = Char_In then
	    --	    Put(ASCII_Siffra, Width => 0,Base =>2);
	    Print_Binary2(ASCII_Siffra);
	    New_Line;
	 end if;
	 ASCII_Siffra := ASCII_Siffra + 1;
      end loop;
      
   end loop;
   
end Binary_name;
