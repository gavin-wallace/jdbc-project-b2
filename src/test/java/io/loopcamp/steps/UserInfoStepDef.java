package io.loopcamp.steps;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import io.loopcamp.utility.DB_Utility;
import org.junit.Assert;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.List;

public class UserInfoStepDef {
    ResultSet rs;
    ResultSetMetaData rsmd;

    @Given("Establish the database connection")
    public void establish_the_database_connection() {
        //connection is handled in hooks
    }

    @When("Execute query to get all columns for {string}")
    public void execute_query_to_get_all_columns_for(String string) {
        rs = DB_Utility.runQuery("select * from identity." + string);
    }

    @Then("verify the below columns are listed in result for name")
    public void verify_the_below_columns_are_listed_in_result_for_name(List<String> list) {
        System.out.println(list);
        System.out.println(DB_Utility.getColumnDataAsList("name"));
        Assert.assertEquals("", DB_Utility.getColumnDataAsList("name"), list);
    }

}
