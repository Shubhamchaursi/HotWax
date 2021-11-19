package com.company;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;

public class SerializationTest {
    public static void main(String []arg)
    {
        Student student1=new Student("Shubham","05-June-2001");
        Student student2=new Student("Shalini","10-May-1999");
        Student student3=new Student("Bhavna","29-Feb-2000");
        Student student4=new Student("Yachna","12-june-1995");
        Address address1=new Address("Rewa","M.P.",486553,"India");
        Address address2=new Address("Rewa","M.P.",486553,"India");
        Address address3=new Address("Betul","M.P.",486550,"India");
        Address address4=new Address("Betul","M.P.",486550,"India");
        List<Student> list=new ArrayList<>();
        list.add(student1);
        list.add(student2);
        list.add(student3);
        list.add(student4);
        try {
            FileOutputStream fos=new FileOutputStream("output1.ser");
            ObjectOutputStream oos=new ObjectOutputStream(fos);
            oos.writeObject(list);

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}
