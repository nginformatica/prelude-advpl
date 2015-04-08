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

#include "SyntaxAbstraction.ch"

/**
 * Returns true if all the items in the list are true when applied to the test.
 * @param Block
 * @param Array
 * @return Bool
 * @author Marcelo Camargo
 */
Prelude Function All( bBlock, aList )
	Local nI
	For nI := 1 To Len( aList )
		If !Eval( bBlock, aList[ nI ] )
			Return .F.
		EndIf
	Next nI
	Return .T.

/**
 * Returns false if any item in the list is false, otherwise returns true.
 * @param Array
 * @return Bool
 * @author Marcelo Camargo
 */
Prelude Function AndList( aList )
	Local nI
	For nI := 1 To Len( aList )
		If !aList[ nI ]
			Return .F.
		EndIf
	Next nI
	Return .T.

/**
 * Returns true if any of the items in the list are true when applied to the
 * test.
 * @param Block
 * @param Array
 * @return Bool
 * @author Marcelo Camargo
 */
Prelude Function Any( bBlock, aList )
	Local nI
	For nI := 1 To Len( aList )
		If Eval( bBlock, aList[ nI ] )
			Return .T.
		EndIf
	Next nI
	Return .F.

/**
 * Returns a new list which contains only the truthy values of the inputted.
 * @param Array
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function Compact( aList )
	@BUILD ACCUMULATOR aAccum
	For nI := 1 To Len( aList )
		If aList[ nI ]
			aAdd( aAccum, aList[ nI ] )
		EndIf
	Next nI
	Return aAccum

/**
 * Concatenates a list of lists together
 * @param Array
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function Concat( aList )
	Local aAccum := { } ;
	    , nI, nJ
	For nI := 1 To Len( aList )
		For nJ := 1 To Len( aList[ nI ] )
			aAdd( aAccum, aList[ nI ][ nJ ] )
		Next nJ
	Next nI
	Return aAccum

/**
 * Applies a function to each item in the list and returns the original list.
 * Used for side effects.
 * Length as the input.
 * @param Block
 * @param Array
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function Each( bBlock, aList )
	Local nI
	For nI := 1 To Len( aList )
		Eval( bBlock, aList[ nI ] )
	Next nI
	Return aList

/**
 * Almost the same as each, but applies with two parameters, both item and 
 * index. This is useful when you really need to know the position which the
 * element is on.
 * @param Block
 * @param Array
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function EachIndex( bBlock, aList )
	Local nI
	For nI := 1 To Len( aList )
		Eval( bBlock, aList[ nI ], nI )
	Next nI
	Return aList

/**
 * Returns the index of the first occurrence of the supplied element in the
 * list. Returns undefined if the element is not found.
 * @param Mixed
 * @param Array
 * @return Number
 * @author Marcelo Camargo
 */
Prelude Function ElemIndex( xElem, aList )
	Local nI
	For nI := 1 To Len( aList )
		If aList[ nI ] == xElem
			Return nI
		EndIf
	Next nI
	Return Nil

/**
 * Returns an array of all the indices of the supplied element in the list.
 * Returns an empty list if the element is not found at all.
 * @param Mixed
 * @param Array
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function ElemIndices( xElem, aList )
	@BUILD ACCUMULATOR aAccum
	For nI := 1 To Len( aList )
		If aList[ nI ] == xElem
			aAdd( aAccum, nI )
		EndIf
	Next nI
	Return aAccum

/**
 * Is the element empty?
 * @param xElem
 * @return Bool
 * @author Marcelo Camargo
 */
Prelude Function Empty( xElem )
	Return Empty( xElem )


/**
 * Is the number even?
 * @param Number
 * @return Bool
 * @author Marcelo Camargo
 */
Prelude Function Even( nA )
	Return nA % 2 == 0

/**
 * Converts a string for an array.
 * @param String
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function Explode( cStr )
	@BUILD ACCUMULATOR aAccum
	For nI := 1 To Len( cStr )
		aAdd( aAccum, SubStr( cStr, nI, 1 ) )
	Next nI
	Return aAccum

/**
 * Returns a new list composed of the items which pass the supplied function's
 * test.
 * @param Block
 * @param Array
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function Filter( bBlock, aList )
	@BUILD ACCUMULATOR aAccum
	For nI := 1 To Len( aList )
		If Eval( bBlock, aList[ nI ] )
			aAdd( aAccum, aList[ nI ] )
		EndIf
	Next nI
	Return aAccum

/**
 * Returns the first item in list to pass the function's test. Returns undefined
 * if all items fail the test.
 * @param Block
 * @param Array
 * @return Mixed
 * @author Marcelo Camargo
 */
