with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

function Fakultet(X : in Integer) return Integer is 
     Y : Integer;
   begin
      Y := X;
      if X = 0 then
	 return 1;
      end if;
--Using recursion until X = 0
      return Y * Fakultet(X - 1); 
      
end Fakultet;
 
