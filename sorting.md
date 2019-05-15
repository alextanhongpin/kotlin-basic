## Basic sorting in kotlin

```kotlin
fun bubbleSort(nums: Array<Int>) {
    for (i in 0 until nums.size) {
        for (j in i until nums.size) {
            if (nums[i] > nums[j]) {
                nums[i] = nums[j].also {nums[j] = nums[i]}
            }
        }
    }
}

fun insertionSort(nums: Array<Int>) {
    val n = nums.size
    for (i in 1 until n) {
        var j = i
	while (j > 0 && nums[j-1] > nums[j]) {
            nums[j-1] = nums[j].also{ nums[j] = nums[j-1] }
            j--
        }
    }
}


fun main() {
    run { 
        println("bubble sort:")
        val nums = arrayOf(-1,10,5,4,3,2,1)
	bubbleSort(nums)
	// Array is not pretty-printable.
    	println(nums.toList()) 
    }
    run { 
        println("\ninsertion sort:")
        val nums = arrayOf(-1,10,5,4,3,2,1)
	insertionSort(nums)
    	println(nums.toList())   
    }  
}
```

## Quick Sort

```kotlin
/**
 * You can edit, run, and share this code. 
 * play.kotlinlang.org 
 */

fun quickSort(nums: Array<Int>, lo: Int, hi: Int) {
	if (lo < hi) {
        val p = partition(nums, lo, hi)
        quickSort(nums, lo, p-1)
        quickSort(nums, p+1, hi)
    }   
}

fun partition(nums: Array<Int>, lo: Int, hi: Int): Int {
    val pivot = nums[hi]
    var i = lo
	for (j in lo until hi) {
        if (nums[j] < pivot) {
			nums[i] = nums[j].also { nums[j] = nums[i] }  
            i++
        }
    }
	nums[i] = nums[hi].also { nums[hi] = nums[i] }
    return i
}

fun main() {
    val nums = arrayOf(5,3,4,2,1)
	quickSort(nums, 0, nums.size-1)
    println(nums.toList())
}
```
