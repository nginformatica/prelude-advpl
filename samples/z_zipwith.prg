#include "Prelude.hb"

Function Main()
	Local aFst      := @{ 1 .. 50 }     ;
	    , aSnd      := @{ 50 .. 100 }   ;
	    , bAdd      := { |X, Y| X + Y } ;
	    , bPrintNum := { |X| qOut( Str( X ) ) }

	@Each { bPrintNum, @ZipWith { bAdd, aFst, aSnd } }
	Return