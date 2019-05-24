```kotlin
data class Planet(val name: String, val distance: Long)

val planets = listOf(Planet("Mercury", 10), Planet("Venus", 2))

fun main() {
    println(planets.first())
    println(planets.last())
    println(planets.get(1))
    println(planets.isEmpty())
    println(planets.isNotEmpty())
    println(planets.joinToString(","))
    println(planets.asReversed())
    println(planets.elementAtOrNull(10))
    println(planets.zip(arrayOf(10,20,30)).toList())
    planets.zip(arrayOf(10,20,30)).forEach {
        val (planet, diameter) = it
        println("planet $planet has diameter $diameter")
    }
    
	val reversePlanetName = planets.foldRight(StringBuilder()) {
        planet, builder -> builder.append(planet.name)
        builder.append(",")
    }
    println(reversePlanetName)
    
    val planetName = planets.map{it.name}
    println(planetName)
}
```
