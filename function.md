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
