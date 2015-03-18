#include "Prelude.hb"

Function Main()
	Local aNumList  := @StepRange { 1, 100, 3 } ;
	    , bPrintNum := { |Num| qOut >>= Str In Num }

	@Each { bPrintNum, aNumList }
	Return