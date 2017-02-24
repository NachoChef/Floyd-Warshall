--Justin Jones
--COSC 3319.01 Spring 2017
--Lab 1
--
--'A' Option

generic
   type label is private;
   with procedure myPut (X : label);
   with function "OR" (X, Y : integer) return integer;
package warshallBMR is
   type myBMR is array(Positive range <>, Positive range <>) of integer range 0..1;
   type myNames is array(Positive range <>) of label;
   procedure construct(BMR : out myBMR; file : string);
   procedure writeBMR(BMR : in myBMR; names : in myNames; file : string);
   procedure transitive_closure(BMR : in out myBMR);
   procedure insert(nameArr : in out myNames; item : in label);
   function check(nameArr : in myNames; item : in label) return Boolean;
end warshallBMR;
