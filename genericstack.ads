generic
  max:integer;
  type item is private;
package genericstack is
   procedure push(x: in item);
   procedure pop(x: out item);
   function isEmpty return Boolean;
end genericstack;
