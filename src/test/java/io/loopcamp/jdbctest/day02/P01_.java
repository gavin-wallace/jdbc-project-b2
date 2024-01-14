package io.loopcamp.jdbctest.day02;

import io.loopcamp.utility.ConfigurationReader;
import io.loopcamp.utility.DB_Utility;
import org.junit.Assert;
import org.junit.Test;

public class P01_ {

    @Test
    public void test() {

        DB_Utility.createConnection("jdbc:postgresql://34.135.178.209:5432/postgres","tstadmin","hoxBam-jaghuj-7cette");
        DB_Utility.runQuery("select * from document.users where role_name = 'advisor'");


        String expectedNumber = "";
        String actualNumber ="";

        Assert.assertEquals(expectedNumber,actualNumber);

        DB_Utility.destroy();

    }
    @Test
    public void test2(){
        DB_Utility.createConnection(ConfigurationReader.getProperty("docuport.db.url"),ConfigurationReader.getProperty("docuport.db.username"),ConfigurationReader.getProperty("docuport.db.password"));
        DB_Utility.runQuery("");
    }
}
