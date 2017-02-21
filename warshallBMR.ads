--Justin Jones
--COSC 3319.01 Spring 2017
--Lab 1
--
--'A' Option
with Warshall; use Warshall;
generic 
   type subscript is private;
   type elementType is private;
   with function "OR" (X, Y : elementType) return Boolean;
   with function "AND" (X, Y : elementType) return Boolean;
package warshallBMR is
   type myBMR is array(Positive range <>, Positive range <>) of elementType;
   type myNames is array(Positive range <>) of subscript;
   procedure construct(BMR: out myBMR);
   procedure writeBMR(BMR : in myBMR; file : string);
   function Check(nameArr : in myNames; item : in subscript) return Boolean;
end warshallBMR;





