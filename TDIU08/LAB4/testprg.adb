with Ada.Text_Io; use Ada.Text_Io;
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
with Managedate; use Managedate;

procedure Testprg is
   Dagar1,Dagar2:Integer;
   Datum1,Datum2:Date;
begin
   Put("Skriv in dagens datum: ");
   Get(Datum1);
   loop
      Put("Mata in ett annat datum: ");
      Get(Datum2);
      if Datum1 = Datum2 then
	 Put_Line("fy");
      else
	 exit;
      end if;
   end loop;
   New_Line;
   Dagar1 := Year_get(Datum1)*12*365 + Month_get(Datum1)*31 + Day_get(Datum1);--HAR TÄNKT PÅ DET
   Dagar2 := Year_get(Datum2)*12*365 + Month_get(Datum2)*31 + Day_get(Datum2);
   if Dagar1 > Dagar2 then
      Dagar1 := Dagar1 - Dagar2;
      Put("Det andra datumet är ");Put(Dagar1,0);Put(" innan det första.");
   elsif Dagar1 < Dagar2 then
      Dagar1 := Dagar2 - Dagar1;
      Put("Det andra datumet är ");Put(Dagar1,0);Put(" efter det första.");
   end if;
   
end Testprg;
