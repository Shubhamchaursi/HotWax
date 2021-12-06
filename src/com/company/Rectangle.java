package com.company;

import java.util.Scanner;

public class Rectangle extends Exception {
    Scanner scan = new Scanner(System.in);
    void rectangle() {

        System.out.println("*****Menu*****");
        System.out.println("1-Area");
        System.out.println("2-Perimeter");
        System.out.println("Enter choice:");
        int x = scan.nextInt();
        System.out.println("Enter length:");
        double length = scan.nextDouble();
        System.out.println("Enter width");
        double width = scan.nextDouble();
        switch (x) {
            case 1:
                if(length<1 || width<1)
                {
                    try{
                        throw new Rectangle();
                    } catch (Rectangle rectangle) {
                        System.out.println("Length and Width should be positive:");
                    }
                }else {
                    double area = length * width;
                    System.out.println("Area of Rectangle= " + area);
                }
                break;
            case 2:
                if(length<1 || width<1) {
                    try {
                        throw new Rectangle();
                    } catch (Rectangle rectangle) {
                        System.out.println("Length and Width should be positive:");
                    }
                }else{
                    double perimeter = 2 * (length + width);
                    System.out.println("Perimeter of Rectangle=" + perimeter);
                }
                break;
            default:
                System.out.println("Invalid choice:");
                break;
        }

    }
}