package com.company;

/**
 * Created by niklas on 6/16/14.
 */
import java.util.*;

public class NumberCreator {

    Random rand = new Random();

    public int createIntUpTo(int x){
        return rand.nextInt(x)+1;
    }

    public String createSSN(){
        String createdSSN;
        String y = "";
        String m = "";
        String d = "";
        String lastFour = "";
        int x;
        x = rand.nextInt(100);
        if (x<10){
            y += "0";
        }
        y += Integer.toString(x);
        int month = rand.nextInt(11)+1;
        if (month < 10){
            m += "0";
        }
        m += Integer.toString(month);
        int day = rand.nextInt(27)+1;
        if(day < 10){
            d += "0";
        }
        d += Integer.toString(day);
        int i = 0;
        for (i=0;i<4;i++){
            lastFour += Integer.toString(rand.nextInt(10));
        }
        createdSSN = y + m +  d + lastFour;
        return createdSSN;
    }

}