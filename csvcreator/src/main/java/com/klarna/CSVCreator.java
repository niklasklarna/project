package com.klarna;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

/**
 * Created by niklas on 6/16/14.
 */
public class CSVCreator {

    NameCreator namer = new NameCreator();
    NumberCreator numberer = new NumberCreator();
    DateCreator dater = new DateCreator();

    public void createDepartments(int x){
        File outFile = new File("target/Departments.csv");
        String name, city;
        try {
            FileWriter fWriter = new FileWriter(outFile);
            BufferedWriter writer = new BufferedWriter(fWriter);
            int i = 0;
            for (i=0;i<x;i++){
                name = namer.createName(3);
                city = namer.createName(7);
                writer.write(Integer.toString(i+1) + "," + name + "," + city + "\n");
            }
            writer.close();
        }
        catch(IOException ioe){
            ioe.printStackTrace();
        }
    }

    public void createManagers(int x, int y){
        File outFile = new File("target/Managers.csv");
        String FName, LName, date;
        int DeptID;
        try {
            FileWriter fWriter = new FileWriter(outFile);
            BufferedWriter writer = new BufferedWriter(fWriter);
            int i = 0;
            for (i=0;i<x;i++){
                DeptID = numberer.createIntUpTo(y);
                FName = namer.createName(3);
                LName = namer.createName(3);
                date = dater.createDate();
                writer.write(Integer.toString(i+1) + "," + DeptID + "," + FName + "," + LName + "," + date + "\n");
            }
            writer.close();
        }
        catch(IOException ioe){
            ioe.printStackTrace();
        }
    }

    public void createEmployees(int x, int y){
        File outFile = new File("target/Employees.csv");
        int DeptID;
        int EmpID = 0;
        String FName, LName, date, SSN;
        try {
            FileWriter fWriter = new FileWriter(outFile);
            BufferedWriter writer = new BufferedWriter(fWriter);
            int i = 0;
            for(i=0;i<x;i++){
                EmpID +=1;
                DeptID = numberer.createIntUpTo(y);
                FName = namer.createName(3);
                LName = namer.createName(3);
                SSN = numberer.createSSN();
                date = dater.createDate();
                writer.write(Integer.toString(i+1) + "," + DeptID + "," + FName + "," + LName + "," + SSN + "," + date + "\n");
            }
            writer.close();
        }
        catch(IOException ioe){
            ioe.printStackTrace();
        }
    }

    public void createCustomers(int x){
        File outFile = new File("target/Customers.csv");
        String FName, LName, Street, City;
        try {
            FileWriter fWriter = new FileWriter(outFile);
            BufferedWriter writer = new BufferedWriter(fWriter);
            int i = 0;
            for (i=0;i<x;i++){
                FName = namer.createName(3);
                LName = namer.createName(3);
                Street = namer.createName(12);
                City = namer.createName(7);
                writer.write(Integer.toString(i+1) + "," + FName + "," + LName + "," + Street + "," + City + "\n");
            }
            writer.close();
        }
        catch(IOException ioe){
            ioe.printStackTrace();
        }
    }
    public void createOrders(int x, int y, int z){
        File outFile = new File("target/Orders.csv");
        int SellerID, Amount, CustomerID;
        String date;
        try {
            FileWriter fWriter = new FileWriter(outFile);
            BufferedWriter writer = new BufferedWriter(fWriter);
            int i = 0;
            for (i=0;i<x;i++){
                SellerID = numberer.createIntUpTo(y);
                Amount = numberer.createIntUpTo(10000);
                date = dater.createDate();
                CustomerID = numberer.createIntUpTo(z);
                writer.write(Integer.toString(i+1) + "," + SellerID + "," + Amount + "," + date + "," + CustomerID + "\n");
            }
            writer.close();
        }
        catch(IOException ioe){
            ioe.printStackTrace();
        }
    }
}
