#include "prelude.ch"

Function Prelude()
   If @Validate<CEP> "88590-000"
   	Alert( "CEP VALIDO" )
   Else
   	Alert( "CEP INVALIDO" )
   EndIf
   Return 1