#include "Prelude.hb"

Function Main()
	Local aOneToHund := @Range { 1, 100 } ;
	    , bPrintNum  := { |Num| qOut >>= Str In Num }

	@Each { bPrintNum, aOneToHund }
	Return