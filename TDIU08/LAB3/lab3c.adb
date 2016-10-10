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
   
   type Species_Bool_Type is (Human, Elf, Orc, Halfling, Ogre, Lizardman);
   type Eye_Bool_Type is (Blue, Green, Brown, Gray, Yellow, Red, Black, Crazy);
   type Species_Type is
      record
	 Species : Array_Type := ("Human    ", "Elf      ",
				  "Orc      ", "Halfling ",
				  "Ogre     ", "Lizardman");
	 Chooice : Species_Bool_Type; 
      end record;
   type Eye_Type is
      record
	 Eye : Array_Type_2 := ("Blue  ", "Green ",
				"Brown ", "Gray  ", 
				"Yellow", "Red   ",
				"Black ", "Crazy ");
	 Chooice : Eye_Bool_Type;
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
      
   --   procedure Get_Species (Bool : in out Species_Bool_Type) is
--	 IntGet : Integer;
  --    begin
	
    --  end Get_Species;
      
 --     procedure Get_Eye (Bool  
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
      Put_Line("--------------");
      for I in Hero.Species.Species'Range loop
	 Put(I, Width =>0);
	 Put(": "); Put(Hero.Species.Species(I));
	 New_Line;
      end loop;
      Put("Choose species: ");
       Get(IntGet);
	 if IntGet = 1 then
	 Hero.Species.Chooice := Human;
      elsif IntGet = 2 then
	 Hero.Species.Chooice := Elf;
      elsif IntGet = 3 then
	 Hero.Species.Chooice := Orc;
      elsif IntGet = 4 then
	 Hero.Species.Chooice := Halfling;
      elsif IntGet =5 then
	 Hero.Species.Chooice := Ogre;
      elsif IntGet = 6 then
	 Hero.Species.Chooice := Lizardman;
	 end if;
	 Put_Line("--------------");
	 
      for I in Hero.Eye.Eye'Range loop
	 Put(I, Width =>0);
	 Put(": "); Put(Hero.Eye.Eye(I));
	 New_Line;
      end loop;
      Put("Choose eye color: ");
      Get(IntGet);
      if IntGet = 1 then
	 Hero.Eye.Chooice := Blue;
      elsif IntGet = 2 then
	 Hero.Eye.Chooice := Green;
      elsif IntGet = 3 then
	 Hero.Eye.Chooice := Brown;
      elsif IntGet = 4 then
	 Hero.Eye.Chooice := Gray;
      elsif IntGet = 5 then
	 Hero.Eye.Chooice := Yellow;
      elsif IntGet = 6 then
	 Hero.Eye.Chooice := Red;
      elsif IntGet = 7 then
	 Hero.Eye.Chooice := Black;
      elsif IntGet =8 then
	 Hero.Eye.Chooice := Crazy;
      end if;
      
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
       if Hero.Species.Chooice = Human then
	 Put_Line("Human");
      elsif Hero.Species.Chooice = Elf then
	 Put_Line("Elf");
      elsif Hero.Species.Chooice = Orc then
	 Put_Line("Orc");
      elsif Hero.Species.Chooice = Halfling then
	 Put_Line("Halfling");
      elsif Hero.Species.Chooice = Ogre then
	 Put_Line("Ogre");
      elsif Hero.Species.Chooice = Lizardman then
	 Put_Line("Lizardman");
       end if;
       Put("Hero eye color: ");
       if Hero.Eye.Chooice = Blue then
	  Put_Line("Blue");
      elsif Hero.Eye.Chooice = Green then
	 Put_Line("Green");
      elsif Hero.Eye.Chooice = Brown then
	 Put_Line("Brown");
      elsif Hero.Eye.Chooice = Gray then
	 Put_Line("Gray");
      elsif Hero.Eye.Chooice = Yellow then
	 Put_Line("Yellow");
      elsif Hero.Eye.Chooice = Red then
	 Put_Line("Red");
      elsif Hero.Eye.Chooice = Black then
	 Put_Line("Black");
      elsif Hero.Eye.Chooice = Crazy then
	 Put_Line("Crazy");
      end if;
   end Put_Hero;
   
   Species_List : Species_Type;
   Eye_List : Eye_Type;
   Hero2 : Hero_Type :=
     (
      Name => (Char_Array => ('a','n','d','e','r','s',
			      others => ' '), Length => 6),
      Age => 24,
      Male => True,
      Weight => 75.5,
      HairColor => (Char_Array => ('b','r','o','w','n',
				   others => ' '), Length => 5),
      Species => (Species => Species_List.Species,
		  Chooice => Orc),
      Eye => (Eye => Eye_List.Eye, Chooice => Blue));
  Hero1 : Hero_Type;
begin
   Get_Hero(Hero1);
   Put_Hero(Hero1);
   Put_Line("-----------");
   Put_Hero(Hero2);
   
   
end Lab_3_C;
