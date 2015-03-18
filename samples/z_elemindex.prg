#include "Prelude.hb"

Function Main()
	Local aList := { "Bar", "Foo", "Baz", "Far" } ;

	qOut >>= Str In ( @ElemIndex "Foo" Of aList )
	Return