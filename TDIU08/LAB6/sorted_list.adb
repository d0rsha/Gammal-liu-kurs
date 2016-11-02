with Ada.Text_Io;use Ada.Text_Io;

package body Sorted_List is
   
   procedure Free is
      new Ada.Unchecked_Deallocation(List_Type,Pointer);
   
   function Empty(List:in Pointer)return Boolean is
   begin
      return List = null;
   end Empty;
 
   
   procedure Put(List:in Pointer)is
   begin
      if Empty(List) then
     Put_line("(Put)List empty");
     return;
      else
     Put("Value: ");
     Put(List.Value,0);
     New_Line;
     if not (List.Next = null) then
        Put(List.Next);
     end if;
      end if;
   end Put;
   
   Function Length(List:in Pointer)return Integer is
   begin
      if Empty(List) then
     return 0;
      else
     return 1+Length(List.Next);
      end if;
   end Length;
 
   
   function Member(List:in Pointer;Key:in Integer)return Boolean is
   begin
      if Empty(List) then
     return False;
      elsif List.Value = Key then
     return True;
      else
     return Member(List.Next,key);
      end if;
   end Member;
   
   --  function Find(List:in Pointer;Key:in Integer;Index:in Integer)return Integer is
   --  begin
   --     if Empty(List) then
   --    raise NOT_FOUND with "FunctionFind";
   --     elsif Key = Index then
   --    return List.Value;
   --     else
   --    return Find(List.Next,Key,Index+1);
   --     end if;
   --  end Find;
   
   function Find(List:in Pointer;Key:in Integer)return Integer is
   begin
      if Empty(List) then
     raise NOT_FOUND with "FunctionFind";
      elsif Key = List.Value then
     return List.Value;
      else
     return Find(List.Next,Key);
      end if;
   end Find;
   
   procedure Find(List:in Pointer;Key:in Integer;Data:out Integer) is
   begin
      if Empty(List) then
     raise NOT_FOUND with "ProcedureFind";
      elsif Key = List.Value then
     Data := List.Value;
     return;
      else
     Find(List.Next,Key,Data);
      end if;
   end Find;
   
   procedure Insert(List:in out Pointer;New_Value:in Integer) is
      Tmp : Pointer;
   begin
      if Empty(List) then
     List := new List_Type'(New_Value, null);
     
      elsif New_Value < List.Value then
     Tmp := List;
     List := new List_Type'(New_Value, Tmp);
      elsif New_Value = List.Value then
     return;
      else
     Insert(List.Next, New_Value);
      end if;
   end Insert;
   
   procedure Remove(List:in out Pointer;Key:in Integer) is
      Temp:Pointer;
   begin
      if Empty(List) then
     raise NOT_FOUND with "ProcedureRemove";
      elsif Key = List.Value then
     if not (Empty(List.Next)) then
        Temp := List;
        List := List.Next;
        Free(Temp);
     else
        Free(List);
     end if;
      else
     Remove(List,Key);
      end if;
   end Remove;
   
   procedure Delete(List:in out Pointer) is
   begin
      while not (Empty(List.next)) loop
     Delete(List.next);
      end loop;
      Free(List);
   end Delete;
   
end Sorted_List;
