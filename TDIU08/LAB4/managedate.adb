package body Managedate is
   Year : constant Booldate_Type := Year1;
   Month : constant Booldate_Type := Month1;
   Day : constant Booldate_Type := Day1;
   
   function Next_Date(Datumin:in Date) return Date is
      Datum:Date := Datumin;
      procedure Next_Year(Datum : in out Date) is
      begin
	 if Datum(Month) > 12 then
	    Datum(Year) := Datum(Year1) + 1;
	    Datum(Month) := 1;
	 else
	    return;
	 end if;
      end Next_Year;
      
   begin
      if (Datum(Month) = 2 and Datum(Day) > 28) then
	 Datum(Month) := 3;
	 Datum(Day) := 1;
      elsif (Datum(Month) >= 1 and Datum(Month) <= 7 
	       and Datum(Month) mod 2 /= 0) and Datum(Day) > 31 then
	 Datum(Month) := Datum(Month) + 1;
	 Next_Year(Datum);
      elsif (Datum(Month) >= 8 and Datum(Month) <= 12 
	       and Datum(Month) mod 2 = 0) and Datum(Day) > 31 then
	 Datum(Month) := (Datum(Month) + 1);			       
	 Next_Year(Datum);
      elsif (Datum(Day) > 30) then
	 Datum(Month) := Datum(Month) + 1;
	 Next_Year(Datum);
      end if;
      return Datum;
   end Next_Date;
   
   function Previous_Date(Datumin:in Date) return Date is
      Datum:Date := Datumin;
      procedure Prev_Year(Datum : in out Date) is
      begin
	 if Datum(Month) > 12 then
	    Datum(Year) := Datum(Year) - 1;
	    Datum(Month) := 12;
	 else
	    return;
	 end if;
      end Prev_Year;
      
   begin
      if(  Datum(Month) = 2 and Datum(Day) < 1 ) then
	 Datum(Month) := 3;
	 Datum(Day) := 1;
      elsif (Datum(Month) >= 1 and Datum(Month) <= 7 
	       and Datum(Month) mod 2 /= 0) and Datum(Day) < 1 then
	 Datum(Month) := Datum(Month) - 1;
	 Prev_Year(Datum);
      elsif (Datum(Month) >= 8 and Datum(Month) <= 12 
	       and Datum(Month) mod 2 = 0) and Datum(Day) < 1 then
	 Datum(Month) := Datum(Month) - 1;			       
	 Prev_Year(Datum);
      elsif (Datum(Day) < 1) then
	 Datum(Month) := Datum(Month) - 1;
	 Prev_Year(Datum);
      end if;
      return Datum;
   end Previous_Date;
   
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
   
   procedure Get(Datum:out Date)is
      S_type : String_Type;
      First, Second : Positive;
      S : String(1..10);
      procedure Get (P : out String_Type) is
        I : Integer := P.Char_Array'First;
      begin
	 if End_Of_Line then
	    Skip_Line;
	 end if;
	 while (not End_Of_Line) loop
	    Get(P.Char_Array(I));
	    I := I + 1;   
	 end loop;
	 P.Length := I - 1;
	 Skip_Line;
      end Get;
      
   begin
      Get(S_Type);
      Find_Token(S_Type,First,Second);
      for I in 1..10 loop
	 if S_Type.Length >= I then
	    S(I) := S_Type.Char_Array(I);
	 else 
	    S(I) := ('x');
	 end if;   
      end loop;
      if Second - First = 3 and S_Type.Length - Second = 2 then 
	 Datum(Year) := Integer'Value(S(1..(First-1)));
	 Datum(Month) := Integer'Value(S((First+1)..(Second-1)));
	 Datum(Day) := Integer'Value(S((Second+1)..(Second+2)));
      end if;
	 
      
   end Get;
   
   procedure Put(Datum:in Date)is
   begin
      Put(Datum(Year),0);
      Put('-');
      if Datum(Month) > 9 then
	 Put(Datum(Month),0);
      else
	 Put('0');
	 Put(Datum(Month),0);
      end if;
      Put('-');
      if Datum(Day) > 9 then
	 Put(Datum(Day),0);
      else
	 Put('0');
	 Put(Datum(Day),0);
      end if;
   end Put;
   
   function "="(Leftdate:in Date;Rightdate:in Date)return Boolean is
   begin
      if Leftdate(Year) = Rightdate(Year) and Leftdate(Month) = Rightdate(Month) and Leftdate(Day) = Rightdate(Day) then
	 return True;
      end if;
      return False;
   end "=";
   
   function "<"(Leftdate:in Date;Rightdate:in Date)return Boolean is
   begin
      if Leftdate(Year) < Rightdate(Year) or (Leftdate(Year) <= Rightdate(Year) and Leftdate(Month) < Rightdate(Month)) or (Leftdate(Year) <= Rightdate(Year) and Leftdate(Month) <= Rightdate(Month) and Leftdate(Day) < Rightdate(Day)) then
	 return True;
      end if;
      return False;
   end "<";
   
   function ">"(Leftdate:in Date;Rightdate:in Date)return Boolean is
   begin
      if Leftdate(Year) > Rightdate(Year) or (Leftdate(Year) >= Rightdate(Year) and Leftdate(Month) > Rightdate(Month)) or (Leftdate(Year) >= Rightdate(Year) and Leftdate(Month) >= Rightdate(Month) and Leftdate(Day) > Rightdate(Day)) then
	 return True;
      end if;
      return False;
   end ">";
   
   function Year_Get(Date1:in Date) return Integer is
   begin
      return Date1(Year);
   end Year_Get;
   
   function Month_Get(Date1:in Date) return Integer is
   begin
      return Date1(Month);
   end Month_Get;
   
   function Day_Get(Date1:in Date) return Integer is
   begin
      return Date1(Day);
   end Day_Get;
      
end Managedate;
