with warshallBMR;
generic 
   type inFile is private;
   type outFile is private;
   with function "OR" (X, Y : integer) return Boolean;
   type myBMR is array(Positive range <>, Positive range <>) of Integer range 0..1;
   type names is array(Positive range <>) of string;
package warshallBMR is
   procedure construct(BMR: out myBMR;
                       inFile, outFile : in string);
   procedure warshall(BMR : in out myBMR);
   procedure writeBMR(BMR : in myBMR);
   function Check(nameArr : in names; item : in string) return Boolean;
end warshallBMR;