Prelude Function Find( bBlock, aList )
	Local nI
	For nI := 1 To Len( aList )
		If Eval( bBlock, aList[ nI ] )
			Return aList[ nI ]
		EndIf
	Next nI
	Return Nil

/**
 * Returns the index of the first element to pass the predicate. Returns
 * undefined if the predicate never passes.
 * @param Block
 * @param Array
 * @return Number
 * @author Marcelo Camargo
 */
Prelude Function FindIndex( bBlock, aList )
	Local nI
	For nI := 1 To Len( aList )
		If Eval( bBlock, aList[ nI ] )
			Return nI
		EndIf
	Next nI
	Return Nil

/**
 * Returns an array of all the indices of the elements which pass the predicate.
 * Returns an empty list if the predicate never passes.
 * @param Block
 * @param Array
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function FindIndices( bBlock, aList )
	@BUILD ACCUMULATOR aAccum
	For nI := 1 To Len( aList )
		If Eval( bBlock, aList[ nI ] )
			aAdd( aAccum, nI )
		EndIf
	Next nI
	Return aAccum

/**
 * Greatest common denominator.
 * @param Number
 * @param Number
 * @return Number
 * @author Marcelo Camargo
 */
Prelude Function GCD( nA, nB )
	Local nTmp
	Do While nB > 0
		nTmp := nB
		nB   := nA % nB
		nA   := nTmp
	EndDo
	Return Int( nA )

/**
 * The first item of the list. Returns undefined if the list is empty.
 * @param Array
 * @return Mixed
 * @author Marcelo Camargo
 */
Prelude Function Head( aList )
	Return aList[ 1 ]

/**
 * A function which does nothing: it simply returns its single argument. Useful
 * as a placeholder.
 * @param Mixed
 * @return Mixed
 * @author Marcelo Camargo
 */
Prelude Function Id( xElem )
	Return xElem

/**
 * Everything but the last item of the list.
 * @param Array
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function Initial( aList )
	@BUILD FIXED ACCUMULATOR aAccum<( Len( aList ) - 1 )>
	For nI := 1 To ( Len ( aList ) - 1 )
		aAccum[ nI ] := aList[ nI ]
	Next nI
	Return aAccum

/**
 * Least common multiple.
 * @param Number
 * @param Number
 * @return Number
 * @author Marcelo Camargo
 */
Prelude Function LCM( nA, nB )
	Return Int( nA * ( nB / Z_GCD( nA, nB ) ) )

/**
 * The length of an element.
 * @param Mixed
 * @return Number
 * @author Marcelo Camargo
 */
Prelude Function Length( xElem )
	Return Len( xElem )

/**
 * Applies a function to each item in the list, and produces a new list with
 * the results. The length of the result is the same
 * length as the input.
 * @param Block
 * @param Array
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function Map( bBlock, aList )
	@BUILD FIXED ACCUMULATOR aAccum<Len( aList )>
	For nI := 1 To Len( aList )
		aAccum[ nI ] := Eval( bBlock, aList[ nI ] )
	Next nI
	Return aAccum

/**
 * Almost the same as map, but applies with two parameters, both item and index.
 * This is useful when you really need to know the position which the element
 * is on.
 * @param Block
 * @param Array
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function MapIndex( bBlock, aList )
	@BUILD FIXED ACCUMULATOR aAccum<Len( aList )>
	For nI := 1 To Len( aList )
		aAccum[ nI ] := Eval( bBlock, aList[ nI ], nI )
	Next nI
	Return aAccum

/**
 * Takes a list of comparable items, and returns the largest of them.
 * @param Array
 * @return Mixed
 * @author Marcelo Camargo
 */
Prelude Function Maximum( aList )
	Local nMax := aList[ 1 ] ;
	    , nI
	For nI := 1 To Len( aList )
		If aList[ nI ] > nMax
			nMax := aList[ nI ]
		EndIf
	Next nI
	Return nMax

