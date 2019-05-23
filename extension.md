## Function extension

```kotlin
class Submarine

fun Submarine.fire() = println("submerging")

fun main() {
	val submarine = Submarine()
    submarine.fire()
}
```
