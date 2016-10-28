with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO;         use Ada.TExt_IO;

procedure Lab4c is
   
   function Fib(N : in Positive) return Positive is 
   begin
      if N <= 2 then
	 return 1;
      end if;
      return (Fib(N-1) + Fib(N-2));
   end Fib;

   X,X_loop : Positive;
begin
   Put("Välj antal fibonacci tal att visa: ");
   Get(X_Loop);
   for I in 1..X_loop loop
      X := Fib(I);
      Put(X,10);Put(" ");
      if (I mod 6) = 0 then
	 New_Line;
      end if;
   end loop;
end Lab4c; 
