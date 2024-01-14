package io.loopcamp.jdbctest.day01;

import java.sql.*;
import java.util.*;

public class P03_MetadataTest {
    public static void main(String[] args) throws SQLException {

        // Connection String - these are info that we need to make connection
        String dbUrl = "jdbc:oracle:thin:@54.224.70.64:1521:XE";
        String dbUsername = "hr";
        String dbPassword = "hr";

        // DriverManager is a class and has getConnection(); method which is used to create the CONNECTION
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

        // We create Statement reference from Connection to execute the Query
        Statement stmnt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

        //Using the stmnt reference to execute the query and store the result into rs
        ResultSet rs = stmnt.executeQuery("SELECT * FROM EMPLOYEES");


        System.out.println();
        /**
         * Database Meta Data -  will give us information about the database
         * We use conn reference to make DatebaseMetaData reference
         */

        DatabaseMetaData dbMetadata = conn.getMetaData();
        System.out.println("DB Username: " + dbMetadata.getUserName());
        System.out.println("Database Product Name: " + dbMetadata.getDatabaseProductName());
        System.out.println("Database Version Name: " + dbMetadata.getDatabaseProductVersion());


        System.out.println();
        /**
         * ResultSet Meta Data -- will help us with the upper side of the table
         * We use rs reference to make ResultSetMetaDate reference -- > by using the method .getMetaData();
         */
        ResultSetMetaData rsmd = rs.getMetaData();

        // How many columns we have
        System.out.println("Total column count: " + rsmd.getColumnCount());

        // How can I get 1st column name?
        System.out.println("First Column Name: " + rsmd.getColumnName(1));


        // This will return the size of the Characters that can be put
        System.out.println(rsmd.getColumnDisplaySize(1));


        System.out.println();
        // How can I print all the column names?
        for (int i = 1; i <= rsmd.getColumnCount(); i++) {
            System.out.println(rsmd.getColumnName(i));
        }


        //----------------------------------------------------------------
        System.out.println("----------------------------------------------------------------");
        // Since now we know how to jump through the row through the column, can we print all data dynamically

        List <Map <String, Object> > list = new ArrayList<>();

        // With the while loop I am looping through the rows
        while (rs.next()) {

            Map <String, Object> eachPerson = new LinkedHashMap<>();

            // With fori loop I am looping through columns
            for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                //System.out.println(  rsmd.getColumnName(i) + "\t\t\t\t\t" + rs.getString(i)  );
                eachPerson.put(rsmd.getColumnName(i),rs.getString(i) );
            }
            //System.out.println(eachPerson);
            list.add(eachPerson);
            //System.out.println();

        }

        //System.out.println(list);
        for (int i = 0; i < list.size(); i++) {
            System.out.println("Each Person Info: " + list.get(i));
        }


        System.out.println();
        // Get me the first person info
        System.out.println("First Persons Info: " + list.get(0));

        // GEt me the last persons info
        System.out.println("Last Persons Info: " + list.get(list.size()-1));

        //Get me the 10th person phone number?
        System.out.println("q10 Person Phone number: " + list.get(9).get("PHONE_NUMBER"));

    }
}
