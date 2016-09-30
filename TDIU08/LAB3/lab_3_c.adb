with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

procedure Lab_3_C is
   
   type Char_Array_Type is
     array (1..257) of Character;
   
   type String_Type is
      record 
	 Char_Array : Char_Array_Type;
	 Length : Integer;
      end record;
   
   type Array_Type is
     array (1..6) of String(1..9);
   
   type Array_Type_2 is
     array (1..8) of String(1..6);
   
   type Species_Type is
      record
	 Species : Array_Type := ("Human    ", "Elf      ",
				  "Orc      ", "Halfling ",
				  "Ogre     ", "Lizardman");
	 Chooice : Integer; 
      end record;
   type Eye_Type is
      record
	 Eye : Array_Type_2 := ("Blue  ", "Green ",
				"Brown ", "Gray  ", 
				"Yellow", "Red   ",
				"Black ", "Crazy ");
	 Chooice : Integer;
      end record;
   	 
   type Hero_Type is
      record
	 Name : String_Type;
	 Age  : Integer;
	 Male : Boolean;
	 Weight : Float;
	 HairColor : String_Type;
	 Species : Species_Type;
	 Eye  : Eye_Type;
      end record;
   
   procedure Get_Hero (Hero : in out Hero_Type) is
      procedure Get_String (P : in out String_Type) is
	 I : Integer := P.Char_Array'First;
      begin
	 if End_Of_Line then
	    Skip_Line;
	 end if;
	 while (not End_Of_Line) loop
	    Get(P.Char_Array(I));
	    I := I + 1;   
	 end loop;
	 P.Length := I - 1;
	 Skip_Line;
      end Get_String;
      IntGet : Integer;
   begin
      Put_Line("Create your hero!");
      Put("Choose a name: ");
      Get_String(Hero.Name);
      Put("Choose a age: ");
      Get(Hero.Age);
      Put("Choose gender |1 = Female | 2 = Male |: ");
      Get(IntGet);
      if IntGet = 1 then
	 Hero.Male := False;
      else 
	 Hero.Male := True;
      end if;
      Put("Choose a weight: ");
      Get(Hero.Weight);
      Put("Choose hair color: ");
      Get_String(Hero.HairColor);
      
      for I in Hero.Species.Species'Range loop
	 Put(I, Width =>0);
	 Put(": "); Put(Hero.Species.Species(I));
	 New_Line;
      end loop;
      Put("Choose species: ");
      Get(Hero.Species.Chooice);
      for I in Hero.Eye.Eye'Range loop
	 Put(I, Width =>0);
	 Put(": "); Put(Hero.Eye.Eye(I));
	 New_Line;
      end loop;
      Put("Choose eye color: ");
      Get(Hero.Eye.Chooice);
   end Get_Hero;
   
   procedure Put_Hero (Hero : in out Hero_Type) is
      procedure Put_String (P : in String_Type) is
      begin
	 for I in P.Char_Array'First..P.Length loop
	    Put(P.Char_Array(I));
	 end loop;
      end Put_String;
      
   begin
      Put("Hero name: ");
      Put_String(Hero.Name);
      New_Line;
      Put("Hero age: ");
      Put(Hero.Age, Width =>0);
      New_Line;
      Put("Hero gender: ");
      if Hero.Male = True then
	 Put("male");
      else 
	 Put("female");
      end if;
      New_Line;
      Put("Hero weight: ");
      Put(Hero.Weight, 0,0,0);
      New_Line;
      Put("Hero haircolor: ");
      Put_String(Hero.HairColor);
      New_Line;
      Put("Hero specie: ");
      Put(Hero.Species.Species(Hero.Species.Chooice));
      New_Line;
      Put("Hero eye color: ");
      Put(Hero.Eye.Eye(Hero.Eye.Chooice));
      New_Line;
   end Put_Hero;
   
   Species_List : Species_Type;
   Eye_List : Eye_Type;
   Hero1 : Hero_Type :=
     (
      Name => (Char_Array => ('a','n','d','e','r','s',
			      others => ' '), Length => 6),
      Age => 24,
      Male => True,
      Weight => 75.5,
      HairColor => (Char_Array => ('b','r','o','w','n',
				   others => ' '), Length => 5),
      Species => (Species => Species_List.Species,
		  Chooice => 1),
      Eye => (Eye => Eye_List.Eye, Chooice => 4));
   
   
   Hero2 : Hero_Type;
begin
   Hero2.Name.Char_Array := ('d','o','r','s','h','a',others => ' ');
   Hero2.Name.Length := 6;
   Hero2.Age := 20;
   Hero2.Male := False;
   Hero2.Weight := 80.9;
   Hero2.HairColor.Char_Array := ('R','e','d', others => ' ');
   Hero2.HairColor.Length := 3;
   Hero2.Species.Chooice := 3;
   Hero2.Species.Chooice := 3;
    Get_Hero(Hero1);
   Put_Hero(Hero2);
   Put_Hero(Hero1);
   
   
end Lab_3_C;
