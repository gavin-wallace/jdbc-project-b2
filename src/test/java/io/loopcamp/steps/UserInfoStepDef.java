package io.loopcamp.steps;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import io.loopcamp.utility.DB_Utility;
import org.junit.Assert;

import java.sql.ResultSet;
import java.util.*;

public class UserInfoStepDef {

    @Given("Establish the database connection")
    public void establish_the_database_connection() {
        //connection is handled in hooks
    }

    @When("Execute query to get all columns for {string}")
    public void execute_query_to_get_all_columns_for(String string) {
        DB_Utility.runQuery("select * from identity." + string);
    }

    @Then("verify the below columns are listed in result for name")
    public void verify_the_below_columns_are_listed_in_result_for_name(List<String> list) {
        System.out.println(list);
        System.out.println(DB_Utility.getColumnDataAsList("name"));
        Assert.assertEquals("", DB_Utility.getColumnDataAsList("name"), list);
    }

    //--

    @When("Execute query to get all IDs from users")
    public void execute_query_to_get_all_i_ds_from_users() {
        DB_Utility.runQuery("select id from identity.users");
    }
    @Then("verify all users has unique ID")
    public void verify_all_users_has_unique_id() {
        int actual = DB_Utility.getRowCount();
        DB_Utility.runQuery("select distinct id from identity.users");
        int expected = DB_Utility.getRowCount();
        Assert.assertEquals(expected,actual);
    }

    @When("Execute query to get all columns")
    public void execute_query_to_get_all_columns() {
        DB_Utility.runQuery("select * from document.users"); // the data table is from document.user (vs identity.users)
    }
    @Then("verify the below columns are listed in result")
    public void verify_the_below_columns_are_listed_in_result(List<String> expectedList) {
        List<String>actualList = DB_Utility.getAllColumnNamesAsList();
        expectedList.forEach( each -> {
            Assert.assertTrue(actualList.contains(each));
        });

    }

}
