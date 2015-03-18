#include "Prelude.hb"

Function Main()
	Local aGrades := { 7, 8, 5, 10 }

	qOut >>= Str In @Mean { aGrades }
	Return