Procedure Insert(List : in out List_Type; 
		 New_Value : in Integer) is
   
   procedure Create(List: in out List_Type;
		    Current_element : in Integer) is
   Next_element : Integer;   
   begin
      if not(List.Next = null) then
	 Next_Element := List.Value;
	 List.Value := Current_Value;
	 Create(List.Next.all, Next_Element);
      else
	 Next := new List_Type'(Current_Element, List.Index + 1, null);
      end if;
   end Create;
   
begin
   if not(List.Next = null) then
      if New_Value < List.Next.Value and New_Value > List.Value Then
	 Create(List, New_Value);
      end if;
   elsif New_Value > List.Next.Value then
      Insert(List.Next, New_Value);
   else
      List.Next := new List_Type'(New_Value, 1, null);
   end if;
end Insert;

      
	 
	 
      
