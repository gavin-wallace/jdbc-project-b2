package io.loopcamp.jdbctest.day01;

import java.sql.*;

public class P01_TestOracleConnection {
    public static void main(String[] args) throws SQLException {

        // Connection String - these are info that we need to make connection
        String dbUrl = "jdbc:oracle:thin:@54.224.70.64:1521:XE";
        String dbUsername = "hr";
        String dbPassword = "hr";

        /*
            There steps to make connection
                1. Connection
                2. Statement
                3. ResultSet

                These are coming from java.sql package
         */


        // DriverManager is a class and has getConnection(); method which is used to create the CONNECTION
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);


        // We create Statement reference from Connection to execute the Query
        Statement stmnt = conn.createStatement();


        //Using the stmnt reference to execute the query and store the result into rs
        ResultSet rs = stmnt.executeQuery("SELECT * FROM REGIONS");

        rs.next();

        System.out.println("rs.getString(\"REGION_ID\") = " + rs.getString("REGION_ID")); // Here we got the int and converted to String
        System.out.println("rs.getInt(\"REGION_ID\") = " + rs.getInt("REGION_ID")); // Normally method needs to match to the data type of the column

        String regionNameRowOne = rs.getString("REGION_NAME");
        System.out.println("1st row region name: " + regionNameRowOne);

        rs.next();
        System.out.println("rs.getString(\"REGION_NAME\") = " + rs.getString("REGION_NAME")); //Americas
        System.out.println("rs.getString(\"REGION_NAME\") = " + rs.getString(2)); //Americas


        System.out.println();
        while (rs.next()) {
            System.out.println("Each region id: " + rs.getInt(1));
            System.out.println("Each region name: " + rs.getString(2));
        }

        // This will give us an exception saying basically the rows have been finished
        // System.out.println(rs.getString("REGION_NAME"));

        // Q:  How can I go back to the first row.
        rs.first();
        System.out.println(rs.getString("REGION_NAME"));
        // This will not work in here because we need to add some parameters into Statement to be flexibale for navigation
        // Lets look at it in a new file.

    }
}
