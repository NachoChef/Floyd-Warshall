with Ada.Sequential_IO; use Ada.Sequential_IO;
with warshallBMR;

procedure main is
   inFile, outFile : string(10);
begin
   put("Enter the name of the input file: "); get(inFile);
   put("Enter the name of the output file: "); get(outFile);
   type myBMR is new WarshallBMR(Integer, inFile, outFile);

end main;
