## Apply

Takes the receiver instance and returns the receiver instance. Useful for initialization of values.

```kotlin
class Person(name: String){
	var isVerified: Boolean = false
}

fun main() {
    val person = Person("john").apply {
        isVerified = true
    }
	println(person.isVerified)    
}
```

## Let

Takes the receiver instance, returns the value of the closure. Useful for conversion.

```kotlin
fun main() {
    val meaningOfLife = 42.let {
		"the number is $it"
    }
    println(meaningOfLife)
}
```

## With

Accepts a receiver and allows the receiver methods to be called without specifying the receiver many times.

```kotlin
object singleton {
    fun add(a: Int, b: Int) = a + b
    fun mul(a: Int, b: Int) = a * b
}

fun main() {
    var a = 10
    var b = 20
    with(singleton) {
		println(add(a, b))
        println(mul(a, b))
    }
}
```

## Run

A combination of `with` and `let`. Takes a receiver object, returns the value in the closure:

```kotlin
object singleton {
    fun add(a: Int, b: Int) = a + b
    fun mul(a: Int, b: Int) = a * b
}

fun main() {
    var a = 10
    var b = 20
    val result = singleton.run {
		add(a, b) + mul(a, b)
    }
    println(result)
}
```

## Lazy

Wraps an expensive function call to be invoked when first required.

```kotlin
fun main() {
    var a = 10
    var b = 20
    val result = lazy {
        println("called")
		a + b
    }
    println(result.value)
}
```

## Use
Safely invoke a function, and closing down the resource after the function has completed whether an exceptino was raised or not.

## Repeat

Repeats a function multiple times.

```kotlin
fun main() {
    repeat(10, { println("hello") })
}
```

## Asset/Require/Check

Assert can be disabled at runtime, but require and check cannot be disabled.

```kotlin
fun neverEmpty(str: String) {
    require(str.trim().length > 0, { "String should not be empty" })
    println(str)
}

fun main() {
	neverEmpty("")
}
```
