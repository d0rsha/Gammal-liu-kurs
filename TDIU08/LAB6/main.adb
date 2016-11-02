with Sorted_List;use Sorted_List;
with Ada.Text_Io; use Ada.TexT_Io;
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
procedure Main is
   List:pointer;
   GetInt:Integer;
   GetInt2:Integer;
   outint:Integer;
begin
   
   Put_line("List program");
   loop
      Put_line("1: Empty");
      Put_line("2: Member");
      Put_line("3: Find_function");
      Put_line("4: Find_procedure");
      Put_line("5: Length");
      Put_Line("6: Put");
      Put_Line("7: Insert");
      Put_Line("8: Remove");
      Put("9: Delete     : ");
      Get(Getint);
     
      if Getint = 1 then
     if Empty(List) then
        Put_Line("List is empty");
     else
        Put_Line("List is not empty");
     end if;
     
      elsif Getint = 2 then
     Put("Enter your search key: ");
     Get(Getint2);
     if Member(List,Getint2) then
        Put_line("Found");
     else
        Put_Line("Not Found");
     end if;
     
      elsif Getint = 3 then
     Put("Enter your search key: ");
     Get(Getint2);
     Put("value ");
     Put(Find(List,Getint2),0);
     Put(" found");
     New_Line;
     
      elsif Getint = 4 then
     Put("Enter your search key: ");
     Get(Getint2);
     Find(List,Getint2,Outint);
     Put("value ");
     Put(Outint,0);
     Put(" found");
     New_Line;
     
      elsif Getint = 5 then
     Put("The length of the list is: ");
     Put(Length(List),0);
     New_Line;
     
      elsif Getint = 6 then
     Put_Line("The list:");
     Put(List);
     New_Line;
     
      elsif Getint = 7 then
     Put("Enter a value to add to list: ");
     Get(Getint2);
     Insert(List,Getint2);
     
      elsif Getint = 8 then
     Put("Enter a value to remove from the list: ");
     Get(Getint2);
     Remove(List,Getint2);
     
      elsif Getint = 9 then
     Delete(List);
     
      end if;
     
   end loop;
   
end Main;
