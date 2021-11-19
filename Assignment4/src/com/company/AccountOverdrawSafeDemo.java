package com.company;

public class AccountOverdrawSafeDemo extends Thread{
    double amount;
    AccountOverdrawSafeDemo(double amount)
    {
        this.amount =amount;
    }


    public double getAmount() {
        return amount;
    }

    synchronized void withdraw1 (double withdrawAmt){
        Thread t=Thread.currentThread();
        if(getAmount()>= withdrawAmt){
            System.out.println("Before Withdraw Account balance of "+t.getName()+" is "+getAmount());
            amount=getAmount()-withdrawAmt;
            System.out.println(withdrawAmt+"Amount debited by "+t.getName()+" and current amount is "+getAmount());

        }else{
            System.out.println("Not enough balance for "+t.getName());
        }
    }


}
class SynchronizeDemo extends Thread {
    AccountOverdrawSafeDemo a1 = new AccountOverdrawSafeDemo(1000.00);
    public void run() {
        a1.withdraw1(500.0);
    }
}