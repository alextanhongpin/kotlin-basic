## Infix with class

```kotlin
class InfixAccount {
    var balance = 0.0
    infix fun add(amount: Double) {
	this.balance = balance + amount
    }
}
fun main() {
    val acc = InfixAccount()
    acc add 10.0
    println(acc.balance)
}
```


## Infix with function extension

```kotlin

/*
fun equals(first: Any, second: Any): Unit {
    if (first != second) {
        throw RuntimeException("$first was not equal $second")
    }
}
*/
infix fun Any.equals(other: Any): Unit {
    if (this != other) {
        throw RuntimeException("$this was not equal $other")
    }
}

fun main() {
    // equals("foo", "bar")
    "foo" equals "bar"
}
```
