```kotlin
fun roots(k: Int): Pair<Double, Double> {
    require(k >= 0)
    val root = Math.sqrt(k.toDouble())
    return Pair(root, -root)
}

fun main() {
    val (a, b) = roots(24)
    println("a=$a, b=$b")
}
```
