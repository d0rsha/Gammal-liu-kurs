with Ada.Integer_Text_Io; use Ada.IntegeR_Text_Io;
with Ada.TexT_Io; use Ada.Text_Io;
with Managedate; use Managedate;
procedure Lab4 is
   
   Datum:Date;
   Datum1:Date;
begin
   Put("Ange ett datum: ");
   Get(Datum);
   Put("Ange ett till datum: ");
   Get(Datum1);
   Put(Datum);
   New_Line;
   Put(Next_Date(Datum));
   New_Line;
   Put(Previous_Date(Datum));
   New_Line;
   if Datum = Datum1 then
      Put(Datum);Put(" = "); Put(Datum1);
   end if;
   if Datum < Datum1 then
      Put(Datum);Put(" är mindre än ");Put(Datum1);
      New_Line;
   end if;
   if Datum > Datum1 then
      Put(Datum);Put(" är större än ");Put(Datum1);
   end if;
exception
   when Year_Error =>
     Put("Hej");
end Lab4;
