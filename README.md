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

## Smart Casts

```kotlin
fun main() {
    println(getStringLength("hello world"))
    println(getStringLength(1))
}

fun getStringLength(a: Any): Int? {
    	if (a is String) {
            return a.length
        }
        return null
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
