http://callistaenterprise.se/blogg/teknik/2015/04/10/building-microservices-with-spring-cloud-and-netflix-oss-part-1/

$ git clone https://github.com/callistaenterprise/blog-microservices.git
$ cd blog-microservices
$ git checkout -b B1 M1.1


cd microservices/core/product-service
gradle clean build
java -jar build/libs/product-service-0.0.1-SNAPSHOT.jar

# set JAVA_HOME to jdk8 vs jdk9
