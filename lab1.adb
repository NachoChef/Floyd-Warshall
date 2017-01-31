WITH Ada.Text_IO; USE Ada.Text_IO;
WITH Ada.Integer_Text_IO; USE Ada.Integer_Text_IO;


PROCEDURE lab1 IS
   Size : Integer;
   
BEGIN
   --allocating & initializing the BMR in stack
   Get(Size);
   Get(myType);
   package myArrayType is new genericArray (Size, myType);
   use myArrayType;

END lab1;

PROCEDURE Warshall (arr : in out myArrayType) IS
BEGIN
   for i in arr'Range LOOP
      for j in arr'Range LOOP
         if A(j,i) THEN
            for k in arr'Range LOOP
               arr(j,k) := arr(j,k) OR arr(i,k);
            END LOOP;
         END LOOP;
      END LOOP;
   END LOOP;        
END Warshall;

generic
   type subscript is (<>);
package genericArray is
   type userDefinedArray is array(subscript range <>, subscript range <>) of Integer range 0..1;
end genericArray;
