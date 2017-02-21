--Justin Jones
--COSC 3319 Spring 2017
--Lab 1
--
--'A' Option

package body warshallBMR is  
   function Check(nameArr : in myNames; item : in subscript) return boolean is
   begin
      for loc in 1..nameArr'Length loop
         if nameArr(loc) = item then
            return false;
         end if;
      end loop;
      return true;
   end check;
   
   function getPos (names : in myNames; val : in subscript) return integer is
   begin
      for i in 1..names'Size loop
         if val = names(i) then
            return i;
         end if;
      end loop;
      return 0;
   end getPos;
   
   procedure writeBMR(BMR : in myBMR; names : in myNames) is
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
   end writeBMR;
   
   procedure construct(BMR: out myBMR) is
   begin
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
   end construct;   

end warshallBMR;
