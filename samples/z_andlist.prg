#include "Prelude.hb"

Function Main()
	Local aTrueList := { .T., .T., .T., .T. } ;
	    , lAllTrue  := @AndList { aTrueList }
	    
	? lAllTrue
	Return