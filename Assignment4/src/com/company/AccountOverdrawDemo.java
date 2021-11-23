package com.company;

import java.util.Scanner;

public class AccountOverdrawDemo extends Thread {
    Account account = new Account(1000.00);

    public  void run() {
        account.withdraw(1000);
    }
}

class Main
{
    public static void main(String []arg) {
        Scanner scan=new Scanner(System.in);
        AccountOverdrawDemo AC = new AccountOverdrawDemo();
        Thread t1 = new Thread(AC, "Shubham");
        Thread t2 = new Thread(AC, "Chaursiya");
        SynchronizeDemo AC1 = new SynchronizeDemo();
        Thread user1 = new Thread(AC1, "Vikas");
        Thread user2 = new Thread(AC1, "Rohit");

        while (true)
        {
            System.out.println("=====MENU=====");
            System.out.println("1-When comes overlapping problem:");
            System.out.println("2-After resolving overlapping problem:");
            System.out.println("3-Exit");
            System.out.println("Enter your choice:");
            int choice=scan.nextInt();
            switch (choice)
            {
                case 1:
                    t1.start();
                    t2.start();
                    break;
                case 2:

                    user1.start();
                    user2.start();
                    break;
                case 3:
                    System.exit(0);
                    break;
                default:
                    System.out.println("Invalid choice:");
                    break;

            }

        }



    }

}