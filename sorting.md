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
    	for (i in nums) {
        	println(i)
	    }    
    }
    run { 
        println("\ninsertion sort:")
        val nums = arrayOf(-1,10,5,4,3,2,1)
	    insertionSort(nums)
    	for (i in nums) {
        	println(i)
	    }    
    }  
}
```
