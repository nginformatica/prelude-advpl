/**
 * The MIT License (MIT)
 *
 * Copyright (c) 2015 Marcelo Camargo <marcelocamargo@linuxmail.org>
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

#include "SyntaxAbstraction.hb"

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
 * length as the input.
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
 * @return Array
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
 * @return Number
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
 * The first item of the list. Returns undefined if the list is empty.
 * @param Array
 * @return Mixed
 * @author Marcelo Camargo
 */
Prelude Function Head( aList )
	Return aList[ 1 ]

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
 * Receives two integers and returns an array following that range stepping by
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
 * Everything but the first item of the list.
 * @param Array
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function Tail( aList )
	Return aDel( aList, 1 )

/**
 * Returns the first n items in the list.
 * @param Number
 * @param Array
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function Take( nX, aList )
	@BUILD FIXED ACCUMULATOR< nX >
	For nI := 1 To nX
		aAccum[ nI ] := aList[ nI ]
	Next nI
	Return aAccum

/**
 * Takes the first items of the list which pass the test.
 * @param Block
 * @param Array
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
	Next nI
	Return aAccum

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