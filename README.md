## Basics

## Types

```
Long: 64
Int: 32
Short: 16
Byte: 8
Double: 64
Float: 32
```

## Array

```kotlin
fun main() {
    // Creates an array with values.
    val array = arrayOf(1,2,3,4,5)
    println(array.toList()) // Prints [1, 2, 3, 4, 5]
    println(array) // Prints [Ljava.lang.Integer;@1fb3ebeb
    
    // Creates with an initial size and a function that maps the values.
    val perfectSquares = Array(10, { i -> i * 2})
    println(perfectSquares.toList())
    
    // Access the first item in the array.
    val element1 = perfectSquares[0]
    
    // Access the second item in the array.
    val element2 = perfectSquares[1]
    println(element1)
    println(element2)

    // Modify the third item in the array.
    perfectSquares[2] = 1
    println(perfectSquares.toList())
}
```

## Range
```kotlin
fun main() {
	val aToZ = 'a'..'z'
    println(aToZ)
    
    val oneToNine = 1..9
    println(oneToNine) // It's a range object. 
    println(oneToNine.toList()) // It's a list.
    
    // We can check if an item exists in both the range and list object.
    println(1 in oneToNine)
    println(1 in oneToNine.toList())
    
    // Counting down.
    val downTo = 100.downTo(0)
    println(downTo.toList())
    
    val rangeTo = 10.rangeTo(20)
    println(rangeTo.toList())
    
    val oneToFifty = 1..50
    
    // Increment it by two for every step.
    println(oneToFifty.step(2).toList())
    
    // The original range will not be affected.
    println(oneToFifty.toList()) 
    
    // Increment it by two for every step, then reverse it.
    println(oneToFifty.step(2).reversed().toList())
}
```

## Loop
```kotlin
fun main() {
    val list = arrayOf(1,2,3,4,5)
    for (i in list) {
        println("array item is $i")
    }
    
    val set = setOf(1,2,3,4,5,5)
    for (s in set) {
        println("set item is $s")
    }
    // We can also access the indices this way.
    for (index in set.indices) {
        println("set index is $index")
    }
    
    val str = "hello world"
    for (c in str) {
        println(c)
    }
    
    for (index in str.indices) {
        println(str[index])
    }   
}
```

## Raising Error

```kotlin
fun main() {
    try {
        doWork()
    } catch (e: Exception) {
        println("Error doWork: ${e.message}")
    }
}

fun doWork() {
    throw Exception("bad error")
}
```

## Scope

```kotlin
class Person(val name: String) {
    fun printMe() = println(this)
    
    // Access the person name scope. Note that the constructor must now be a `val`.
    fun printName() = println("my name is ${this@Person.name}")
}

fun main() {
    val john = Person("john")
    john.printMe()
    
    john.printName()
}
```

## Visibility

```kotlin
class Person {
    private fun name() = "nameless"
    protected fun greet() = "hi, ${name()}"
    fun getName(): String = name()
}


fun main() {
    val john = Person()
	println(john.getName())
    // println(john.greet())
}
```

## Conditional

```kotlin
fun main() {
    val year = 2018
    val thisYear = if (year === 2018) "yes" else "nope"
    println(thisYear)
}
```

## Null syntax

```kotlin
fun main() {
    // Declare a nullable string.
    val str: String? = null
    println(str)
    
    if (str == null) {
        println("string is null")
    }
    
    // If the string is null, then return the length as 0.
    println(str?.length ?: 0)
}
```

## When syntax

```kotlin
fun main() {
	whatNumber(1)
}

fun whatNumber(x: Int) {
    when (x) {
        0 -> println("x is zero")
        1 -> println("x is one")
        3,4,5 -> println("one of 3, 4 or 5")
        in 6..10 -> println("6 to 10")
        in listOf(10,11,12,13,14,15) -> println("10 to 15")
        in listOf(1, 2) -> println("not going to reach this statement")
        else -> println("x is neither 0 or 1")
    }
}
```

Without arguments:
```kotlin
fun main() {
	whatNumber(1)
}

fun whatNumber(x: Int) {
    when {
       x < 5 -> println("less than five")
       x in 5..10 -> println("between 5 to 10")
       else -> println("greater than 10")
    }
}
```

## Function return

```kotlin
fun main() {
    val list = listOf(1,2,3,4,5)
    list.forEach stop@ {
        if (it == 3) return@stop
    }
    list.forEach {
        if (it == 3) return@forEach
    }
    println("done")
}
```

## Casting Type
```kotlin
fun isString(any: Any): Boolean =
    if (any is String) true else false

fun isEmptyString(any: Any): Boolean =
    any is String && any.length == 0

fun main() {
    println(isString(1))	
    println(isString("hello world"))
    println(isEmptyString(""))
    println(isEmptyString(1))
}
```

