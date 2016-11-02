with Ada.Integer_TexT_Io; use Ada.Integer_Text_Io;
with Ada.Text_Io;use Ada.Integer_Text_Io;
with Ada.Unchecked_Deallocation;
package Sorted_List is
   type List_Type is private;
   type Pointer is private;
   
   function Empty(List: in pointer)return Boolean;
   function Member(List:in pointer;Key:in Integer)return Boolean;
   
   function Find(List:in pointer;Key:in Integer)return Integer; --plats in, data på plats ut
   procedure Find(List:in Pointer;Key: in Integer;Data:out integer);
   
   function Length(List:in pointer)return Integer;
   procedure Put(List:in pointer);
   
   procedure Insert(List:in out pointer;New_Value:in Integer);
   procedure Remove(List:in out pointer;Key:in Integer);
   procedure Delete(List:in out pointer);
   NOT_FOUND : exception;
private
   type Pointer is
     access List_Type;
   type List_Type is
      record
     Value:Integer := 5;
     Next:Pointer := null;
      end record;
end Sorted_List;
