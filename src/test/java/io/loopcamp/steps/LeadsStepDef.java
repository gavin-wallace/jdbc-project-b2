package io.loopcamp.steps;

import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.loopcamp.pages.LeadsPage;
import io.loopcamp.utility.DB_Utility;
import org.junit.Assert;

import java.util.*;

public class LeadsStepDef {
    LeadsPage leadsPage = new LeadsPage();

    List<Map<String,String>>expectedList;
    @When("the user gets all the leads information based on {string} and {string} and {string}")
    public void the_user_gets_all_the_leads_information_based_on_and_and(String fullName, String emailAddress, String phoneNumber) {
        expectedList=leadsPage.getAllLeadsInformation(fullName,emailAddress,phoneNumber);
    }

    @Then("verify leads information match in DB")
    public void verify_leads_information_match_in_db() {
        DB_Utility.runQuery("select concat(owner_first_name,owner_last_name) as \"Full name\",contact_email_address as \"Email address\",contact_phone_number as \"Phone number\" from document.leads where deletion_time is null");
        List<Map<String, String>> actualList=DB_Utility.getAllRowAsListOfMap();
        expectedList.forEach( ui_each -> {
            Assert.assertTrue(actualList.contains(ui_each));
        });
    }
}
