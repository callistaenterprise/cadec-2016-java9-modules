#!/bin/bash

# break on error
set -e

cd $(dirname $0)

# compile using javac - using the classpath
rm -rf build
mkdir build

# skip using target-dir for simplicity in example, just generate binary into the source tree
#rm -rf app1/target
#mkdir app1/target
#javac -d app1/target -cp build/common-lib.jar $(find app1/src -name "*.java")
#jar cvf build/app1.jar -C app1/target se

javac $(find app-minimal/src -name "*.java")
# set main class in manifest
jar cvfe build/se.callista.java9.modules.appminimal.jar se.callista.java9.modules.appminimal.App -C app-minimal/src/main/java .


# run
date
java -jar build/se.callista.java9.modules.appminimal.jar