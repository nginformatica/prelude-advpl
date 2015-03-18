#include "Prelude.hb"

Function Main()
	Local aAgeList  := { 20, 12, 87, 32 } ;
	    , bIsMinor  := { |Age| Age < 18 }
	    
	? @Any bIsMinor Of aAgeList
	Return