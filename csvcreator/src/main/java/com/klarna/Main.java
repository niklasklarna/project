package com.klarna;
import java.io.*;
import java.io.FileWriter;
import java.io.IOException;

public class Main {

    public static void main(String[] args){

        System.out.println("\ncsvcreator running...");
        int numberOfCustomers, numberOfDepartments, numberOfEmployees, numberOfManagers, numberOfOrders;
        if (args.length<0){
            numberOfCustomers = Integer.parseInt(args[0]);
            numberOfDepartments = Integer.parseInt(args[1]);
            numberOfEmployees = Integer.parseInt(args[2]);
            numberOfManagers = Integer.parseInt(args[3]);
             numberOfOrders = Integer.parseInt(args[4]);
        }
        else{
            numberOfManagers = 100;
            numberOfDepartments = 100;
            numberOfEmployees = 100000;
            numberOfCustomers = 300000;
            numberOfOrders = 1000000;
        }
        CSVCreator csvMaker = new CSVCreator();
        csvMaker.createDepartments(numberOfDepartments);
        csvMaker.createManagers(numberOfManagers, numberOfDepartments);
        csvMaker.createEmployees(numberOfEmployees, numberOfDepartments);
        csvMaker.createCustomers(numberOfCustomers);
        csvMaker.createOrders(numberOfOrders, numberOfEmployees, numberOfCustomers);
    }
}
