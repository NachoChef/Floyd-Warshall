--Justin Jones
--COSC 3319.01 Spring 2017
--Lab 1
--
--'A' Option
with Ada.Sequential_IO;
generic 
   type label is private;
   type elementType(<>) is private;
   with procedure put (X : label);
   with function "OR" (X, Y : integer) return Boolean;
package warshallBMR is
   type label_IO is new Ada.Sequential_IO(label);
   type myBMR is array(Positive range <>, Positive range <>) of integer;
   type myNames is array(Positive range <>) of label;
   procedure construct(BMR : out myBMR; file : string);
   procedure writeBMR(BMR : in myBMR; names : in myNames; file : string);
   procedure transitive_closure(BMR : in out myBMR);
   function check(nameArr : in myNames; item : in label) return Boolean;
end warshallBMR;
