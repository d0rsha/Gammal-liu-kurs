with Ada.Text_IO;			use Ada.Text_IO;
with Ada.Float_Text_IO;			use Ada.Float_Text_IO;
with Ada.Integer_Text_IO;		use Ada.Integer_Text_IO;
--As libaries above - You don't use file endings such as ".adb"
with Fakultet;    --use is not nescisary for single function files

procedure Miniraknare is
   
   function Add (A : in Integer;
		 B : in Integer) return Integer is
   begin
      return (A + B);
   end Add;
   
   function Add_F (A : in Float;
		   B : in FLoat) return Float is
   begin
      return (A + B);
   end Add_F;
   
   
   Choice : Integer;
   A, B, I   : Integer;
   X, Y   : Float;
   
begin
   Put_Line("VÃ¤lkommen till minirÃ¤knaren!");
   loop
      Put_Line("1. BerÃ¤kna N-fakultet.");
      Put_Line("2. Addera tvÃ¥ heltal.");
      Put_Line("3. Addera heltal med flyttal.");
      Put_Line("4. Addera flyttal med heltal.");
      Put_Line("5. Addera tvÃ¥ flyttal.");
      Put_Line("6. Avsluta.");
      Put("VÃ¤lj ett alternativ: ");
      Get(Choice);
      New_Line;
      exit when Choice = 6;
      
      if Choice = 1 then
	 Put("Mata in ett heltal: ");
	 Get(A);
	 --//           //--
	 I := Fakultet(A);
	 --//Added code //--
	 Put(A, Width => 0);
	 Put("! = ");
	 Put(I);
	 ---
	 
      elsif Choice = 2 then
	 Put("Mata in tvÃ¥ heltal: ");
	 Get(A);
	 Get(B);

	 Put(A, Width => 0);
	 Put(" + ");
	 Put(B, Width => 0);
	 Put(" = ");
	 ---
 	 A := Add(A,B);
	 Put(A);
	 
      elsif Choice = 3 then
	 Put("Mata in ett heltal och ett flyttal: ");
	 Get(A);
	 Get(X);
	 
	 Put(A, Width => 0);
	 Put(" + ");
	 Put(X, Fore => 0, Aft => 2, Exp => 0);
	 Put(" = ");
	 ---
	 X := Add_f(Float(A),X);
	 Put(X, Fore=>0, Aft => 2, Exp => 0);
	 
      elsif Choice = 4 then
	 Put("Mata in ett flyttal och ett heltal: ");
	 Get(X);
	 Get(A);
	 
	 Put(X, Fore => 0, Aft => 2, Exp => 0);
	 Put(" + ");
	 Put(A, Width => 0);
	 Put(" = ");
	 ---
	 X := Add_F(X, Float(A));
	 Put(X, Fore=>0, Aft => 2, Exp => 0);
	 
      elsif Choice = 5 then
	 Put("Mata in tvÃ¥ flytal: ");
	 Get(X);
	 Get(Y);
	 
	 Put(X, Fore => 0, Aft => 2, Exp => 0);
	 Put(" + ");
	 Put(Y, Fore => 0, Aft => 2, Exp => 0);
	 Put(" = ");
	 ---
	 X := Add_F(X,Y);
	 Put(X, Fore=>0, Aft => 2, Exp => 0);
	 
      end if;
      New_Line(2);
   end loop;
   Put_Line("HejdÃ¥, vi ses nÃ¤sta gÃ¥ng!");
      
end Miniraknare;
     
     
