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

PROCEDURE Warshall (arr : in array(Positive range <>, Positive range <>) of Integer in 0..1) return array(Positive range <>, Positive range <>) of Integer in 0..1 IS
BEGIN
   for j in 1..Size loop
      for i in 1..Size loop
         for k in 1..Size loop
            arr[i,k] := arr[i,k] OR (arr[i,j] AND arr[j,k]);
         END LOOP;
      END LOOP;
   END LOOP;
   return arr;         
END Warshall;
