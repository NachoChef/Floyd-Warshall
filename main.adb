--Justin Jones
--COSC 3319.01 Spring 2017
--Lab 1
--
--'A' Option
with warshallBMR; 
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure main is   
begin
   declare
      --discrete subtype for generic
      subtype myString is String(1..3);
      
      function "OR" (X, Y : integer) return integer is
      begin
         if x + y > 0 then
            return 1;
         else
            return 0;
         end if;
      end "OR";
      
      --IO overload
      procedure myPut (outFile : File_Type; X : myString) is
      begin
         Ada.Text_IO.Put(File => outFile, Item => ("  " & X));
      end myPut;
      
      --parses integer out of generic
      function eval (X: myString) return integer is
      begin
         return Integer'Value(X);
      end eval;
  
      package myStringBMR is new warshallBMR(myString, myPut, "OR", eval);      
   begin
      myStringBMR.construct("a_input.txt", "a_output.txt");
   end; 
end main;
