package com.company;

import java.io.Serializable;

public class Student implements Serializable {
    private String firstName;
    private String dateOfBirth;
    public Student(String firstName,String dateOfBirth)
    {
        this.firstName=firstName;
        this.dateOfBirth=dateOfBirth;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    @Override
    public String toString() {
        return "Student{" +
                "firstName='" + firstName + '\'' +
                ", dateOfBirth='" + dateOfBirth + '\'' +
                '}';
    }
}