generic
  type subscript is (<>);
  type myType is private;
  with function "OR" (X, Y : myType) return myType;
  with procedure Put(X : myType);
package genericArray is
  type userDefinedArray is array(subscript range <>, subscript range <>) of myType;
end genericArray;
