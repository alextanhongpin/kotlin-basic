## Interface and implementation

```kotlin
interface Document {
    val version: Long
    val size: Long
    
    val name: String
    get () = "NoName"
    
    fun getDescription(): String {
        return "Document $name has $size byte(-s)"
    }
}

class DocumentImpl: Document {
    override val version: Long
    get() = 0
    
    override val size: Long
    get() = 0
}
fun main() {
    val doc = DocumentImpl()
    println(doc.getDescription())
}
```

## Multiple interface


```kotlin
interface Drivable {
    fun drive()
}

interface Sailable {
    fun sail()
}

class AmphibiousCar: Drivable, Sailable {
    override fun drive() {
        println("driving")
    }
    override fun sail() {
        println("sailing")
    }
}

fun main() {
    val car = AmphibiousCar()
	car.sail()
    car.drive()
}
```
