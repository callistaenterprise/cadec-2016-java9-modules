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
java -modulepath build/mp -jar build/mp/product.service.repacked.mod.jar
