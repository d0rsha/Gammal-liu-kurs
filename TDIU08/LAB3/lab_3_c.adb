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
     array (1..6) of String_Type;
   
   type Array_Type_2 is
     array (1..8) of String_Type;
   
   type Species_Type is
      record
	 Species : Array_Type := (Char_Array =>('H','u','m','a','n'    , Others => ' '), Length => 5,
				  Char_Array =>('E','l','f'      , others => ' '), Length =>3,
				  Char_Array =>('O','r','c'      , others => ' '), Length =>3,
				  Char_Array =>('H','a','l','f','l','i','n','g' , others => ' '), Length =>8,
				  Char_Array =>('O','g','r','e'    , others => ' '), Length =>4,
				  Char_Array =>('L','i','z','a','r','d','m','a','n', others => ' '), Length =>9);
	 Chooice : String_Type; 
      end record;
   
   type Eye_Type is (Blue, Yellow, Green);
   
   type Eye_Type is
      record
	 Eye : Array_Type_2 := (Char_Array =>('B','l','u','e'  , others => ' '), Length =>4,
				Char_Array =>("Green ", others => ' '), Length =>5,
				Char_Array =>("Brown ", others => ' '), Length =>5,
				Char_Array =>("Gray  ", others => ' '), Length =>5, 
				Char_Array =>("Yellow", others => ' '), Length =>6,
				Char_Array =>("Red   ", others => ' '), Length =>3,
				Char_Array =>("Black ", others => ' '), Length =>5,
				Char_Array =>("Crazy ", others => ' '), Length =>5);
	 Chooice : String_type;
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
   ------------------------------------------------------------------
    Function "=" (Left : in String_Type;
		 Right : in String_Type) return Boolean  is
   begin
      if Left.Length = Right.Length then
	 --! Can't compare empty elements -- 
	 for I in Left.Char_Array'First..Left.Length loop
	    if not(Left.Char_Array(I) = Right.Char_Array(I)) then
	      return FALSE;
	    end if;
	 end loop;
	 return TRUE;
      else 
	 return FALSE;
      end if;
   end "=";
    ------------------------------------------------------------
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
	 
	 procedure Equal_String (Chooice : in out String_Type;
				 Items : in out Array_Type) is
	    Bool : Boolean;
	 begin
	    Bool := True;
	    while (Bool) loop
	       Get_String(Chooice);
	       for I in Array_Type'Range loop
		  if ( Chooice = Items(I)) then
		     Bool := false;
		  end if;	 
	       end loop;
	       Put("Error did not match any");
	    end loop;
	 end Equal_String;	  
	 procedure Equal_String (Chooice : in out String_Type;
				 Items : in out Array_Type_2) is
	    Bool : Boolean;
	 begin
	    Bool := True;
	    while (Bool) loop
	       Get_String(Chooice);
	       for I in Array_Type'Range loop
		  if ( Chooice = Items(I)) then
		     Bool := false;
		  end if;	 
	       end loop;
	       Put("Error did not match any");
	    end loop;
      end Equal_String;
	 
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
      Put("Choose species: ");
      Equal_String(Hero.Species.Chooice, Hero.Species.Species);
      Put("Choose eye color: ");
      Equal_String(Hero.Eye.Chooice, Hero.Eye.Eye);
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
      Put_String(Hero.Species.Chooice);
      New_Line;
      Put("Hero eye color: ");
      Put_String(Hero.Eye.Chooice);
      New_Line;
   end Put_Hero;
   
--   Species_List : Species_Type;
--   Eye_List : Eye_Type;
--   Hero1 : Hero_Type :=
--     (
--      Name => (Char_Array => ('a','n','d','e','r','s',
--			      others => ' '), Length => 6),
--      Age => 24,
--      Male => True,
--      Weight => 75.5,
--      HairColor => (Char_Array => ('b','r','o','w','n',
--				   others => ' '), Length => 5),
--      Species => (Species => Species_List.Species,
--		  Chooice => 1),
--      Eye => (Eye => Eye_List.Eye, Chooice => 4));
   
   
   Hero2 : Hero_Type;
begin
   Hero2.Name.Char_Array := ('d','o','r','s','h','a',others => ' ');
   Hero2.Name.Length := 6;
   Hero2.Age := 20;
   Hero2.Male := False;
   Hero2.Weight := 80.9;
   Hero2.HairColor.Char_Array := ('R','e','d', others => ' ');
 
--    Get_Hero(Hero1);
   Put_Hero(Hero2);
--   Put_Hero(Hero1);
   
   
end Lab_3_C;
