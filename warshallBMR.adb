--Justin Jones
--COSC 3319.01 Spring 2017
--Lab 1
--
--'A' Option
with Ada.Text_IO; use Ada.Text_IO;

package body warshallBMR is  

   --retrieves position of a BMR label for BMR correlation
   --requires nameArr sorted in lexicographical order
   function map (nameArr : in myNames; val : in label) return integer is
   begin
      for loc in nameArr'Range loop
         if nameArr(loc) = val then
            return loc;
         end if;
      end loop;
      return 0;      --if item not found, will cause index check error
   end map;
   
   --writes BMR to file, name specified
   procedure writeBMR(BMR : in myBMR; names : in myNames; file : string) is
      outFile : Ada.Text_IO.File_Type;
   begin
      Create(outFile, out_file, file);
      --initial spacing for offset
      put(outFile, "     ");
      for k in 1..names'Length loop
         myPut(outFile, names(k));
      end loop;
      --manually inserting carriage return/line feed
      put(outFile, Character'Val(13) & Character'Val(10));   
      for i in 1..BMR'Length loop
         myPut(outFile, names(i));
         for j in 1..BMR'Length loop
            put(outFile, "   " & Integer'Image(bmr(i,j)));
         end loop;
         put(outFile, Character'Val(13) & Character'Val(10));
      end loop;
      Close(outFile);
   end writeBMR;
   
   --build BMR, compute transitive closure, write to outfile
   procedure construct(infile, outfile : in string) is
      inputFile : label_IO.File_Type;
      temp : label;
      size : integer;
   begin
      Open(inputFile, in_file, infile);
      Read(inputFile, temp);
      size := eval (temp);
      declare  
         names : myNames(1..size);
         bmr : myBMR(1..size, 1..size) := (others => (others => 0));
         temp1, temp2 : label;
      begin
         for i in names'Range loop
            Read (inputFile, temp1);
            names(i) := temp1;
         end loop;
         while not End_of_File (inputFile) loop
            Read (inputFile, temp1);
            Read (inputFile, temp2);
            bmr(map (names, temp1), map (names, temp2)) := 1;
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
                  bmr(j,k) := bmr(j,k) OR bmr(i,k);
               end loop;
            end if;
         end loop;
      end loop;
   end transitive_closure;
end warshallBMR;
