#include "Prelude.hb"

Function Main()
	Local aList    := { .T., .F., .T., .F., .F. } ;
	    , aCompact := @Compact { aList }

	@Each { { |X| qOut( X ) }, aCompact }
	Return