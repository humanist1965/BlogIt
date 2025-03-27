In lambda calculus, Church numerals represent natural numbers as functions that apply a given function a certain number of times. To define subtraction (or a “minus” function) using Church numerals, we need a way to express the operation ( m - n ), where ( m ) and ( n ) are Church numerals. This is trickier than addition or multiplication because subtraction must account for cases where ( n > m ) (which should result in 0 in the context of natural numbers).

Let’s dive into how this works.

Church Numerals Basics

First, a quick refresher on Church numerals:
	•	( 0 = \lambda s. \lambda z. z ) (applies ( s ) zero times to ( z )).
	•	( 1 = \lambda s. \lambda z. s z ) (applies ( s ) once to ( z )).
	•	( 2 = \lambda s. \lambda z. s (s z) ) (applies ( s ) twice to ( z )).
	•	( 3 = \lambda s. \lambda z. s (s (s z)) ) (applies ( s ) three times to ( z )).
	•	In general, ( n = \lambda s. \lambda z. s^n z ), where ( s^n z ) means applying ( s ) to ( z ) ( n ) times.

Addition and multiplication are straightforward:
	•	Addition: ( m + n = \lambda s. \lambda z. m s (n s z) ) (apply ( s ) ( m ) times, then ( n ) more times).
	•	Multiplication: ( m \times n = \lambda s. \lambda z. m (n s) z ) (apply ( n s ) ( m ) times).

Subtraction, however, requires a way to “undo” applications of ( s ), which isn’t directly intuitive in lambda calculus. We’ll use the predecessor function as a building block.

Predecessor Function

The predecessor function (( pred )) takes a Church numeral ( n ) and returns ( n - 1 ), with ( pred 0 = 0 ). Defining ( pred ) is non-trivial because lambda calculus doesn’t naturally “count down.” A common approach uses pairs to shift counts.

Define a pair constructor and selectors:
	•	Pair: ( [a, b] = \lambda x. x a b ) (a function that takes a selector ( x ) and applies it to ( a ) and ( b )).
	•	First: ( fst = \lambda p. p (\lambda x y. x) ) (selects the first element).
	•	Second: ( snd = \lambda p. p (\lambda x y. y) ) (selects the second element).

Now, the predecessor function can be defined as:
	•	( pred = \lambda n. snd (n (\lambda p. [\lambda z. (fst p z), fst p]) [(\lambda z. z), (\lambda z. z)]) ).

How does this work? For a Church numeral ( n ):
	•	Start with the pair ( [0, 0] ) (where ( 0 = \lambda z. z )).
	•	For each application of the function ( \lambda p. [\lambda z. (fst p z), fst p] ):
	◦	The first element becomes ( s ) applied to the previous first element.
	◦	The second element becomes the previous first element.
	•	After ( n ) applications, the second element is ( n - 1 ).

For example:
	•	( pred 1 ):
	◦	( 1 = \lambda s z. s z ).
	◦	Apply once: ( [0, 0] \to [1, 0] ).
	◦	( snd [1, 0] = 0 ).
	•	( pred 2 ):
	◦	( 2 = \lambda s z. s (s z) ).
	◦	( [0, 0] \to [1, 0] \to [2, 1] ).
	◦	( snd [2, 1] = 1 ).

Subtraction Using Predecessor

Subtraction ( m - n ) can be defined by applying the predecessor function ( n ) times to ( m ):
	•	( minus = \lambda m. \lambda n. n pred m ).

Here’s how it evaluates:
	•	( n pred m ) means “apply ( pred ) to ( m ) ( n ) times.”
	•	Each application of ( pred ) reduces the numeral by 1.
	•	If ( n > m ), the result stabilizes at 0 (since ( pred 0 = 0 )).

Examples:
	•	( 3 - 2 ):
	◦	( 3 = \lambda s z. s (s (s z)) ), ( 2 = \lambda s z. s (s z) ).
	◦	( minus 3 2 = 2 pred 3 ).
	◦	( pred 3 = 2 ).
	◦	( pred 2 = 1 ).
	◦	Result: ( \lambda s z. s z = 1 ).
	•	( 2 - 3 ):
	◦	( minus 2 3 = 3 pred 2 ).
	◦	( pred 2 = 1 ).
	◦	( pred 1 = 0 ).
	◦	( pred 0 = 0 ).
	◦	Result: ( \lambda s z. z = 0 ).

Final Definition

The subtraction function in lambda calculus using Church numerals is:
	•	( minus = \lambda m. \lambda n. n (\lambda x. snd (x (\lambda p. [\lambda z. (fst p z), fst p]) [(\lambda z. z), (\lambda z. z)])) m ).

This expression is complex but works by leveraging the predecessor function iteratively. For practical use, you’d typically simplify or test it in a lambda calculus interpreter, but this is the pure, untyped lambda calculus solution.

