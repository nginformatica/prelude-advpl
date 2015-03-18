#include "Prelude.hb"

Function Main()
	Local aSeq := { "A", "AB", "ABC", "ABCD", "ABCDE" }

	qOut >>= Str In @FindIndex { { |Seq| Len( Seq ) == 4 }, aSeq }
	Return