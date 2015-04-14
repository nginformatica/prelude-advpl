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

#include "syntax.ch"
#include "cast.ch"
#include "validate.ch"
#include "list.ch"

/**
 * Prelude version
 */
#define PRELUDE_VERSION 1

Package Prelude(Version: 1) Where

	/**
	 * WARNING: USE ONLY IN REFERENTIALLY TRANSPARENT BLOCKS/LAMBDAS.
	 * Applies memoization to a function that has an Iterable<List>
	 * @author: Marcelo Camargo
	 * @date: 2015-04-03
	 */
	Def Memoize( bBlock, xParam )
		/**
		 * Array aCache: holds our temp cache.
		 * Integer nIndex: Maybe the value of the index of the element.
		 * Mixed xValue: Will store our value in case of processing it.
		 */
		Static aCache <- { { }, { } }
		Let nIndex <- @ElemIndex { xParam, aCache[1] } ;
		  , xValue

		// When there is any entry on cache, fall in this point.
		If nIndex <> Nil
			Return aCache[ 2 ][ nIndex ]
		EndIf

		// Not processed yet, let's store the value.
		xValue <- Eval( bBlock, xParam )

		// Set a KeyValuePair for data storage.
		On aCache[1] aAdd xParam
		On aCache[2] aAdd xValue

		// Clear cache when we reach the last element.
		If Len( aCache ) Is nIndex
			aCache <- { { },  { } }
		EndIf
		Return xValue
