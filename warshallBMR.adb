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
            if to_int(item) < to_int (nameArr(loc)) then
               nameArr(loc+1) := nameArr(loc);
            else
               nameArr(loc) := item;
            end if;
         end loop;
      end if;
   end insert;
   
   --retrieves position of a BMR label for BMR correlation
   procedure getPos(nameArr : in myNames; val : in label; pos : out integer) is
      mid : integer := 1;
   begin
      if nameArr'Length = 0 then
        pos := 1;
      else
        mid := (nameArr'First + nameArr'Last) / 2;
        if to_int (nameArr(mid)) = to_int(val) then
           pos := mid;
        elsif to_int (nameArr(mid)) > to_int (val) then
           getPos(nameArr(nameArr'First..mid-1), val, pos);
        else
           getPos(nameArr(mid+1..nameArr'Last), Val, pos);
        end if;
     end if;
   end getPos;
   
   --writes BMR to file, name specified
   procedure writeBMR(BMR : in myBMR; names : in myNames; file : string) is
      outFile : Ada.Text_IO.File_Type;
   begin
      Create(outFile, out_file, file);
      put(outFile, " ");
      for k in 1..names'Length loop
         myPut(outFile, names(k));
      end loop;
      New_Line;   
      for i in 1..BMR'Length loop
         myPut(outFile, names(i));
         for j in 1..BMR'Length loop
            put(outFile, Integer'Image(bmr(i,j)));
         end loop;
         New_Line;
      end loop;
      Close(outFile);
   end writeBMR;
   
   --build BMR, compute transitive closure, write to outfile
   procedure construct(infile, outfile : in string) is
      inputFile : label_IO.File_Type;
      size : label;
   begin
      Open(inputFile, in_file, infile);
      Read(inputFile, size);
      declare
         names : myNames(1..eval(size));
         bmr : myBMR(1..eval(size), 1..eval(size)) := (others => (others => 0));
         temp1, temp2 : label;
         pos1, pos2 : integer;
      begin
         Read(inputFile, temp1); 
         Read(inputFile, temp2);            
         while not End_of_File(inputFile) loop
            if check(names, temp1) then
               insert(names, temp1);
            end if;
            if check(names, temp2) then
               insert(names, temp1);
            end if;
            getPos(names, temp1, pos1);
            getPos(names, temp2, pos2);
            bmr(pos1, pos2) := 1;
            Read(inputFile, temp1);
            Read(inputFile, temp2);
            end loop;
      Close(inputFile);
      transitive_closure(bmr);
      writeBMR(bmr, names, outfile);
      exception
         when label_IO.Name_Error =>
            Ada.Text_IO.Put_Line("File does not exist.");
            raise;
         when label_IO.End_Error =>
            Close(inputFile);
            Ada.Text_IO.Put("File is missing part of a relation.");
            raise;
         when others =>
            Close(inputFile);
            raise;
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
