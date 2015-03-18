#include "Prelude.hb"

Function Main()
	Local aList  := { "Bar", "Foo", "Baz", "Far", "Foo", "Foo" } ;
	    , bPrint := { |Name| qOut( Name ) }

	@Each { bPrint, @ElemIndices "Foo" Of aList }
	Return