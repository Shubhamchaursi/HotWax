package com.company;

import java.util.Scanner;

public class Square extends Exception{
    Scanner scan=new Scanner(System.in);
    void square()
    {
        System.out.println("*****Menu*****");
        System.out.println("1-Area");
        System.out.println("2-Perimeter");
        System.out.println("Enter choice:");
        int x=scan.nextInt();
        System.out.println("Enter Side:");
        double side=scan.nextDouble();

        switch(x)
        {
            case 1:
                if(side<1)
                {
                    try{
                        throw new Square();
                    } catch (Square square) {
                        System.out.println("Side should be positive:");
                    }
                }else {
                    double area = side * side;
                    System.out.println("Area of Square= " + area);
                }
                break;
            case 2:
                if(side<1) {
                    try {
                        throw new Square();
                    } catch (Square square) {
                        System.out.println("Side should be positive:");
                    }
                }else {
                    double perimeter = 4 * side;
                    System.out.println("Perimeter of Square=" + perimeter);
                }
                break;
            default:
                System.out.println("Invalid choice:");
                break;
        }

    }

}

