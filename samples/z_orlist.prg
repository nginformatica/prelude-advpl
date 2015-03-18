#include "Prelude.hb"

Function Main()
	Local aLogic    := { .T., .F., .T., .F. } ;
	    , lAnyTrue  := @OrList { aLogic }
	    
	? lAnyTrue
	Return