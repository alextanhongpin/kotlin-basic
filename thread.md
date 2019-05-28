## Running a separate thread

```kotlin
import kotlin.concurrent.thread
import java.lang.Thread

fun main() {
    thread(start = true, name = "mythread") {
        var i: Int = 0
        while (i < 10) {
            println("hello, I'm running on a thread")
            i++
        }
    }
}
```

## Delaying start

```kotlin
import kotlin.concurrent.thread
import java.lang.Thread


fun main() {
    val t = thread(start=false, name="mythread") {
        var i: Int = 0
        while (i < 10) {
            println("hello world")
            i++
        }
    }
    t.start()
    Thread.sleep(1_000)
}
```
