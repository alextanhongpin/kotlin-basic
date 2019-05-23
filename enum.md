## Enum

```kotlin
enum class Day { MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY }

enum class Planet(val mass: Double, val radius: Double) {
    MERCURY(3.303e+23, 2.4397e6)
}

fun main() {
    println(Day.valueOf("MONDAY"))
    println(Day.values().toList())
    println(Planet.valueOf("MERCURY").mass)
    println(Planet.values().toList())
}
```
