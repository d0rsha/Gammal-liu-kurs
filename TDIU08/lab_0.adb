with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
use Ada.Float_Text_IO;

procedure lab_0 is
   
   I: Integer;
   S: String(1..5);
   C: Character;
   F: Float;
   
   Begin
      
      Put("Skriv in ett heltal: ");
      Get( I);
      Put ("Du skrev in talet: ");
      Put( I, Width =>0);
      Skip_Line;
      New_Line;
      
      Put("Skriv in fem heltal: ");
      Get(I);
      Put("Du skrev in talen: ");
      Put(I, Width =>0);
      Put(" ");
      Get(I);
      Put(I, Width =>0);
      Put(" ");
      Get(I);
      Put(I, Width =>0);
      Put(" ");
      Get(I);
      Put(I, Width =>0);
      Put(" ");
      Get(I);
      Put(I, Width =>0);
      Put(" ");
      Skip_Line;
      New_Line;
      
      Put("Skriv in ett flyttal: ");
      Get(F);
      Put("Du skrev in flyttalet: ");
      Put(F, Fore=>0, Aft => 3, Exp =>0);
      Skip_Line;
      New_Line;
      
      Put("Skriv in ett heltal och ett flyttal: ");
      Get(I);
      Get(F);
      Put("Du skrev in heltalet: ");
      Put(I, Width =>0);
      New_Line;
      Put("Du skrev in flyttalet: ");
      Put(F, Fore=>0, Aft => 6, Exp =>0);
      Skip_Line;
      New_Line;
      
      Put("Skriv in ett tecken: ");
      Get(C);
      Put("Du skrev in tecknet: ");
      Put(C);
      Skip_Line;
      New_Line;
      
      Put("Skriv en sträng med 5 tecken: ");
      Get(S);
      Put("Du skrev in strängen: ");
      Put(S);
      Skip_Line;
      New_Line;
      
      Put("Skriv en sträng med 3 tecken: ");
      Get(S(1..3));
      Put("Du skrev in strängen: ");
      Put(S(1..3));
      Skip_Line;
      New_Line; 
      
      Put("Skriv in ett heltal och sträng med 5 tecken: ");
      Get(I);
      Get(C);
      Get(S);
      Put("Du skrev in talet |");
      Put(I, Width =>0);
      Put("| och strängen |");
      Put(S(1..5));
      Put("|");
      Skip_Line;
      New_Line;
      
      Put("Skriv in en sträng med 3 tecken och ett flyttal: ");
      Get(S(1..3));
      Get(F);
      Put("Du skrev in " );
      Put('"');
      Put(F, Fore =>0, Aft => 3, Exp =>0);
      Put('"');
      Put(" och ");
      Put('"');
      Put(S(1..3));
      Put('"');
      
      
      
      

end lab_0;
   
