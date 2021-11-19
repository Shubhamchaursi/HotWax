package com.company;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.util.ArrayList;
import java.util.List;

public class DeserializationTest {
    public static void main(String[] arg) {


        try (FileInputStream fileInputStream = new FileInputStream("output1.ser")) {
            try (ObjectInputStream objectInputStream = new ObjectInputStream(fileInputStream)) {

                List<Student> students = (ArrayList<Student>) objectInputStream.readObject();

                if (students != null) {
                    for (Student student : students) {
                        System.out.println(student.toString());
                    }
                }

            } catch (FileNotFoundException f) {
                f.getMessage();
            } catch (IOException ioException) {
                ioException.getMessage();
            } catch (ClassNotFoundException e) {
                e.getMessage();
            }
        } catch (IOException ioException) {
            ioException.printStackTrace();
        }
    }
}