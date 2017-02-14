--close files

package body warshallBMR is
   procedure construct(BMR: out array(range <>, range <>) of arrayElement;
                     inFile, outFile : in string(10)) is
      input, output : File_Type;
      size : integer;
   begin
      Open(input, inFile);
      Get(input, size);
      declare
         nameArray : array(size) of String(10);
         temp : String(10);
         count : Integer := 1;
         type relationArray is
            record
               from : string(10);
               to : string(10);
            end record;
         relation : relationArray;
         type mySubscripts is private;
      begin
         myStack is new genericstack(max  => 100,
                                  item => relationArray);
         use myStack;
         while not End_Of_File(input) loop
            Get(input, temp);
            if Check(nameArray,temp) then    --if haven't seen name, save
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
            push(relation);                  --push so we can build later
         end loop;                           --do this until done with file
      --begin to build BMR
         type mySubscripts is names'first..names'last;
         BMR : array(mySubscripts, mySubscripts) of arrayElement;
      --initialize array
         for i in range 1..BMR'Size loop
            for j in range 1..BMR'Size loop
               BMR(i)(j) := 0;
            end loop;
         end loop;

         while myStack.top > 1 loop
            relation := pop(myStack);
            BMR(relation.from)(relation.to) := 1;
         end loop;
         warshall(BMR);
         writeBMR(BMR);
      end;
   end construct;

   procedure warshall(BMR : in out array(range <>, range <>) of arrayElement) is
   begin
      for i in 1..BMR'Size loop
         for j in 1..BMR'Size loop
            if A(i,j) then
               for k in 1..BMR'Size loop
                  A(j,k) := A(j,k) OR A(i,k);
               end loop;
            end if;
         end loop;
      end loop;
   end warshall;

   procedure writeBMR(BMR : in out array(range <>, range <>) of arrayElement) is
      output : File_Type;
   begin
      Open(output, outFile);

end warshallBMR;
