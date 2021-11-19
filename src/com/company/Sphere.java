package com.company;

import java.util.Scanner;

public class Sphere extends Exception {
    Scanner scan=new Scanner(System.in);
    void sphere()
    {
        Scanner scan=new Scanner(System.in);
        double PI=3.14;
        System.out.println("*****Menu*****");
        System.out.println("1-Area :");
        System.out.println("2-Volume:");

        System.out.println("Enter your choice:");
        int x=scan.nextInt();
        System.out.println("Enter radius:");
        double r=scan.nextDouble();
        switch(x) {
            case 1:
                if (r < 1) {
                    try {
                        throw new Sphere();
                    } catch (Sphere sphere) {
                        System.out.println("Radius should be positive:");
                    }
                } else{

                    double area = 4 * PI * r * r;
                    System.out.println("Area of sphere=" + area);
                }
                break;
            case 2:
                if (r < 1) {
                    try {
                        throw new Sphere();
                    } catch (Sphere sphere) {
                        System.out.println("Radius should be positive:");
                    }
                }else {
                    double volume = (4 * PI * r * r * r) / 3;
                    System.out.println("circumference of circle:" + volume);
                }
                break;
            default:
                System.out.println("Invalid choice:");
                break;

        }

    }
}
