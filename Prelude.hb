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