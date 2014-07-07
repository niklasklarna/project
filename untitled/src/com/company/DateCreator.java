package com.company;
import java.util.*;

/**
 * Created by niklas on 6/16/14.
 */
public class DateCreator {
    private static final String year = "2013";
    Random generator = new Random();

    public String createDate(){
        String yr = year;
        int month = generator.nextInt(11)+1;
        if (month < 10){
            yr = yr + "-0" + Integer.toString(month);
        }
        else{
            yr = yr + "-" + Integer.toString(month);
        }
        int day = generator.nextInt(27)+1;
        if(day < 10){
            yr += "-0" + Integer.toString(day);
        }
        else{
            yr += "-" +Integer.toString(day);
        }
        return yr;
    }
}
