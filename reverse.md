## Reversing Integer without converting them to string
```kotlin
fun main() {
    // This is immutable.
    val num = 12345
    // We can copy immutable primitives value to a mutable var.
    var tmp = num
    var rev = 0
    while (tmp > 0) {
        rev = rev*10 + tmp %10
        tmp /= 10
    }
    println("num: $num, tmp: $tmp, rev: $rev")
}
```
