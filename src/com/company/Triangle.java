package com.company;

import java.util.Scanner;

public class Triangle extends Exception{
    Scanner scan=new Scanner(System.in);
    void triangle()
    {

        System.out.println("*****Menu*****");
        System.out.println("1-Area");
        System.out.println("2-Perimeter");
        System.out.println("Enter choice:");
        int x=scan.nextInt();
        System.out.println("Enter height:");
        double height=scan.nextDouble();
        System.out.println("Enter base:");
        double base=scan.nextDouble();
        System.out.println("Enter hypotenuse:");
        double hypo=scan.nextDouble();

        switch(x)
        {
            case 1:
                if(height<1 || base<1)
                {
                    try {
                        throw new Triangle();
                    } catch (Triangle triangle) {
                        System.out.println("Height & Base should be positive:");
                    }
                }else {
                    double area = (height * base) / 2;
                    System.out.println("Area of triangle= " + area);
                }
                break;
            case 2:
                if(height<1 || base<1 || hypo<1)
                {
                    try {
                        throw new Triangle();
                    } catch (Triangle triangle) {
                        System.out.println("Height,Base & Hypo should be positive:");
                    }
                }else {
                    double perimeter = height + base + hypo;
                    System.out.println("Perimeter of Triangle=" + perimeter);
                }
                break;
            default:
                System.out.println("Invalid choice:");
                break;
        }

    }
}