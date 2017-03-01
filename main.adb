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
      --discrete subtypes for generic instantiation
      subtype myString is String(1..3);
      subtype myChar is Character;
      subtype myInt is Integer;
      
      --overload for bmr elements (0 or 1)
      function "OR" (X, Y : integer) return integer is
      begin
         if x + y > 0 then
            return 1;
         else
            return 0;
         end if;
      end "OR";
      
      --IO overload for string
      procedure myPut (outFile : File_Type; X : myString) is
      begin
         Ada.Text_IO.Put(File => outFile, Item => ("  " & X)); --output formatting is done here
      end myPut;
      
      --IO overload for character
      procedure myPut (outFile : File_Type; X : myChar) is
      begin
         Ada.Text_IO.Put(File => outFile, Item => ("    " & X));
      end myPut;
      
      --IO overload for integer
      procedure myPut (outFile : File_Type; X : myInt) is
      begin
         Ada.Text_IO.Put(File => outFile, Item => ("    " & Integer'Image(X)));
      end myPut;
      
      --parses integer out of string for generic
      function eval (X: myString) return integer is
      begin
         return Integer'Value(X);
      end eval;
      
      --parses integer out of character for generic
      function eval (X : myChar) return integer is
      begin
         return Character'Pos(X) - 48;
      end eval;
      
      --returns integer (unnecessary but required for generic instantiation)
      function eval (X : myInt) return integer is
      begin
         return X;
      end eval;
  
      --instantiation
      package myStringBMR is new warshallBMR (myString, myPut, "OR", eval);    
      package myCharBMR is new warshallBMR (myChar, myPut, "OR", eval);  
      package myIntBMR is new warshallBMR (myInt, myPut, "OR", eval);
   begin
      myStringBMR.construct("a_input1.txt", "a_output.txt");
      myIntBMR.construct("a_input2.txt", "a_output2.txt");
      myCharBMR.construct("b_input.txt", "b_output.txt");
      myCharBMR.construct("c_input.txt", "c_output.txt");
   end; 
end main;
