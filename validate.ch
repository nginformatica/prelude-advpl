/**
 * The MIT License (MIT)
 *
 * Copyright (c) 2015 NG Informática - TOTVS Software Partner
 * Author        Marcelo Camargo <marcelocamargo@linuxmail.org>
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

Package Validate(Version: 1) Where

	/**
	 * Validates a brazilian CEP
	 * @param String
	 * @return Bool
	 * @author Marcelo Camargo
	 */
	Validate Function CEP( cCEP )
		Local aCEP   := @Explode { cCEP } ;
		    , bValid := { |Elem, Index| ;
		      	IIf( Index == 6, .T., IsDigit( Elem ) ) ;
		      }

		If Len( aCEP ) <> 9 .Or. @ElemIndex { "-", aCEP } <> 6 ;
		   .Or. !@AndList { @MapIndex { bValid, aCEP } }

			Return .F.
		EndIf
		Return .T.

	/**
	 * Validates a brazilian CNPJ.
	 * @param String
	 * @return Bool
	 * @author Marcelo Camargo
	 */
	Validate Function CNPJ( cCNPJ )
		Local aFstCalc    := { 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2 } ;
			 , aSndCalc    := { 6 , 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2 } ;
		    , aCNPJ       := @Explode { cCNPJ }  ;
		    , aCNPJDigits := @Take { 12, aCNPJ } ;
		    , aFstZipped  := { } ;
		    , nSumValues  := 0   ;
		    , nRem

		aFstZipped := @ZipWith { { |X, Y| ;
			X * Y ;
		}, aFstCalc, @Map { { |Digit| Val( Digit ) }, aCNPJDigits } }

		nSumValues := @Sum { aFstZipped }
		nRem       := Int( nSumValues % 11 )

		If Val( aCNPJ[13] ) <> IIf( nRem < 2, 0, 11 - nRem )
			Return .F.
		EndIf

		aSndZipped := @ZipWith { { |X, Y| ;
			X * Y ;
		}, aSndCalc, @Take { 13, @Map { { |Digit| Val( Digit ) }, aCNPJ } } }

		nSumValues := @Sum { aSndZipped }
		nRem       := Int( nSumValues % 11 )

		If Val( aCNPJ[14] ) <> IIf( nRem < 2, 0, 11 - nRem )
			Return .F.
		EndIf
		Return .T.

	/**
	 * Validates a brazilian CPF.
	 * @param String
	 * @return Bool
	 * @author Marcelo Camargo
	 */
	Validate Function CPF( cCPF )
		Local aFstCalc   := @Reverse { @{ 2 .. 11 } } ;
		    , aCPF       := @Explode { cCPF }  ;
		    , aCPFDigits := @Take { 10, aCPF } ;
		    , aFstZipped := aSndZipped := { }  ;
		    , nSumValues := 0   ;
		    , nRem

		If Len( aFstCalc ) <> Len( aCPFDigits )
			Return .F.
		EndIf

		aFstZipped := @ZipWith { { |X, Y| ;
			X * Y ;
		}, @Tail { aFstCalc }, @Map { { |Digit| ;
		                         Val( Digit ) }, @Initial { aCPFDigits } } }

		nSumValues := @Sum { aFstZipped }
		nRem       := Int( nSumValues % 11 )

		If Val( aCPF[10] ) <> IIf( nRem < 2, 0, 11 - nRem )
			Return .F.
		EndIf

		aSndZipped := @ZipWith { { |X, Y| ;
			X * Y ;
		}, aFstCalc, @Map { { |Digit| Val( Digit ) }, aCPFDigits } }

		nSumValues := @Sum { aSndZipped }
		nRem       := Int( nSumValues % 11 )

		If Val( aCPF[11] ) <> IIf( nRem < 2, 0, 11 - nRem )
			Return .F.
		EndIf
		Return .T.

	/**
	 * Validates an-email.
	 * @param String
	 * @return Bool
	 * @author Marcelo Camargo
	 */
	Validate Function Email( cEmail )
		Local aEmail       := @Explode { cEmail } ;
		    , nIndexOfAt   := @ElemIndex "@" Of aEmail ;
		    , aEmailName   := @Slice { 1, nIndexOfAt - 1, aEmail } ;
		    , aEmailDomain := @Slice { nIndexOfAt + 1 , Len( aEmail ), aEmail } ;
		    , aDomainParts := @Split { ".", aEmailDomain } ;
		    , aIndicesOfAt := @ElemIndices "@" Of aEmail

		Local bIsValid := ;
			Fun ( Char ) -> Char $ "abcdefghijklmnopqrstuvwxyz.0123456789_-"

		// @SupressWarnings
		Z_ID( aEmail )
		Z_ID( nIndexOfAt )

		If Len( aIndicesOfAt ) <> 1 ;
			.Or. ( Len( aEmailName ) < 1 .Or. Len( aEmailDomain ) < 3 ) ;
			.Or. @ElemIndex { ".", aEmailDomain } == Nil ;
			.Or. !@AndList { @Map { bIsValid, aEmailName } } ;
			.Or. !@AndList { @Map { bIsValid, aEmailDomain } } ;
			.Or. Len( aDomainParts[ Len( aDomainParts) ] ) < 2

			Return .F.
		EndIf
		Return .T.

	/**
	 * Validates an even number.
	 * @param Number
	 * @return Bool
	 * @author Marcelo Camargo
	 */
	Validate Function Even( nNum )
		Return nNum % 2 == 0

	/**
	 * Validates a single name.
	 * @param String
	 * @return Bool
	 * @author Marcelo Camargo
	 */
	Validate Function Name( cName )
		Local aName := @Explode { cName } ;
		    , nI
		For nI := 1 To Len( aName )
			If !IsAlpha( aName[ nI ] ) .And. aName[ nI ] <> " "
				Return .F.
			EndIf
		Next nI
		Return .T.

	/**
	 * Validates a negative number.
	 * @param Number
	 * @return Bool
	 * @author Marcelo Camargo
	 */
	Validate Function Negative( nNum )
		Return nNum < 0

	/**
	 * Validates if a value is numeric.
	 * @param String
	 * @return Bool
	 * @author Marcelo Camargo
	 */
	Validate Function Number( cVal )
		Return IsDigit( cVal )

	/**
	 * Validates an odd number.
	 * @param Number
	 * @return Bool
	 * @author Marcelo Camargo
	 */
	Validate Function Odd( nNum )
		Return nNum % 2 <> 0

	/**
	 * Validates a positive number.
	 * @param Number
	 * @return Bool
	 * @author Marcelo Camargo
	 */
	Validate Function Positive( nNum )
		Return nNum > 0
