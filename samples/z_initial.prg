#include "Prelude.hb"

Function Main()
	Local aAlpha := { "A", "B", "C", "D", "E", "F" } ;
	    , bPrint := { |X| qOut( "Letter: " + X ) }

	@Each { bPrint, @Initial { aAlpha } }
	Return