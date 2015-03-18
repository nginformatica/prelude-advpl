#include "Prelude.hb"

Function Main()
	Local aList     := { "Lorem", "Ipsum", "Dolor", "Sit" } ;
       , bIsGreat  := { |X| Len( X ) > 4 }                 ;
       , lAllGreat := @All { bIsGreat, aList }
       
   ? lAllGreat
   Return