#include "Prelude.hb"
#define NAME 1
#define AGE      2

Function Main()
	Local aNames   := { "John", "Goslin", "Stallman", "MCGyver" } ;
	    , aAges    := {   23 ,     54   ,     65    ,     34    } ;
	    , aTable   := @Zip { aNames, aAges }                      ;
	    , bOutUser := { |User| ;
	    	qOut( "   Name: " + User[ NAME ] +       ;
	    	      "|  Age: " + Str( User[ AGE ] ) )  ;
	    }

	@Each aTable ::= bOutUser
	Return