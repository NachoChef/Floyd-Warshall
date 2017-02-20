generic
  type myType is private;
package genericArray is
  type userDefinedArray is array(Positive range <>, Positive range <>) of myType;
end genericArray;
