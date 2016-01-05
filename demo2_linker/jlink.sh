#!/bin/bash

# Note: need to include the JDK modules in the modulepath - or we get an error like:
#   Error: Module java.base not found, required by se.callista.java9.modules.appminimal


# $JAVA_HOME/bin/jlink --help
#   --vm <client|server|minimal|all>     Select the HotSpot VM in the output image.  Default is all
# but using minimal gives an error:
#   Error: jdk.tools.jlink.plugin.PluginException: Selected VM minimal doesn't exist.
$JAVA_HOME/bin/jlink --vm server --modulepath $JAVA_HOME/jmods:build --addmods se.callista.java9.modules.appminimal --output build/linkedminimalapp

# run app
./build/linkedminimalapp/bin/se.callista.java9.modules.appminimal