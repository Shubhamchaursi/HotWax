package com.company;

public class Account extends Thread
{

    double amount;
    Account(double amount){
        this.amount =amount;
    }


    public double getAmount() {
        return amount;
    }


    public void withdraw(double withdrawAmt){
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