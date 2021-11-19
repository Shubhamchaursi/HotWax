package com.company;

import java.util.Scanner;

public class Circle extends Exception {
    Scanner scan=new Scanner(System.in);

    public Circle() {
    }

    void circle()
    {
        double PI=3.14;
        System.out.println("*****Menu*****");
        System.out.println("1-Area :");
        System.out.println("2-circumference:");

        System.out.println("Enter your choice:");
        int x=scan.nextInt();
        System.out.println("Enter radius:");
        double r=scan.nextDouble();
        switch(x)
        {
            case 1:
                if (r<1) {
                    try {
                        throw new Circle();
                    } catch (Circle circle) {
                        //circle.printStackTrace();
                        System.out.println("Radius Should be positive:");
                    }
                }else{

                    double area = PI * r * r;
                    System.out.println("Area of Circle=" + area);

                }
                break;
            case 2:
                if(r<1)
                {
                    try{
                        throw new Circle();
                    }catch (Circle circle)
                    {
                        System.out.println("Radius Should be positive:");
                    }
                }else {
                    double circumference = 2 * PI * r;
                    System.out.println("circumference of circle:" + circumference);
                }
                break;
            default:
                System.out.println("Invalid choice:");
                break;

        }

    }

}