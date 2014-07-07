#!/bin/bash
set -e
set -x

export HADOOP_CLASSPATH=postgresql-9.3-1101.jdbc41.jar:$HADOOP_CLASSPATH

sqoop codegen --connect jdbc:postgresql://10.27.10.66/sourcedb --username niklas --password hejsan --table customers --class-name customers --bindir . --driver org.postgresql.Driver --connection-manager org.apache.sqoop.manager.GenericJdbcManager

sqoop codegen --connect jdbc:postgresql://10.27.10.66/sourcedb --username niklas --password hejsan --table orders --class-name orders --bindir . --driver org.postgresql.Driver --connection-manager org.apache.sqoop.manager.GenericJdbcManager

sqoop codegen --connect jdbc:postgresql://10.27.10.66/sourcedb --username niklas --password hejsan --table employees --class-name employees --bindir . --driver org.postgresql.Driver --connection-manager org.apache.sqoop.manager.GenericJdbcManager

sqoop codegen --connect jdbc:postgresql://10.27.10.66/sourcedb --username niklas --password hejsan --table departments --class-name departments --bindir . --driver org.postgresql.Driver --connection-manager org.apache.sqoop.manager.GenericJdbcManager

sqoop codegen --connect jdbc:postgresql://10.27.10.66/sourcedb --username niklas --password hejsan --table managers --class-name managers --bindir . --driver org.postgresql.Driver --connection-manager org.apache.sqoop.manager.GenericJdbcManager

hadoop fs -copyFromLocal orders.jar /user/niklas.andersen/workflows/import/table_jars
hadoop fs -copyFromLocal managers.jar /user/niklas.andersen/workflows/import/table_jars
hadoop fs -copyFromLocal employees.jar /user/niklas.andersen/workflows/import/table_jars
hadoop fs -copyFromLocal departments.jar /user/niklas.andersen/workflows/import/table_jars
hadoop fs -copyFromLocal customers.jar /user/niklas.andersen/workflows/import/table_jars 