/**
 * Gets the mean of the values in the list.
 * @param Array
 * @return Number
 * @author Marcelo Camargo
 */
Prelude Function Mean( aList )
	Local nSum := 0 ;
	    , nI
	For nI := 1 To Len( aList )
		nSum += aList[ nI ]
	Next nI
	Return nSum / Len( aList )

/**
 * Takes a list of comparable items, and returns the smallest of them.
 * @param Array
 * @return Mixed
 * @author Marcelo Camargo
 */
Prelude Function Minimum( aList )
	Local nMin := aList[ 1 ] ;
	    , nI
	For nI := 1 To Len( aList )
		If aList[ nI ] < nMin
			nMin := aList[ nI ]
		EndIf
	Next nI
	Return nMin

/**
 * The negation of the inputted number.
 * @param Number
 * @return Number
 * @author Marcelo Camargo
 */
Prelude Function Negate( nI )
	Return -( nI )

/**
 * Is the number odd?
 * @param Number
 * @return Bool
 * @author Marcelo Camargo
 */
Prelude Function Odd( nA )
	Return nA % 2 <> 0

/**
 * Returns true if any item in the list is true, otherwise returns false.
 * @param Array
 * @return Bool
 * @author Marcelo Camargo
 */
Prelude Function OrList( aList )
	Local nI
	For nI := 1 To Len( aList )
		If aList[ nI ]
			Return .T.
		EndIf
	Next nI
	Return .F.

/**
 * Equivalent to [(filter f, xs), (reject f, xs)], but more efficient, using
 * only one loop.
 * @param Block
 * @param Array
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function Partition( bBlock, aList )
	Local aAccum := { { }, { } } ;
	    , nI
	For nI := 1 To Len( aList )
		If Eval( bBlock, aList[ nI ] )
			aAdd( aAccum[ 1 ], aList[ nI ] )
		Else
			aAdd( aAccum[ 2 ], aList[ nI ] )
		EndIf
	Next nI
	Return aAccum

/**
 * Returns pi (Really!?).
 * @return Number
 */
Prelude Function Pi()
	Return 3.141592653589793

/**
 * Gets the product of all the items in the list.
 * @param Array
 * @return Number
 * @author Marcelo Camargo
 */
Prelude Function Product( aList )
	Local nProd := 1 ;
	    , nI
	For nI := 1 To Len( aList )
		nProd *= aList[ nI ]
	Next nI
	Return nProd

/**
 * Receives two integers and returns an array following that range.
 * @param Number
 * @param Number
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function Range( nStart, nEnd )
	@BUILD ACCUMULATOR aAccum
	For nI := nStart To nEnd
		aAdd( aAccum, nI )
	Next nI
	Return aAccum

/**
 * One over the number, ie 1 / x
 * @param Number
 * @return Number
 * @author Marcelo Camargo
 */
Prelude Function Recipe( nA )
	Return 1 / nA

/**
 * Like filter, but the new list is composed of all the items which fail the
 * function's test.
 * @param Block
 * @param Array
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function Reject( bBlock, aList )
	@BUILD ACCUMULATOR aAccum
	For nI := 1 To Len( aList )
		If !Eval( bBlock, aList[ nI ] )
			aAdd( aAccum, aList[ nI] )
		EndIf
	Next nI
	Return aAccum

/**
 * Returns a new list which is the reverse of the inputted one.
 * @param Array
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function Reverse( aList )
	@BUILD ACCUMULATOR aAccum
	For nI := Len( aList ) To 1 Step -1
		aAdd( aAccum, aList[ nI ] )
	Next nI
	Return aAccum

/**
 * Takes a number and returns either -1, 0, or 1 depending on the sign of the
 * number.
 * @param Number
 * @return Number
 * @author Marcelo Camargo
 */
Prelude Function SigNum( nI )
	If nI > 0
		Return 1
	ElseIf nI < 0
		Return -1
	EndIf
	Return 0

