with warshallBMR; 
with Ada.Text_IO; use Ada.Text_IO;

procedure main is   
begin
   
   declare
      function "OR" (X, Y : integer) return integer is
      begin
         if x + y > 0 then
            return 1;
         else
            return 0;
         end if;
      end "OR";
   
      subtype myString is String(1..10);
      
      procedure myPut (outFile : File_Type; X : myStringBMR.label) is
      begin
         Ada.Text_IO.Write(File => outFile, Item => X);
      end myPut; 
       
      
      package myStringBMR is new warshallBMR(myString, myPut, "OR");
      use myStringBMR;
      
   begin
      myStringBMR.construct("input.txt", "output.txt");
   end; 
end main;
