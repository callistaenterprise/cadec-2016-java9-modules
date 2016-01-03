#!/bin/bash

jdeps -s -M -include-system-modules java.sql.Timestamp

jdeps -s -mp build build/se.callista.java9.modules.app1.jar
