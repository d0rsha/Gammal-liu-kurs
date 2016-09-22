with Ada.Text_IO;			use Ada.Text_IO;
with Ada.Integer_Text_IO;		use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

procedure Rolldie2  is
 
   procedure PutDice (N : in Integer) is
      type Matris is
	array (1..6) of String(1..7);
       
      procedure PrintDice (Dice_Array1 : in Matris;
			   Dice_Array2 : in Matris) is
	 
      begin
	 New_Line;
	 Put("+-----+");   
	 New_Line;
	 --Put Dice array1
	 Put(Dice_Array1(N));
	 New_Line;
	 --Put Dice array2
	 Put(Dice_Array2(N));
	 New_Line;
	 
	 Put("+-----+"); 
	 New_Line;
      end PrintDice;
      
      
      Dice_Array1,Dice_Array2 : Matris;
   begin
      --                  1         2           3          4          5          6
      Dice_Array1 := ("|     |","| *   |","|*   *|","| * * |","|* * *|","|* * *|");
      Dice_Array2 := ("|  *  |","|   * |","|  *  |","| * * |","| * * |","|* * *|");	      
      PrintDice(Dice_Array1,Dice_Array2);
   end PutDice;
   
   --Create new Subtype 1 -> 6 
   subtype One_To_Six is
     Integer range 1..6;
   
   --Create some kind of package and use it 
   package My_Random_Package is
      new Ada.Numerics.Discrete_Random(One_To_Six);
   
   use My_Random_Package;
     
G : Generator;
N, Throw : Integer;
Summa : Integer := 0;
   
begin
   Reset(G); 
   Put("Mata in antal slag: ");
   Get(Throw);
   
   for I in 1..Throw loop
      N := Random(G);
      Summa := Summa + N;
      PutDice(N);
   end loop;
   
   New_Line(1);
   Put("Summan blev : ");
   Put(Summa, Width =>0);
   
end Rolldie2;
