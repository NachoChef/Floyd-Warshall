--Justin Jones
--COSC 3319.01 Spring 2017
--Lab 1
--
--'A' Option
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
   
      subtype myString is String(1..3);
      
      procedure myPut (outFile : File_Type; X : myString) is
      begin
         Ada.Text_IO.Put(File => outFile, Item => X);
      end myPut; 
      
      function eval (X: myString) return integer is
         temp : integer;
      begin
         temp := Character'Pos(X(1)) - 48;
         return temp;
      end eval;

      package myStringBMR is new warshallBMR(myString, myPut, "OR", eval);
      use myStringBMR;
      
   begin
      myStringBMR.construct("a_input.txt", "a_output.txt");
   end; 
end main;
