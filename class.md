## Class
```kotlin
class Person constructor(val firstName: String, val lastName: String, val age: Int?) {
	init {
		require(firstName.trim().length > 0) { "Invalid firstName argument" }
		require(lastName.trim().length > 0) { "Invalid lastName argument" }
		if (age != null) {
			require(age >= 0 && age <= 150) { "Invalid age argument"}
		}
	}
}

fun main() {
	val person1 = Person("John", "Doe", 20)
    val person2 = Person("Jane", "Doe", null)
    
    println("person1 name is ${person1.firstName} ${person1.lastName}, age is ${person1.age}")
    println("person2 name is ${person2.firstName} ${person2.lastName}, age is ${person2?.age ?: "?"}")
}
```

## Nested Class

```kotlin
class BasicGraph(val name: String) {
    class Line(val x1: Int, val y1: Int, val x2: Int, val y2: Int) {
        fun draw(): Unit {
            println("drawing from ($x1, $y1) to ($x2, $y2)")
        }
    }
    fun draw(): Unit {
        println("drawing the graph $name")
    }
}

fun main() {
    val line = BasicGraph.Line(1, 0, -1, 2)
    line.draw()
}
```
