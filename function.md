# Function literal
```kotlin
val printHello = { println("hello") }
val printMessage = { msg: String -> println(msg) }

fun main() {
    printHello()
    printMessage("hello world")
}
```

## Higher-order function

```kotlin
fun foo(str: String, fn: (String) -> String): Unit {
    val applied = fn(str)
	println(applied)
}

fun bar(): (String) -> String = { it.reversed() }

fun modulo(k: Int): (Int) -> Boolean = { it % k == 0 } 
fun main() {
    foo("hello", { it.reversed() })
    foo("hello", { it + " world" })
    val reversi = bar()
    println(reversi("hello"))
	val fizz = modulo(3)
	val buzz = modulo(5)
	println(fizz(3) && buzz(3))
    val nums = List(5, { it * 3 }).filter(fizz)
    println(nums)
}
```

## Top-level function reference

```kotlin
fun String.greet(): Unit = println(this)

fun main() {
    "this is awesome".greet()
    
    // Top level function reference.
    "this is awesome".also(::println)
}
```


## Memoization

```kotlin
import java.util.concurrent.ConcurrentHashMap

fun fib(k: Int): Long = when (k) {
    0 -> 1
    1 -> 1
    else -> fib(k - 1) + fib(k - 2)
}

fun MemoizeFib(): (Int) -> Long {
    val map = mutableMapOf<Int, Long>()
    fun memFib(k: Int): Long {
        return map.getOrPut(k) {
            when (k) {
	            0 -> 1
 	           	1 -> 1
           		else -> memFib(k - 1) + memFib(k - 2)
            }
        }
    }
    // Need to use partial function, cannot return memFib directly.
    return {k: Int -> memFib(k)}
}


// This memoization function can only be used for functions that are not recursive, e.g. query, search.
fun <A, R> memoize(fn: (A) -> R): (A) -> R {
    val map = ConcurrentHashMap<A, R>()
    return { a ->
		map.getOrPut(a) {
        	fn(a)
        }
    }
}
// Define memoize as an extension function on Function1.

fun<A, R> Function1<A, R>.memoized(): (A) -> R {
    val map = ConcurrentHashMap<A, R>()
    return {
        a -> map.getOrPut(a) {
            this.invoke(a)
        }
    }
}

fun query(str: String) = "hello"

fun main() {
	// Will hang.
    // println(fib(50))
    val memFib = MemoizeFib()
    println(memFib(50))
    
    val memquery = memoize(::query)
    println("calling memquery")
	println(memquery("hello"))
    
    // val memquery2 = ::fib.memoized()
    // println(memquery2(query))
}
```
