package com.company;
import java.io.*;
import java.io.FileWriter;
import java.io.IOException;

public class Main {

    public static void main(String[] args){
        int numberOfManagers = 100;
        int numberOfDepartments = 100;
        int numberOfEmployees = 100000;
        int numberOfCustomers = 300000;
        int numberOfOrders = 1000000;
        CSVCreator csvMaker = new CSVCreator();
        csvMaker.createDepartments(numberOfDepartments);
        csvMaker.createManagers(numberOfManagers, numberOfDepartments);
        csvMaker.createEmployees(numberOfEmployees, numberOfDepartments);
        csvMaker.createCustomers(numberOfCustomers);
        csvMaker.createOrders(numberOfOrders, numberOfEmployees, numberOfCustomers);
    }
}
