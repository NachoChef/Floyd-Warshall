package Warshall is
   type myBMR is array(Positive range <>, Positive range <>) of boolean;
   procedure transitive_closure(BMR : in out myBMR);
end Warshall;