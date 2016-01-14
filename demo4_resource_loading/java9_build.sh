#!/bin/bash

# break on error
set -e

cd $(dirname $0)

# compile using Maven - using the classpath
#cd common-lib
#mvn clean install
#cd ..
#cd app1
#mvn clean install
#cd ..

# compile using javac - using the classpath
rm -rf build
mkdir build

# skip using target-dir for simplicity in example, just generate binary into the source tree
#rm -rf common-lib/target
#mkdir common-lib/target
#javac -d common-lib/target $(find common-lib/src -name "*.java")
#jar cvf build/common-lib.jar -C common-lib/target se

#rm -rf app1/target
#mkdir app1/target
#javac -d app1/target -cp build/common-lib.jar $(find app1/src -name "*.java")
#jar cvf build/app1.jar -C app1/target se

javac $(find common-lib/src -name "*.java")
jar cvf build/se.callista.java9.modules.common.jar -C common-lib/src/main/java . -C common-lib/src/main/resources .

javac -modulepath build $(find app1/src -name "*.java")
jar cvf build/se.callista.java9.modules.app1.jar -C app1/src/main/java . -C app1/src/main/resources .

# run
java -modulepath build -m se.callista.java9.modules.app1/se.callista.java9.modules.app1.App1
