WITH Ada.Text_IO; USE Ada.Text_IO;
WITH Ada.Integer_Text_IO; USE Ada.Integer_Text_IO;


PROCEDURE lab1 IS
   Size : Integer;

   --generic instantiation
   TYPE BMR IS
      ARRAY (Integer RANGE <>, Integer RANGE <>) OF Integer RANGE 0..1;

BEGIN
   --allocating & initializing the BMR in stack
   Put("Enter the size of the BMR: "); Get(Size);
   DECLARE
      Arr : BMR(1..Size, 1..Size);
   BEGIN
      FOR I IN 1..Size LOOP
         FOR J IN 1..Size LOOP
               Arr (I, J) := 0;
         END LOOP;
      END LOOP;
   END;


END lab1;

PROCEDURE Warshall (arr : in out genericArray) IS
BEGIN
   for j in arr'Range loop
      for i in arr'Range loop
         for k in arr'Range loop
            arr[i,k] := arr[i,k] OR (arr[i,j] AND arr[j,k]);
            Put ("Value at arr " + myType'Image(i) + myType'Image(k) + " is " + myType'Image(arr[i,k]));
         END LOOP;
      END LOOP;
   END LOOP;        
END Warshall;

generic
   type subscript is (<>);
package genericArray is
   type userDefinedArray is array(subscript range <>, subscript range <>) of Integer range 0..1;
end genericArray;
