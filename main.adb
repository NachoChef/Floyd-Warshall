with warshallBMR; 
with Ada.Text_IO; use Ada.Text_IO;

procedure main is   
begin
   declare
      subtype myString is String(1..10);
      package myStringBMR is new warshallBMR(myString);
      use myStringBMR;
      
      function "OR" (X, Y : integer) return integer is
      begin
         if x + y > 0 then
            return 1;
         else
            return 0;
         end if;
      end "OR";
   
      procedure myPut (outFile : File_Type; X : label) is
      begin
         put(outFile, X);
      end myPut;  
      
      
   begin
      myStringBMR.construct("input.txt", "output.txt");
   end; 
end main;
