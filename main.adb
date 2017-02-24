with Ada.Sequential_IO; use Ada.Sequential_IO;
with warshallBMR;

procedure main is
   function "OR" (X, Y : integer) return integer is
   begin
      if x + y > 0 then
         return 1;
      else
         return 0;
      end if;
   end "OR";
begin
   declare
      package myBMR is new WarshallBMR("input.txt", "output.txt");
   begin
      
   end; 
end main;
