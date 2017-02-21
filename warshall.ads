package Warshall is
   type elementType is private;
   type myBMR is array(Positive range <>, Positive range <>) of boolean;
   procedure transitive_closure(BMR : in out myBMR);
end Warshall;