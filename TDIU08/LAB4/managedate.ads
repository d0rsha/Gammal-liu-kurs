with Ada.Integer_Text_Io; use Ada.IntegeR_Text_Io;
with Ada.TexT_Io; use Ada.Text_Io;
package Managedate is
   type Date is private;
   type String_Type is private;
   function Next_Date(Datumin:in Date) return Date;
   function Previous_Date(Datumin:in Date) return Date;
   function "<"(Leftdate:in Date;Rightdate:in Date) return Boolean;
   function ">"(Leftdate:in Date;Rightdate:in Date) return Boolean;
   function "="(Leftdate:in Date;Rightdate:in Date) return Boolean;
   function Year_Get(Date1:in Date) return Integer;
   function Month_Get(Date1:in Date) return Integer;
   function Day_Get(Date1:in Date) return Integer;
   procedure Get(Datum:out Date);
   procedure Put(Datum:in Date);
   procedure Find_Token(S : in String_Type;
			First : out Integer;
			Second : out Positive);
   Year_Error,Month_Error,Day_Error:exception;
private
   type Booldate_Type is (Year1, Month1, Day1);
   type Date is
     array (Booldate_Type'Range) of Integer;
   
   type Char_Array_Type is
     array (1..257) of Character;
   
   type String_Type is
      record 
	 Char_Array : Char_Array_Type;
	 Length : Integer;
      end record;
   
end Managedate;
