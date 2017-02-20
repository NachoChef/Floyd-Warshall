with Ada.Sequential_IO; use Ada.Sequential_IO;
with warshallBMR;

procedure main is
   inFile, outFile : string(10);
begin
   type myBMR is new WarshallBMR(Integer, inFile, outFile);

end main;
