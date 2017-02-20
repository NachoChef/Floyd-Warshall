with Ada.Text_IO, Ada.Integer_Text_IO; use Ada.Text_IO, Ada.Integer_Text_IO;


procedure warshall is
   type myBMR is array(Positive range <>, Positive range <>) of boolean;
   type myNames is array(Positive range <>) of character;
   size : integer;
   function check (arr : in myNames; val : in character) return boolean is
      temp : boolean := true;
   begin
      for loc in 1..arr'Length loop
         if arr(loc) = val then
            temp := false;
         end if;
      end loop;
      return temp;
   end check;
   
   procedure warshall (bmr : in out myBMR) is
   begin
      for i in 1..bmr'Length loop
         for j in 1..bmr'Length loop
            if bmr(j,i) then
               for k in 1..bmr'Length loop
                  bmr(j,k) := bmr(j,k) OR bmr(i,k);
               end loop;
            end if;
         end loop;
      end loop;
   end warshall;
   
   function getPos (names : in myNames; val : in character) return integer is
   begin
      for i in 1..names'Size loop
         if val = names(i) then
            return i;
         end if;
      end loop;
      return 0;
   end getPos;
   
   procedure print(BMR : in myBMR; names : in myNames) is
   begin
      put(" ");
      for k in 1..names'Length loop
         put("          " & names(k));
      end loop;
      New_Line;   
      for i in 1..BMR'Length loop
         Put(names(i));
         for j in 1..BMR'Length loop
            if BMR(i,j) = false then
               Put(0);
            else
               Put(1);
            end if;
         end loop;
         New_Line;
      end loop;
   end print;
   
begin
   Put("Enter the size of the BMR: "); Get(size);
   
   declare
      names : myNames(1..size);
      BMR : myBMR(1..size, 1..size);
      
      temp1, temp2 : character;
      count : integer := 1;

   begin
      for i in 1..BMR'Length loop
         for j in 1..BMR'Length loop
            BMR(i,j) := false;
         end loop;
      end loop;
         
      Get(temp1); Get(temp2);
      while temp1 /= 'x' or temp2 /= 'x' loop
         if check(names, temp1) then
            names(count) := temp1;
            count := count + 1;
         end if;
         if check(names, temp2) then
            names(count) := temp2;
            count := count + 1;
         end if;
         BMR(getPos(names, temp1),getPos(names, temp2)) := true;
         Get(temp1); Get(temp2);
      end loop;
      
      New_Line;
      warshall(BMR);
      print(BMR, names);
      
   end;
end warshall;
         
   