## When

```kotlin
fun whatNumber(x: Int) =
    when (x) {
        0 -> println("x is zero")
        1 -> println("x is one")
        else -> println("x is neither 0 or 1")
    }
    
fun isMinOrMax(x: Int): Boolean =
    when (x) {
        Int.MIN_VALUE -> true
        Int.MAX_VALUE -> true
        else -> false
    }

fun isZeroOrOne(x: Int): Boolean =
    when (x) {
        0, 1 -> true
        else -> false
    }
    
fun isAbs(x: Int): Boolean =
    when (x) {
        Math.abs(x) -> true
		else -> false
    }

fun isSingleDigit(x: Int): Boolean =
	when (x) {
        in -9..9 -> true
        else -> false
    }

fun isDieNumber(x: int): Boolean =
    when (x) {
        in 1..6 -> true
        else -> false
    }
    
fun whenWithoutArgs(x: Int, y: Int) =
    when {
        x < y -> println("x is less than y")
        x > y -> println("x is more than y")
        else -> println("x must equal y")
    }

fun main() {
   whatNumber(1)
   println(isMinOrMax(1))
   println(isZeroOrOne(1))
   println(isAbs(-1))
   println(isSingleDigit(100))
   println(isDieNumber(5))
   whenWithoutArgs(10, 4)
}
```


## Looping

```kotlin
fun printExceptStop() {
    val list = listOf("a", "b", "stop", "c")
    list.forEach stop@ {
        if (it == "stop") return@stop
        else println(it)
    }
}

fun printUntilStop() {
    val list = listOf("a", "b", "stop", "c")
    run loop@ {
        list.forEach {
            if (it == "stop") return@loop
            println(it)
        }
    }
}

fun main() {
    printExceptStop()
    printUntilStop()
}
```

## Nested Class

```kotlin
Nested class

class A {
    private val someField: Int = 1
    inner class B {
        private val someField: Int = 2
        fun foo() {
            println("Field from B: ${this.someField}")
            println("Field from B: ${this@B.someField}")
            println("Field from A: ${this@A.someField}")
        } 
    }
}

fun main() {
	A().B().foo()   
}
```

## Multiple Interfaces

```kotlin
interface Drivable {
    fun drive()
}

interface Sailable {
    fun saill()
}

class AmphibiousCar(val name: String) : Drivable, Sailable {
    override fun drive() {
        println("driving")
    }
    
    override fun saill() {
        println("sailling")
    }
}

fun main() {
    val car = AmphibiousCar("proton")
    car.drive()
    car.saill()
}
```


## Composition
```kotlin
interface UIElement {
    fun getHeight(): Int
    fun getWidth(): Int
}

class Rectangle(val x1: Int, val x2: Int, val y1: Int, val y2: Int): UIElement {
    override fun getHeight() = y2 - y1
    override fun getWidth() = x2 - x1
}

class Panel(val rectangle: Rectangle) : UIElement by rectangle

fun main() {
    val panel = Panel(Rectangle(10, 100, 30, 100))
    println("Panel height: ${panel.getHeight()}")
    println("Panel width: ${panel.getWidth()}")
}
```


## Member Functions

```kotlin
object Rectangle {
    fun printArea(width: Int, height: Int): Unit {
        val area = calculateArea(width, height)
        println("The area is $area")
    }
    
    fun calculateArea(width: Int, height: Int): Int {
        return width * height
    }
}

fun main() {
    Rectangle.printArea(10, 20)
}
```


## Top-level functions

```kotlin
fun foo(k: Int) {
    require(k > 10, { "k should be greater than 10"})
}

fun main() {
    foo(1)
}
```

## Pair

```kotlin
class Roots(pos: Double, neg: Double)

fun roots(k: Int): Array<Double> {
    require(k >= 0)
    val root = Math.sqrt(k.toDouble())
    return arrayOf(root, -root)
}

fun roots2(k: Int): Roots {
    require(k >= 0)
    val root = Math.sqrt(k.toDouble())
    return Roots(root, -root)
}

fun roots3(k: Int): Pair<Double, Double> {
    require(k >= 0)
    val root = Math.sqrt(k.toDouble())
    return Pair(root, -root)
}

fun main() {
    println(roots(10))
    println(roots2(10))
    val (pos, neg) = roots3(10)
    println("$pos, $neg")
}
```

## Infix

```kotlin
class InfixAccount {
    var balance = 0.0
    
    infix fun add(amount: Double): Unit {
        this.balance = balance + amount
    }
}

fun main() {
    val account = InfixAccount()
    account add 200.0
    println(account.balance)
}
```


