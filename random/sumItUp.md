<<<<<<< HEAD
<br>



<span class="top-right">
<a class="abtn btn" href="http://localhost:3000/code/BLOGIT/random/sumItUp.md">EDIT</a>
<a class="abtn btn" href="http://localhost:3000/view/BLOGIT/random/sumItUp.md">VIEW</a>
<a class="abtn btn" href="http://localhost:3000/code/MIG1/help/UsingTheWiki.md">?</a>
</span>
<link rel="stylesheet" href="../styles.css">
<div class="breadcrumb-menu"><a href="../random/README.md">random</a> &gt; </div>
=======
# Sum it Up!

In your favourite programming language how do you sum up integers from 1 to n.

Write a function SumItUp(n: Integer) that returns an Integer

I've often seen FP languages like haskell state that they do it like

```haskell
sumItUp:: Integer -> Integer
sumItUp n = sum [1..n]
```

That's cheating though. Using a standard library function that does it.
The only possible messsage here:  In general in FP we look look to use existing library functions to acheive something, rather than recreate the wheel


## Hasell - using recursion (simple)

```haskell
sumItUp:: Integer -> Integer
sumItUp n = sumItUpAux [1..n]

sumItUpAux:: [Integer] -> Integer
sumItUpAux [] = 0
sumItUpAux (n:ns) = n + sumItUpAux(ns)
```

## Hasell - using recursion (tail recursion aka iteration)

```haskell
sumItUp:: Integer -> Integer
sumItUp n = sumItUpAux [1..n]

sumItUpAux:: [Integer] -> Integer -> Integer
sumItUpAux [] acc = acc
sumItUpAux (n:ns) acc = sumItUpAux ns (acc + 1)
```
>>>>>>> 5c57243d29da5755aaed269753c0e720c663401c
