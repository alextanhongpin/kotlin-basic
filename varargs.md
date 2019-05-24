## Varargs and spread operator

```kotlin
fun multiprint(vararg strings: String): Unit {
    for (string in strings) {
        println(string)
    }
}

fun min(head: Int, vararg numbers: Int, tail: Int) {
    println("head $head tail $tail")
    println(numbers.size)
}

fun main() {
    multiprint("hello", "world")
    min(1, 2, 3, 4, tail = 5)
    
    // Does not work with Array<Int>, IntArray is expected.
	val numbers = arrayOf(1,2,3,4,5).toIntArray()
    min(1, *numbers, tail = 6)
}
```
