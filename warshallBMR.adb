--Justin Jones
--COSC 3319 Spring 2017
--Lab 1
--
--'A' Option



package body warshallBMR is  

   function check(nameArr : in myNames; item : in label) return Boolean is
   begin
      for loc in 1..nameArr'Length loop
         if nameArr(loc) = item then
            return false;
         end if;
      end loop;
      return true;
   end check;
   
   function getPos(names : in myNames; val : in label) return integer is
   begin
      for i in 1..names'Size loop
         if val = names(i) then
            return i;
         end if;
      end loop;
      return 0;
   end getPos;
   
   procedure writeBMR(BMR : in myBMR; names : in myNames; file : string) is
   begin
      put(" ");
      for k in 1..names'Length loop
         Write(names(k));
      end loop;
      New_Line;   
      for i in 1..BMR'Length loop
         Write(names(i));
         for j in 1..BMR'Length loop
            if BMR(i,j) = 1 then
               Write(0);
            else
               Write(1);
            end if;
         end loop;
         New_Line;
      end loop;
   end writeBMR;
   
   procedure construct(BMR: out myBMR; file : string) is
      inputFile : File_Type;
      size : integer;
   begin
      Open(inputFile, file);
      Get(size);
      declare
         names : myNames(1..size);
         bmr : myBMR(1..size, 1..size);
         temp1, temp2 : label;
         count : integer := 1;
      begin
         Get(inputFile, temp1); 
         jGet(inputFile, temp2);
            while not inputFile.End_of_File loop
               if check(names, temp1) then
                  names(count) := temp1;
                  count := count + 1;
               end if;
               if check(names, temp2) then
                  names(count) := temp2;
                  count := count + 1;
               end if;
               bmr(getPos(names, temp1),getPos(names, temp2)) := 1;
               Get(inputFile, temp1); Get(inputFile, temp2);
            end loop;
      end;
   end construct;
   
   procedure transitive_closure(bmr : in out myBMR) is
   begin
      for i in 1..bmr'Length loop
         for j in 1..bmr'Length loop
            if bmr(j,i) = 1 then
               for k in 1..bmr'Length loop
                  bmr(i,j) := bmr(j,k) OR bmr(i,k);
               end loop;
            end if;
         end loop;
      end loop;
   end transitive_closure;

end warshallBMR;
