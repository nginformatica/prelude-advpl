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
 * Everything but the first item of the list.
 * @param Array
 * @return Array
 * @author Marcelo Camargo
 */
Prelude Function Tail( aList )
	Return aDel( aList, 1 )