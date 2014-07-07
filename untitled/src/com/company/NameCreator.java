package com.company;
import java.util.*;

/**
 * Created by niklas on 6/16/14.
 */
public class NameCreator {
    Random rand = new Random();
    public String createName(int x){
        int j = rand.nextInt(6)+x;
        String name  = String.valueOf(Character.toChars(rand.nextInt(25)+65));
        while(j>0){
        name += String.valueOf(Character.toChars(rand.nextInt(25)+97));
        j--;
        }
        return name;
    }
}
