# Function literal
```kotlin
val printHello = { println("hello") }
val printMessage = { msg: String -> println(msg) }

fun main() {
    printHello()
    printMessage("hello world")
}
```
