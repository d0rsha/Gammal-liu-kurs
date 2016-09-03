--------------------------------------------------------------
--                  Befolkningsproblemet
--
-- 
-- Anders Vrethem
--
-- v1.0
--------------------------------------------------------------
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;
with Ada.Text_IO;         use Ada.Text_IO;

procedure lab_1_extra_1 is
-- Deklarationer  
   year: Integer;
   Land_A: Float;
   Land_A_procent: Float;
   Land_B: Float;
   Land_B_procent: Float;
-- If Land_A > Land_B then A = true
   A: Boolean:= false;
-- If Land_A < Land_B then B is true
   B: Boolean:= False;
   -- Lagringsvariabel för beräkningar
   x : Float;
   
   
begin 
   
   loop
   Put("Ange startår: ");
   Get(Integer(Year));
   Skip_Line;
   Put("Ange land A:s folkmängd: (i milj.): ");
   Get(Float(Land_A));
   Skip_Line;
   Put("Ange land A:s befolkningsökning (i %): ");
   Get(Float(Land_A_procent));
   Land_A_Procent := Land_A_Procent/100.00;
   Skip_Line;
   Put("Ange land B:s folkmängd: (i milj.): ");
   Get(Float(Land_B));
   Skip_Line;
   Put("Ange land B:s befolkningsökning (i %): ");
   Get(Float(Land_B_procent));
   Land_B_Procent := Land_B_Procent/100.00;
   Skip_Line;
   
   
   ----- Kontrollera anvandares indata... Alla villkor...------
   --                    exits on true                      --  
   if Land_A > Land_B and Land_A_procent < Land_B_procent and 
     Land_B > 0.0 and Land_A > 0.0 and Land_A_Procent > 0.0 and 
     Land_A_Procent < 100.0 Then
      A:= True;
      exit;
      
   elsif Land_A < Land_B and Land_A_Procent > Land_B_Procent and
     Land_B > 0.0 and  Land_A > 0.0 and Land_A_Procent > 0.0 and
     Land_A_Procent < 100.0 then
      B:= True;
      exit;
  --------------------------------------------------------------    
   else
      Put("Försök igen");
      New_Line;
   end if;
   end loop;
   
   Put("Årtal Ökning A Folkmängd A Ökning B Folkmängd B");
    ---Det var svårt att få in denna i loopen---
      New_Line;
      Put(Year, Width => 1);
      Put("   ---   ");
      Put("  ");
      Put(Land_A, Fore => 6, Aft => 2, Exp => 0);
      Put("  ");
      Put("   ---   ");
      Put("  ");
      Put(Land_B, Fore => 6, Aft => 2, Exp => 0);
    ---------------------------------------------
   
   
      while  A or B loop
-- Beräkningar	 
      Year := Year + 1;
      Land_A := Land_A + Land_A * Land_A_Procent;
      Land_B := Land_B + Land_B * Land_B_Procent;
      
-- Utskrift
      New_Line;
      Put(Year, Width => 1);
      x := (Land_A *( Land_A_Procent ));
      Put(x, Fore => 6, Aft =>2, Exp => 0);
      Put("  ");
      Put(Land_A, Fore => 6, Aft => 2, Exp => 0);
      Put("  ");
      x := (Land_B *( Land_B_Procent ));
      Put(x, Fore => 6, Aft => 2, Exp => 0);
      Put("  ");
      Put(Land_B, Fore => 6, Aft => 2, Exp => 0);
      
-- Villkor för att gå ur loop      
      if A and Land_A < Land_B then
	 A := False;
	 New_Line;
	 Put("År ");
	 Put(Year,Width=>1);
	 Put(" har land B gått om land A i befolkning.");
      elsif B and Land_A > Land_B then
	 B := False;
	 New_Line;
	 Put("År ");
	 Put(Year,Width=>1);
	 Put(" har land A gått om land B i befolkning.");
      end if;
      
   end loop;
   
end lab_1_extra_1;
 
   
    
     
     
   
       
