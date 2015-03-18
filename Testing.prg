#include "Prelude.hb"

Function Main()
	? AllTrim >>= Str In @Sum { @{ 1 .. 10 } }
	Return