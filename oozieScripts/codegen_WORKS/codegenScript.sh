#!/bin/bash
hadoop fs -rm /user/niklas.andersen/jars/*.jar
sqoop codegen --connect jdbc:postgresql://10.27.10.66/sourcedb --username niklas --password hejsan --table orders --class-name orders --bindir . 
sqoop codegen --connect jdbc:postgresql://10.27.10.66/sourcedb --username niklas --password hejsan --table managers --class-name managers --bindir . 
sqoop codegen --connect jdbc:postgresql://10.27.10.66/sourcedb --username niklas --password hejsan --table departments --class-name departments --bindir . 
sqoop codegen --connect jdbc:postgresql://10.27.10.66/sourcedb --username niklas --password hejsan --table customers --class-name customers --bindir . 
sqoop codegen --connect jdbc:postgresql://10.27.10.66/sourcedb --username niklas --password hejsan --table employees --class-name employees --bindir . 
hadoop fs -copyFromLocal *.jar /user/niklas.andersen/jars


