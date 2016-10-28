with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO;         use Ada.Text_IO;

procedure Summa is
   
--   procedure Summera(K : in Positive;
--		     Summa : out Positive) is
--   begin
--      if K = 1 then
--	 Summa := 1;
--      end if;
--      Summera((K-1),Summa);
--      Summa := Summa + K;
--      
--   end Summera;
   
   procedure Summera(K : in Positive;
		     Summa : out Natural) is
      
      procedure Summera (K : in Positive;
		      Summa : in out Natural;
		      I : in Integer) is
   begin
      if  I = K then
	 Summa := Summa + K;
      else 
	 Summa := Summa + I;
	 Summera(K, Summa, I+1);
      end if;
   end Summera;
   
      I : Integer := 1;
   begin
      Summa := 0;
      Summera(K, Summa, I);
      
   end Summera;
   
   
   Summa : Integer;
   K : Integer;
begin
   Get(K);
   Summera(K,Summa);
   Put(Summa,0);
   
end Summa;
