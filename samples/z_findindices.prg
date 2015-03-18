#include "Prelude.hb"

Function Main()
	Local aSeq      := { "A", "AB", "ABC", "ABCD", "ABCDE" } ;
	    , bPrintNum := { |X| qOut( "Found: " + AllTrim( Str( X ) ) ) }

	@Each { bPrintNum, @FindIndices { { |Seq| "BC" $ Seq }, aSeq } }
	Return