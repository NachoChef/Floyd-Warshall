--Justin Jones
--COSC 3319.01 Spring 2017
--Lab 1
--
--'A' Option
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Sequential_IO;
with Ada.Unchecked_Conversion;

generic
   type label is private;
   with procedure myPut (outFile : File_Type; X : label);
   with function "OR" (X, Y : integer) return integer;
   with function eval (X : label) return integer;
package warshallBMR is
   type myBMR is array(Positive range <>, Positive range <>) of integer range 0..1;
   type myNames is array(Positive range <>) of label;
   procedure construct(infile, outfile : in string);
   procedure writeBMR(BMR : in myBMR; names : in myNames; file : string);
   procedure transitive_closure(BMR : in out myBMR);
   function getPos(nameArr : in myNames; val : in label) return integer;
   function check(nameArr : in myNames; item : in label; last : in integer) return Boolean;
   package label_IO is new Ada.Sequential_IO(label);
   use label_IO; 
end warshallBMR;
