#!/bin/bash

# break on error
set -e

cd $(dirname $0)

# compile using javac - using the classpath
rm -rf build
mkdir build

# unpack
mkdir build/unpacked
unzip product-service-0.0.1-SNAPSHOT.jar -d build/unpacked

# add module-info descriptor
javac $(find product.service.repacked.mod/src -name "*.java")
cp product.service.repacked.mod/src/main/java/*.class build/unpacked

# repackage
mkdir build/mp
cd build/unpacked
# use "-0" no compression, required by spring/java when reading inner-jars in spring-boot exec-jar
zip -r -0 ../mp/product.service.repacked.mod.jar *
cd -


# run

# using classpath
#java -jar build/libs/product-service-0.0.1-SNAPSHOT.jar

# using modules
#java -modulepath build/mp -m product.service.repacked.mod
# --> fails with error:
#   module product.service.repacked.mod does not have a MainClass attribute, use -m <module>/<main-class>
# maybe there is some more magic built into the module descriptor when built with java9 jar-cmd ?
# try adding -m <module>/<main-class> where main-class is taken from the existing manifest
java -modulepath build/mp -m product.service.repacked.mod/org.springframework.boot.loader.JarLauncher
# DOES NOT WORK - cannot be run as module even after adding some dependencies,
# Spring Boot flakes out with:
# Exception in thread "main" java.lang.IllegalStateException: java.lang.IllegalStateException: Unable to determine code source archive from file:/Users/hakan/Documents/lab/cadec-2016-java9-modules/demo3_repackage_springboot_app_as_module/build/mp/product.service.repacked.mod.jar!
# 	at org.springframework.boot.loader.ExecutableArchiveLauncher.<init>(product.service.repacked.mod/ExecutableArchiveLauncher.java:53)
# 	at org.springframework.boot.loader.ExecutableArchiveLauncher.<init>(product.service.repacked.mod/ExecutableArchiveLauncher.java:45)
# 	at org.springframework.boot.loader.JarLauncher.<init>(product.service.repacked.mod/JarLauncher.java:30)
# 	at org.springframework.boot.loader.JarLauncher.main(product.service.repacked.mod/JarLauncher.java:45)
# Caused by: java.lang.IllegalStateException: Unable to determine code source archive from file:/Users/hakan/Documents/lab/cadec-2016-java9-modules/demo3_repackage_springboot_app_as_module/build/mp/product.service.repacked.mod.jar!
# 	at org.springframework.boot.loader.Launcher.createArchive(product.service.repacked.mod/Launcher.java:151)
# 	at org.springframework.boot.loader.ExecutableArchiveLauncher.<init>(product.service.repacked.mod/ExecutableArchiveLauncher.java:50)

