
```kotlin
fun main() {
  val nums = listOf(1,2,3,4,5)
  val doubled = nums.map{ it * 2 }
  println(nums) // [1,2,3,4,5]
    
  val greaterThan4 = doubled.filter{it > 4}
  println(greaterThan4) // [6,8,10]
}
```
