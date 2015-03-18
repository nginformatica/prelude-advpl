#include "Prelude.hb"

Function Main()
	aYears := { 64, 14, 73, 32, 22, 21, 18, 14 }

	qOut >>= Str In @Maximum { aYears }
	Return