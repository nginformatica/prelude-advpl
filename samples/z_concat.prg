#include "Prelude.hb"

Function Main()
	Local aList     := { { 1, 2 }, { 3, 4, 5 }, { 6 } } ;
	    , aConcat   := @Concat { aList }                ;
	    , bPrintNum := { |N| qOut >>= Str In N }
	    
	@Each aConcat ::= bPrintNum
	Return