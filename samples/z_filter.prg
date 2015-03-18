#include "Prelude.hb"

Function Main()
	Local aLangList := { "Perl", "Haskell", "Java", "Erlang" ;
	                   , "Javascript", "Livescript", "C++" } ;
	    , bPrint     := { |Lang| qOut( Lang ) }              ;
	    , bBigName   := { |Lang| Len( Lang ) > 4 }

	@Each { bPrint, @Filter bBigName Of aLangList }
	Return