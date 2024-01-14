package io.loopcamp.jdbctest.day01;

import java.sql.*;

public class P02_FlexibleNavigation {
    public static void main(String[] args) throws SQLException {


        // Connection String - these are info that we need to make connection
        String dbUrl = "jdbc:oracle:thin:@54.224.70.64:1521:XE";
        String dbUsername = "hr";
        String dbPassword = "hr";


        // DriverManager is a class and has getConnection(); method which is used to create the CONNECTION
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);


        // We create Statement reference from Connection to execute the Query
        Statement stmnt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        // ResultSet.TYPE_SCROLL_INSENSITIVE --- > This will help us to be able to scroll the cursor dynamically or to be able to jump directly to the certain rows
        // ResultSet.CONCUR_READ_ONLY ---------- > With this, we are saying that I do not want to change anything in database. It makes the object reference immutable


        //Using the stmnt reference to execute the query and store the result into rs
        ResultSet rs = stmnt.executeQuery("SELECT * FROM EMPLOYEES");

        rs.next();
        System.out.println("FIRST NAME ofr 1st row: " + rs.getString("FIRST_NAME"));
        System.out.println("PHONE NUMBER for 1st row: " + rs.getString(5));


        // get me all the salary info for each row
        while (rs.next()) {
            System.out.println("Salary for each row: " + rs.getDouble("SALARY"));
        }


        // This will give us an exception
        // System.out.println("FIRST NAME: " + rs.getString("FIRST_NAME"));



        System.out.println();
        // This will help us to jum to the first row
        rs.first();
        System.out.println("FIRST NAME: " + rs.getString("FIRST_NAME"));


        System.out.println();
        // How can I jump to the 9th row and print the last_name
        rs.absolute(9);
        System.out.println("Last name in row 9th: " + rs.getString("LAST_NAME"));


        System.out.println();
        // Can you get first name, last name and salary for the row number 12th.
        rs.absolute(12);
        System.out.println("Row 12 info:");
        System.out.println("\tFirst Name: "  + rs.getString("FIRST_NAME"));
        System.out.println("\tLast Name: "  + rs.getString("LAST_NAME"));
        System.out.println("\tSalary: $"  + rs.getString("SALARY"));


        System.out.println();
        //Can you get me the first name, last name, salary for the last row
        rs.last();
        System.out.println("Last row info:");
        System.out.println("\tFirst Name: "  + rs.getString("FIRST_NAME"));
        System.out.println("\tLast Name: "  + rs.getString("LAST_NAME"));
        System.out.println("\tSalary: $"  + rs.getString("SALARY"));


        System.out.println();
        //Can you get me the first name, last name, salary for the person is before the last person.
        rs.previous();
        System.out.println("Previous to Last row info:");
        System.out.println("\tFirst Name: "  + rs.getString("FIRST_NAME"));
        System.out.println("\tLast Name: "  + rs.getString("LAST_NAME"));
        System.out.println("\tSalary: $"  + rs.getString("SALARY"));


        System.out.println();
        System.out.println("All Phone Numbers: ");
        // get me all phone numbers
        rs.beforeFirst();
        while (rs.next()){
            System.out.println("\t" + rs.getString("PHONE_NUMBER"));
        }

        rs.afterLast();
        while(rs.previous()){
            System.out.println("\t" + rs.getString("FIRST_NAME"));
        }




    }
}
