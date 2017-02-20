package body Warshall is
   procedure transitive_closure (bmr : in out myBMR) is
   begin
      for i in 1..bmr'Length loop
         for j in 1..bmr'Length loop
            if bmr(j,i) then
               for k in 1..bmr'Length loop
                  bmr(j,k) := bmr(j,k) OR bmr(i,k);
               end loop;
            end if;
         end loop;
      end loop;
   end transitive_closure;
end Warshall;