/**
 * Returns a slice of a list.
 * @param Number
 * @param Number
 * @param Array
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function Slice( nX, nY, aList )
	@BUILD ACCUMULATOR aAccum
	For nI := nX To nY
		aAdd( aAccum, aList[ nI ] )
	Next nI
	Return aAccum

/**
 * Sorts a list. Does not modify the input.
 * @param Array
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function Sort( aList )
	Return aSort( aList )

/**
 * Receives three integers and returns an array following that range stepping by
 * the <nNext> - <nStart> value.
 * @param Number
 * @param Number
 * @param Number
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function StepRange( nStart, nEnd, nNext )
	@BUILD ACCUMULATOR aAccum
	For nI := nStart To nEnd Step ( nNext - nStart )
		aAdd( aAccum, nI )
	Next nI
	Return aAccum

/**
 * Sums up the values in the list.
 * @param Array
 * @return Number
 * @author Marcelo Camargo
 */
Prelude Function Sum( aList )
	Local nSum := 0 ;
	    , nI
	For nI := 1 To Len( aList )
		nSum += aList[ nI ]
	Next nI
	Return nSum

/**
 * Takes a delimiter and a string. Returns an array separating the string by
 * the given delimiter.
 * @param String
 * @param String
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function Split( cDelim, cStr )
	Local nIndex  := 1   ;
	    , cString := ""  ;
	    , aAccum  := { } ;

	Do While nIndex <= Len( cStr )
		If !( cStr[ nIndex ] $ cDelim )
			cString += cStr[ nIndex ]
		Else
			If cString <> ""
				aAdd( aAccum, cString )
				cString := ""
			EndIf
		EndIf
		nIndex += 1
	EndDo
	If cString <> ""
		aAdd( aAccum, cString )
	EndIf
	Return aAccum

/**
 * Converts an array of characters in a string.
 * @param Array
 * @return String
 * @author Marcelo Camargo
 */
Prelude Function Stringify( aStr )
	Local cVal := "" ;
	    , nI
	For nI := 1 To Len( aStr )
		cVal += aStr[ nI ]
	Next nI
	Return cVal

/**
 * Everything but the first item of the list.
 * @param Array
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function Tail( aList )
	@BUILD ACCUMULATOR aAccum
	For nI := 2 To Len( aList )
		aAdd( aAccum, aList[ nI ] )
	Next nI
	Return aAccum

/**
 * Returns the first n items in the list.
 * @param Number
 * @param Array
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function Take( nX, aList )
	@BUILD FIXED ACCUMULATOR aAccum< nX >
	For nI := 1 To nX
		aAccum[ nI ] := aList[ nI ]
	Next nI
	Return aAccum

/**
 * Takes the first items of the list which pass the test.
 * @param Block
 * @param ArrayPre
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function TakeWhile( bBlock, aList )
	@BUILD ACCUMULATOR aAccum
	For nI := 1 To Len( aList )
		If !Eval( bBlock, aList[ nI ] )
			Return aAccum
		Else
			aAdd( aAccum, aList[ nI ] )
		EndIf
	Next nI
	Return aAccum

/**
 * 2 x Pi { }
 * @return Number
 * @author Marcelo Camargo
 */
Prelude Function Tau()
	Return 2 * ( Z_PI() )

/**
 * Zips together its two arguments into a list of lists.
 * @param Array
 * @param Array
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function Zip( aA, aB )
	@BUILD ACCUMULATOR aAccum
	For nI := 1 To Len( aA )
		aAdd( aAccum, { aA[ nI ], aB[ nI ] } )
	Next nI
	Return aAccum

/**
 * Zips together its two arguments using a function into a list of resulting
 * values.
 * @param Block
 * @param Array
 * @param Array
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function ZipWith( bBlock, aA, aB )
	@BUILD ACCUMULATOR aAccum
	For nI := 1 To Len( aA )
		aAdd( aAccum, Eval( bBlock, aA[ nI ], aB[ nI ] ) )
	Next nI
	Return aAccum

/**
 * Casts a value to an integer
 * @param Mixed
 * @return Number<Int>
 * @author Marcelo Camargo
 */
Cast Function Int( cVal )
	Return Int( cVal )

/**
 * Casts a value to a number
 * @param Mixed
 * @return Number
 * @author Marcelo Camargo
 */
Cast Function Num( cVal )
	Return Val( cVal )

/**
 * Casts a value to string
 * @param Mixed
 * @return String
 * @author Marcelo Camargo
 */
Cast Function Str( cVal )
	Return Str( cVal )

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
