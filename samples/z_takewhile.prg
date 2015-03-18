#include "Prelude.hb"

Function Main()
	Local aLangs   := { "Portuguese", "English", "Spanish", "Turkish" ;
	                , "French", "Esperanto", "Chinese" }              ;
	    , bHigher6 := { |X| Len( X ) > 6 }

	@Each { { |X| qOut( X ) } ;
	      , @TakeWhile bHigher6 Of aLangs }
	Return