## Operator overloading


```kotlin
class Matrix(val a: Int, val b: Int, val c: Int, val d: Int) {
    operator fun plus(matrix: Matrix): Matrix {
        return Matrix(a + matrix.a,
                      b + matrix.b,
                      c + matrix.c,
                      d + matrix.d)
    }
}

fun main() {
    val m1 = Matrix(1, 2, 3, 4)
    val m2 = Matrix(5, 6, 7, 8)
    val m3 = m1 + m2
    println("${m3.a}, ${m3.b}, ${m3.c}, ${m3.d}")
}
```

## Get/Set operator

```kotlin
enum class Piece {
    Empty, Pawn, Bishop, Knight, Rook, Queen, King
}

class ChessBoard {
    private val board = Array<Piece>(64, { Piece.Empty })
    operator fun get(rank: Int, file: Int): Piece = board[file * 8 + rank]
    operator fun set(rank: Int, file: Int, value: Piece): Unit {
        board[file * 8 + rank] = value
    }
}

fun main() {
    val board = ChessBoard()
    board[0, 4] = Piece.Queen
    println(board[0, 4])
}
```

## Invoke

Invoke makes a class itself looks like a function.
```kotlin
import kotlin.random.Random

class RandomLongs(seed: Long) {
    private val random = Random(seed)
    operator fun invoke(): Long = random.nextLong()
}

fun main() {
    val random = RandomLongs(1000)
    println(random())
}
```

```kotlin
class Min {
    operator fun invoke(a: Int, b: Int): Int = if (a <= b) a else b
    operator fun invoke(a: Int, b: Int, c: Int): Int = invoke(invoke(a, b), c)
    operator fun invoke(a: Int, b: Int, c: Int, d: Int) = invoke(invoke(a, b), invoke(c, d))
}

fun main() {
    val min = Min()
    println(min(1, 2))
    println(min(1, 2, 3))
    println(min(1, 2, 3, 4))
}
```

## Comparison

```kotlin
class BingoNumber(val name: String, val age: Int) {
    operator fun compareTo(other: BingoNumber) = 
    	when {
            age > other.age -> 1
            age < other.age -> -1
            else -> 0
        }
}

fun main() {
    val a = BingoNumber("john", 10)
    val b = BingoNumber("doe", 20)
    println(a > b)
    println(a < b)
}
```

# Function literal

fun main() {
    val printMessage = { message: String -> println(message)}
    printMessage("good day")
}


## Varargs
```kotlin
fun multiprint(vararg strings: String) {
    for (string in strings) {
        println(string)
    }
}

fun multiprint2(prefix: String, vararg strings: String, suffix: String) {
    println(prefix)
   	for (string in strings) {
        println(string)
    }
    println(suffix)
}

fun main() {
    multiprint("a", "b", "c")
    multiprint2("prefix", "a", "b", "c", suffix = "suffix")
    
    val strings = arrayOf("a", "b", "c")
    multiprint2("prefix", *strings, suffix = "suffix")
}
```

## Extension 

```kotlin
class Submarine {
    fun fire(): Unit {
        println("Firing torpedos")
    }
    
    fun submerge(): Unit {
        println("Submerging")
    }
}


fun Submarine.fire(): Unit {
    println("Fire on board!")
}

fun Submarine.submerge(depth: Int): Unit {
    println("Submerging from $depth meter.")
}

fun main() {
    val submarine = Submarine()
    submarine.fire()
    
    submarine.submerge()
    submarine.submerge(10)
}
```


## Generics
```kotlin
fun <T> printRepeated(t: T, n: Int): Unit {
    for (i in 0..n) {
        println(t)
    }
}

fun main() {
    printRepeated("a", 10)
    printRepeated(100, 10)
}
```

## Higher order functions

```kotlin
fun foo(str: String, fn: (String) -> String): Unit {
    val applied = fn(str)
    println(applied)
}

fun bar(): (String) -> String = { str -> str.reversed() }

fun main() {
    foo("hello world", { it.reversed() })
    foo("hello world", { it.toUpperCase() })
    foo("hello world", { it.capitalize() })
    
    val reversi = bar()
    println(reversi("hello world"))
}
```


## Function Assignment

```kotlin
fun main() {
    val isEven: (Int) -> Boolean = { it % 2 == 0 }
    println(listOf(1, 2, 3, 4).filter(isEven))
}
```

## Function Reference

```kotlin
fun isEven(n: Int): Boolean = n % 2 == 0
fun main() {
    println(listOf(1, 2, 3, 4).filter(::isEven))
}
```
