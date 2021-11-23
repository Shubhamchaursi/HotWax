package com.company;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Main
{

    // Main Method:
    public static void main(String[] args) {
        Scanner scan=new Scanner(System.in);
        Circle c1=new Circle();
        Rectangle r1=new Rectangle();
        Triangle t1=new Triangle();
        Square s1=new Square();
        Sphere s=new Sphere();
        boolean i=true;
        try {

            while (i)
            {
                System.out.println("****Main Menu****");
                System.out.println("1-Circle");
                System.out.println("2-Rectangle");
                System.out.println("3-Triangle");
                System.out.println("4-Square");
                System.out.println("5-Sphere");
                System.out.println("Enter your choice:");
                int x=scan.nextInt();
                switch(x)
                {
                    case 1:
                        c1.circle();
                        break;
                    case 2:
                        r1.rectangle();
                        break;
                    case 3:
                        t1.triangle();
                        break;
                    case 4:
                        s1.square();
                        break;
                    case 5:
                        s.sphere();
                        break;
                    default:
                        System.out.println("Invalid choice:");
                        break;

                }
                System.out.println("If you want to continue press true other wish press false:");
                i = scan.nextBoolean();
            }
        }catch(InputMismatchException e)
        {
            System.out.println("Please Enter Boolean value:");
        }



    }
}
