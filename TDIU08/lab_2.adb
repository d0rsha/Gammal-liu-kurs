with Ada.Text_IO;	  use Ada.Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Lab_2 is
   
--------Procedure to handle input from user -----------------
   Procedure Inmatning(Tal : in out Float; 
		       Low : in  FLoat := 0.0; 
		       High : in Float := 10000.0;
		       Input : in Integer:= 0 ) is
   begin
--If procedure is given Input parameter      
      if Input = 1 then
	 Put("Första pris: ");
      elsif Input =2 then
	 Put("Sista pris: ");
      elsif Input = 3 then
	 Put("Steg: ");
      elsif Input = 4 then
	 Put("Momsprocent: ");
      end if;
      loop
	 begin
	    Get(Tal);
	    if Tal <= Low then
	       Put("Too low, try again: ");
	    elsif Tal >= High then
	       Put("Too high, try again: ");
	    else
	       Skip_Line;
	       exit;
	    end if;
	    
	 exception when Data_Error =>
	    Put("Data Error, try again: ");
	    Skip_Line;
	 end;
      end loop;
    end Inmatning;
    -------------------------------------------------------  
    
   --------------- 'Rader' put tabell content ------------
    procedure Rader(F1 : in Float; Moms : in Float) is
       Fp : Float;
      begin
         Fp := F1;
	 Put(Fp, Fore =>5, Aft => 2, Exp =>0);
	 Put(Fp * Moms/100.0, Fore =>8, Aft => 2, Exp =>0);
	 Put((Fp * (Moms/100.0) + Fp), Fore =>6, Aft => 2, Exp =>0);
     
   end Rader;
------------------------------------------------------------   
   
--------------'Print' tabell -------------------------------
   procedure Print(Fp : in Float;
		   Sp : in Float;
		   Steg : in Float;
		   Moms : in Float) is
      F1 : Float;
   begin
      F1 := Fp;
      Put("=== Momstabell ===");
      New_Line;
      Put("Pris utan moms Moms Pris med moms");
      New_Line;
      
      while F1 <= Sp loop
	 Rader(F1, Moms);
	 F1 := F1 + Steg;
	 New_Line;
      end loop;
      
      
   end Print;
-------------------------------------------------------
   
--------Declarations Main Program- --------------------
   Fp ,Sp ,Steg :Float;
   Moms :Float;
   
-- Main Program   
Begin
   Inmatning(Fp, Input=>1);
   
   Inmatning(Sp, Fp,Input =>2);
   
   Inmatning(Steg, 0.0, (Sp - Fp), Input =>3);
   
   Inmatning(Moms, 0.0, 100.0, Input => 4);
   
   Print(Fp,Sp,Steg,Moms);
   
end lab_2;
