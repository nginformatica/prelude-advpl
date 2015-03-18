#include "Prelude.hb"

Function Main()
	Local aLangList := { "Perl", "Haskell", "Java", "Erlang" ;
	                   , "Javascript", "Livescript", "C++" } ;
	    , bPrint     := { |Lang| qOut( "    " + Lang ) }       ;
	    , bBigName   := { |Lang| Len( Lang ) > 4 }           ;
	    , aPartition := @Partition { bBigName, aLangList }

	@Each { { |X| qOut( "Bloco:" )     ;
	            , @Each bPrint Of X  } ;
	      , aPartition }
	Return