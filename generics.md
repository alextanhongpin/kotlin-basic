```kotlin
fun <T> printRepeated(t: T, k: Int): Unit {
    for (x in 0..k) {
        println(t)
    }
}

fun main() {
    printRepeated<Int>(1, 10)
    printRepeated<String>("hello", 10)
}
```
