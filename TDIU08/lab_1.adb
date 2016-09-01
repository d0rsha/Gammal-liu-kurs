with Ada.Text_IO;	  use Ada.Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure lab_1 is
   
   --Deklarationer
   Fp ,Sp ,Steg,Mp :Float;
   Moms, Total :Float;
   
Begin
-- Get Fp from user
   Put("Första pris: ");
   loop  --loops code from loop to end loop;
   Get(Fp);
   Skip_Line;
   if Fp > 0.0 then
      exit; -- Exit loop
   else
      Put("[Första pris] Talet måste vara större än noll: ");
   end if;
   end loop;
   
--Get Sp
   Put("Sista pris: ");
   loop
   Get(Sp);
   Skip_Line;
   if Sp > Fp then
      exit;
   else
      Put("[Sista pris] Talet måste vara större än första priset: ");
      end if;
   end loop;

--Get Steg
   Put("Steg: ");
   loop
   Get(Steg);
   Skip_Line;
   if Steg >= 0.0 then
      exit;
   else
      Put("[   Steg   ] Talet måste vara större än noll: ");
   end if;
   end loop;

--Get Mp
   Put("Momsprocent: ");
   loop
   Get(Mp);
   Skip_Line;
   if Mp >= 0.0 and Mp < 100.0 then
      New_Line;
      exit;
   else
      Put("[Momsprocent] Talet måste vara större än noll och mindre än 100: ");
   end if;
   end loop;

      

   Put("=== Momstabell ===");
   New_Line;
   Put("Pris utan moms Moms Pris med moms");
   
 --  if Fp < Sp and Steg > 0.0 and Mp > 0.0 then ( Behövs inte längre då värdena kontrolleras direkt vid inläsning )
      
   while Fp <= Sp loop
    
      New_Line;
      Put(Fp, Fore =>5, Aft => 2, Exp =>0);
      Moms := Fp * Mp/100.0;
      Put(Moms, Fore =>8, Aft => 2, Exp =>0);
      Total := Moms + Fp;
      Put(Total, Fore =>6, Aft => 2, Exp =>0);
       
      
      Fp := Fp + Steg;
   end loop;
   
 --  else 
 --    Put("OBS! Inga vägverkare tillåtna");
      
 --  end if;
   
   
end lab_1;
