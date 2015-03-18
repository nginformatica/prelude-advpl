#include "Prelude.hb"

Function Main()
	Local aNum      := @{ 1 .. 50 } ;
	    , bPrintNum := { |Num| qOut( Str( Num ) ) }

	@Each { bPrintNum, @Map { { |Num| Num * 3 }, aNum } }
	Return