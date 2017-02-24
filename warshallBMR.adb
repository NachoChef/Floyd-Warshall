--Justin Jones
--COSC 3319.01 Spring 2017
--Lab 1
--
--'A' Option

with Ada.Text_IO; use Ada.Text_IO;

package body warshallBMR is  

   --parses for unique names, returns true if item NOT in array
   function check(nameArr : in myNames; item : in label) return boolean is
   begin
      for loc in 1..nameArr'Length loop
         if nameArr(loc) = item then
            return false;
         end if;
      end loop;
      return true;
   end check;
   
   --insert name into array in lexicographical order
   procedure insert(nameArr : in out myNames; item : in label) is
   begin
      if nameArr'Length = 0 then
         nameArr(1) := item;
      else
         for loc in nameArr'Length..1 loop
            if item < nameArr(nameArr'Length..1) then
               nameArr(loc+1) := nameArr(loc);
            else
               nameArr(loc) := item;
            end if;
         end loop;
      end if;
   end insert;
   
   --retrieves position of a BMR label for BMR correlation
   function getPos(names : in myNames; val : in label) return integer is
      mid : integer := 1;
   begin
      if nameArr'Length = 0 then
        return mid;
      else
        mid := (nameArr'First + nameArr'Last) / 2;
        if nameArr(mid) = val then
           return mid;
        elsif nameArr(mid) > val then
           getPos(nameArr(nameArr'First..mid-1), val);
        else
           getPos(nameArr(mid+1..nameArr'Last), Val);
        end if;
     end if;
   end getPos;
   
   --writes BMR to file, name specified
   procedure writeBMR(BMR : in myBMR; names : in myNames; file : string) is
      outFile : File_Type;
   begin
      Create(outFile, file);
      myPut(outFile, " ");
      for k in 1..names'Length loop
         myPut(outFile, names(k));
      end loop;
      New_Line;   
      for i in 1..BMR'Length loop
         myPut(names(i), outFile);
         for j in 1..BMR'Length loop
            myPut(outFile, bmr(i,j));
         end loop;
         New_Line;
      end loop;
   end writeBMR;
   
   --build BMR
   procedure construct(BMR: out myBMR; file : string) is
      inputFile : File_Type;
      size : integer;
   begin
      Open(inputFile, file);
      Get(inputFile, size);
      declare
         names : myNames(1..size);
         bmr : myBMR(1..size, 1..size) := (others => 0);
         temp1, temp2 : label;
      begin
         Get(inputFile, temp1); 
         Get(inputFile, temp2);
            while not inputFile.End_of_File loop
               if check(names, temp1) then
                  insert(names, temp1);
               end if;
               if check(names, temp2) then
                  insert(names, temp1);
               end if;
               bmr(getPos(names, temp1),getPos(names, temp2)) := 1;
               Get(inputFile, temp1); Get(inputFile, temp2);
            end loop;
      end;
   end construct;
   
   --compute transitive closure with Floyd-Warshall's algorithm
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
