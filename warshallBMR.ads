with warshallBMR;
generic
   type arrayElement is private;
   type inFile is (<>);
   type outFile is (<>);
   with function "OR" (X, Y : arrayElement) return Boolean;
package warshallBMR is
   procedure construct(BMR: out array(range <>, range <>) of arrayElement;
                       inFile, outFile : in string(10));
   procedure warshall(BMR : in out array(range <>, range <>) of arrayElement);
   procedure writeBMR(BMR : in out array(range <>, range <>) of arrayElement);
end warshallBMR;





