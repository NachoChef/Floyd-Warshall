generic
  type subscript is (<>);
  type myType is private;
package genericArray is
  type userDefinedArray is array(subscript range <>, subscript range <>) of myType;
end genericArray;
