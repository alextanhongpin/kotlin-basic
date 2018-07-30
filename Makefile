FILE := main
kotlin:
	kotlinc ${FILE}.kt -include-runtime -d ${FILE}.jar
	java -jar ${FILE}.jar
