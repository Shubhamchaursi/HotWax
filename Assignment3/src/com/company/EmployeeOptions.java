package com.company;

import java.io.*;
import java.util.ArrayList;
import java.util.Scanner;

public class EmployeeOptions {
    ArrayList<String> list = new ArrayList<String>();
    Scanner scan=new Scanner(System.in);
    private long ID;
    private String name;
    private String email;
    private int age;
    private String DOB;

    public long getID() {
        return ID;
    }

    public void setID(long ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getDOB() {
        return DOB;
    }

    public void setDOB(String DOB) {
        this.DOB = DOB;
    }

    //Employee Add Method:
    public void add(ArrayList<String> list)  {
        System.out.println("Enter employee ID:");
        setID(scan.nextLong());
        System.out.println("Enter employee Name:");
        scan.nextLine();
        setName(scan.nextLine());
        System.out.println("Enter employee email:");
        setEmail(scan.next());
        System.out.println("Enter employee Age:");
        setAge(scan.nextInt());
        System.out.println("Enter employee date of birth:");
        setDOB(scan.next());

        list.add(ID+","+name+","+email+","+age+","+DOB);
        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter("employee.txt", true));

            for (String rec : list) {
                writer.write(rec);
                writer.newLine();
            }
            writer.close();
        } catch (IOException e) {
            System.out.println("Exception catch:");
        }
    }

    //Employee Delete method:
    public void delete(ArrayList<String> list)
    {
        File file = new File("employee.txt");
        System.out.print("Enter the Employee ID ");
        Long deleteId = scan.nextLong();
        File tempFile = new File("temp.txt");
        try (FileWriter fileWriter = new FileWriter(tempFile);
             BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);
             FileReader fileReader = new FileReader(file);
             BufferedReader bufferedReader = new BufferedReader(fileReader)){

            String line;
            while( (line = bufferedReader.readLine()) != null ){
                if(line.contains(String.valueOf(deleteId))){
                    continue;
                }
                else {
                    bufferedWriter.write(line);
                }
            }
            file.delete();
            tempFile.renameTo(file);

        }catch (IOException e) {
            e.getMessage();


        }


    }

    //Employee Search method:
    public void search(ArrayList<String>list)
    {
        File file = new File("employee.txt");
        System.out.print("Please enter the Employee ID ");
        Long serId = scan.nextLong();
        File tempFile = new File("temp.txt");
        try (FileWriter fileWriter = new FileWriter(tempFile);
             BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);
             FileReader fileReader = new FileReader(file);
             BufferedReader bufferedReader = new BufferedReader(fileReader)){

            String line;
            while( (line = bufferedReader.readLine()) != null ) {
                if (line.contains(String.valueOf(serId))) {
                    System.out.println(line);
                }

            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}

