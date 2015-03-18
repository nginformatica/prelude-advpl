#include "Prelude.hb"

Function Main()
	Local aSeq := { "A", "AB", "ABC", "ABCD", "ABCDE" }

	? @Find { { |Seq| Len( Seq ) == 4 }, aSeq }
	Return