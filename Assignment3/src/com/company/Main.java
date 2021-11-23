package com.company;

import java.util.ArrayList;
import java.util.Scanner;

public class Main {

    public static void main(String[] args){
        ArrayList<String> list=new ArrayList<>();
        Scanner scan=new Scanner(System.in);
        EmployeeOptions ep=new EmployeeOptions();
        boolean x=true;
        while(x)
        {
            System.out.println("*****MENU*****");
            System.out.println("1-Add.");
            System.out.println("2-Delete.");
            System.out.println("3-Search.");
            System.out.println("Enter your choice:");
            int choice=scan.nextInt();
            switch (choice)
            {
                case 1:
                    ep.add(list);
                    break;
                case 2:
                    ep.delete(list);
                    break;
                case 3:
                    ep.search(list);
                    break;
                default:
                    System.out.println("Invalid choice:");
                    break;
            }
            System.out.println("if you want to continue press true other wish press false:");
            x=scan.nextBoolean();
        }
    }

}
