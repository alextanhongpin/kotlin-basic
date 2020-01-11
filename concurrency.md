## Threads

```kotlin
import java.lang.Thread
import java.lang.Runnable
import kotlin.concurrent.thread
import java.util.concurrent.BlockingQueue
import java.util.concurrent.LinkedBlockingDeque
import kotlin.random.Random

class ProducerTask(val queue: BlockingQueue<Int>) {
    @Volatile var running = true
    private val random = Random
    
    fun run() {
        while (running) {
            Thread.sleep(1000)
            queue.put(random.nextInt())
        }
    }
}

class InterruptableConsumerTask(val queue: BlockingQueue<Int>): Runnable {
    override fun run() {
        try {
            while (!Thread.interrupted()) {
                val element = queue.take()
                println("I am processing element $element")
            }
        } catch (e: InterruptedException) {
            // Shutting down...
            println("interruped")
        }
    }
}

fun main() {
    val queue = LinkedBlockingDeque<Int>()
    val consumerTasks = (1..6).map {
        InterruptableConsumerTask(queue)
    }
    val producerTask = ProducerTask(queue)
    
    val consumerThreads = consumerTasks.map {
        thread { it.run() }
    }
    val producerThread = thread { producerTask.run() }
    consumerThreads.forEach { it.interrupt() }
    producerTask.running = false
    Thread.sleep(5000)
}
```

## Thread Pool

Create an executor with an internal pool of threads running up to n tasks concurrently

```kotlin
import java.lang.Thread
import java.util.concurrent.Executors
import java.util.concurrent.TimeUnit

fun main() {
    val executor = Executors.newFixedThreadPool(4)
    for (k in 1..10) {
        executor.submit {
            println("Processing element $k in thread ${Thread.currentThread()}")
        }
    }
    executor.shutdown()
    executor.awaitTermination(1, TimeUnit.MINUTES)
}
```

## Monitors
```kotlin
fun main () {
    val obj = Any()
    synchronized(obj) {
        println("I hold the monitor for $obj")
    }
}
```

## Locks

```kotlin
import java.util.concurrent.locks.*
import kotlin.concurrent.*

fun main () {
	val lock = ReentrantLock()
    if (lock.tryLock()) {
        println("I have the lock")
        lock.unlock()
    } else {
        println("I don't have the lock")
    }
    
    var lock2 = ReentrantLock()
    try {
        lock2.lockInterruptibly()
        println("I have the lock")
        lock.unlock()
    } catch(e: InterruptedException) {
        println("I was interrupted")
    }
    
    val lock3 = ReentrantLock()
    lock3.withLock {
        println("I have the lock")
    }
}
```

## The bounded buffer problem

The bounded buffer (or producer-consumer) problem is a classic in concurrency. The problem to be solved is this: having a producer who would generate items to be put into a fixed size buffer and a consumer who would read these items. The producer should not try to generate items if the buffer is full, and the consumer should not try to read items if the buffer is empty.

```kotlin
import java.util.concurrent.Semaphore
import kotlin.random.Random
import kotlin.concurrent.thread

fun main() {
    val emptyCount = Semaphore(8)
    val fillCount = Semaphore(0)
    val mutex = Semaphore(1)
    val buffer = mutableSetOf<Int>()
    
    thread {
        while (true) {
            emptyCount.acquire()
            mutex.acquire()
            buffer.plus(Random.nextInt())
            mutex.release()
            fillCount.release()
        }
    }
    
    thread {
        while(true) {
            fillCount.acquire()
            mutex.acquire()
            val item = buffer.remove(0)
            mutex.release()
            println("Consumed item $item")
            emptyCount.release()
        }
    }
}
```


## Bounded Buffer Problem

Solving the bounded buffer problem with LinkedBlockingQueue:

```kotlin
import java.util.concurrent.LinkedBlockingQueue
import kotlin.random.Random
import kotlin.concurrent.thread

fun main() {
    val buffer = LinkedBlockingQueue<Int>()
    
    thread {
        while (true) {
            buffer.put(Random.nextInt())
        }
    }
    
    thread {
        while(true) {
            val item = buffer.take(0)
            println("Consumed item $item")
        }
    }
}
```

## Atomic Variables

There is also AtomicReference class for reference types.

```kotlin
import java.util.concurrent.atomic.*
import kotlin.concurrent.thread

fun main() {
    val counter = AtomicLong(0)
    (1..8).forEach {
        thread {
            var i = 0
            while (i < 10) {
                i++
                val id = counter.incrementAndGet()
                println("Creating item with id $id")
            }
        }
    }
}
```

## CountDownLatch

```kotlin
import java.util.concurrent.CountDownLatch
import java.util.concurrent.Executors
import kotlin.concurrent.thread

data class Feed(val name: String, val url: String)

fun processFeed(feed: Feed) {
    val (name) = feed
    println("Processing feed ${name}")
}

fun sendNotification() {
    println("Sending notification")
}

fun main() {
    val feeds = listOf(
    	Feed("John Doe Website", "http://john.doe"),
    	Feed("Hello World Site", "http://hello.world"))
    
    val latch = CountDownLatch(feeds.size)
    val executor = Executors.newCachedThreadPool()
    for (feed in feeds) {
        executor.submit {
            processFeed(feed)
            latch.countDown()
        }
    }
    latch.await()
    println("All feeds completed")
    sendNotification()
}
```

## Future 
```kotlin
import java.util.concurrent.Future
import java.util.concurrent.Callable
import java.util.concurrent.Executors
import java.util.concurrent.CompletableFuture
import java.util.function.Supplier
import java.lang.Thread

fun main() {
    val executor = Executors.newFixedThreadPool(4)
    /*
    val sqrtFuture: Future<Double> = executor.submit(Callable<Double> {
       Math.sqrt(15.64)
    })
    println(sqrtFuture)
    */
    
    val future = CompletableFuture.supplyAsync(Supplier {
        Math.sqrt(15.64)
    }, executor)
    future.thenApply {
        println("done")
        println("$it")
    }
    Thread.sleep(1000)
}
```
