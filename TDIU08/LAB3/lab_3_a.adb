with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;
with Ada.Text_IO;            use Ada.Text_IO;

procedure Lab_3_a is
   
   type Ten_Ints_Array_Type is
     array (1..10) of Integer;
   
   procedure Get_Ints (Ints_Array : in out Ten_Ints_Array_Type) is 
   begin
      for I in Ten_Ints_Array_Type'Range loop
	 Get(Ints_Array(I));
      end loop;
   end Get_Ints;
   
   procedure Put_Ints (Ints_Array : in Ten_Ints_Array_Type) is
   begin
      for I in Ten_Ints_Array_Type'Range loop
	 Put(Ints_Array(I), Width =>0);
	 Put(' ');
      end loop;
      New_Line;
   end Put_Ints;
   
   procedure Find_Maximum (Ints_Array : in Ten_Ints_Array_Type;
			   Big : out Integer;
			   Index :out Integer) is
      Temp : Integer;
   begin
      Big := Ints_Array(Ints_Array'First);
      Index := Ints_Array'First;
      for I in Ints_Array'range loop
	    Temp := Ints_Array(I);
	    if Big < Temp then
	       Big := Temp;
	       Index := I;
	    end if;
      end loop;
    
   end Find_Maximum;
   
   procedure Find_Minimum (Ints_Array : in Ten_Ints_Array_Type;
			   Small : out Integer;
			  Index :  out Integer) is 
      Temp : Integer;
   begin
      Small := Ints_Array(Ints_Array'First);
      Index := Ints_Array'First;
      for I in Ints_Array'Range loop
	    Temp := Ints_Array(I);
	    if Small > Temp then
	       Small := Temp;
	       Index := I;
	    end if;
      end loop;
   end Find_Minimum;
   
   procedure Reverse_Array (Ints_Array : in out Ten_Ints_Array_Type) is
      Temp : Integer;   
   begin
      for I in Ints_Array'First..(Ints_Array'Last)/2 loop
	 Temp := Ints_Array(Ints_Array'Length - (I-1));
	 Ints_Array(Ints_Array'Length - (I-1)) := Ints_Array(I);
	 Ints_Array(I) := Temp;
      end loop;
   end Reverse_Array;
   
   Ints_Array : Ten_Ints_Array_Type;
   X,Index : Integer;

begin
   Put("Please enter 10 numbers: ");
   Get_Ints(Ints_Array);
   Put("Reversed array         : ");
   Reverse_Array(Ints_Array);
   Put_Ints(Ints_Array);
   
   Find_Maximum(Ints_Array,X,Index );
   Put("Max : ");
   Put(X, Width =>0);
   Put(" @ Index: ");
   Put(Index, Width =>0);
   New_Line;

    Find_Minimum(Ints_Array,X,Index );
   Put("Min : ");
   Put(X, Width =>0);
   Put(" @ Index: ");
   Put(Index, Width =>0);
   New_Line;
end Lab_3_a;
