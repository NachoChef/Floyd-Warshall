--Justin Jones
--COSC 3319 Spring 17
--Lab 1

package body warshallBMR is
   type inFile is private;
   type outFile is private;   
   function Check (nameArr : in names; item : in string) return boolean is
   temp : boolean := true;
   begin
      for i in 1..nameArr'Size loop
         if nameArr(i) = item then
            temp := false;
         end if;
      end loop;
      return temp;
   end Check; 
   
   procedure construct(BMR: out myBMR) is
      input, output : File_Type;
      size : integer;
   begin
      Open(input, inFile);
      Get(input, size);
      declare
         NameArray : array(1..Size) of String(10);
         BMR : array(1..size, 1..size) of integer range 0..1 := (others => 0); 
         temp : String(10);
         count : Integer := 1;
         type relRec is       --this is to keep the relations temporarily organized before use
            record
               from : string(10);
               to : string(10);
            end record;
         relation : relRec;
      begin
         while not End_Of_File(input) loop
            Get(input, temp);
            if Check(nameArray,temp) then    --if haven't seen name, save to name array
               nameArray(count) := temp;
               count := count + 1;
            end if;
            relation.from := temp;           --set relation 'from'
            Get(input, temp);
            if Check(nameArray,temp) then
               nameArray(count) := temp;
               count := count + 1;
            end if;
            relation.to := temp;             --set relation 'to'
            BMR(relation.from)(relation.to) := 1; --1 => true
         end loop;                           --do this until done with file
         --array should now be populated, so we close the file
         Close(input);
      end;
   end construct;

   procedure warshall(BMR : in out myBMR) is
   begin
      for i in 1..BMR'Size loop
         for j in 1..BMR'Size loop
            if A(i,j) > 0 then   --'false' is interpreted as 0, so this works for integer & bool
               for k in 1..BMR'Size loop
                  A(j,k) := A(j,k) OR A(i,k);
               end loop;
            end if;
         end loop;
      end loop;
   end warshall;

   procedure writeBMR(BMR : in myBMR) is
      output : File_Type;
   begin
      Open(output, outFile);
      for row in BMR'Size loop
         for col in BMR'Size loop
            Put(BMR(row)(col));
         end loop;
         New_Line;
      end loop;
    end writeBMR;
      

end warshallBMR;
