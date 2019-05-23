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
