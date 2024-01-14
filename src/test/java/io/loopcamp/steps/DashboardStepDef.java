package io.loopcamp.steps;
import io.cucumber.java.en.*;
import io.loopcamp.pages.BasePage;
import io.loopcamp.pages.LoginPage;
import io.loopcamp.utility.DB_Utility;
import org.junit.Assert;

import java.sql.ResultSet;
public class DashboardStepDef {

    LoginPage loginPage;

    @Given("the {string} on the home page")
    public void the_on_the_home_page(String string) {
        loginPage = new LoginPage();
        loginPage.login(string);
    }

    String firstName;
    String lastName;
    @When("the advisor gets account holder name")
    public void the_advisor_gets_account_holder_name() {
        loginPage.closeLeftNavigationPanel();
        loginPage.userIcon.click();
        loginPage.profileButton.click();
        firstName = loginPage.firstName.getText();
        lastName = loginPage.lastname.getText();
    }

    @Then("verify ui account name is in db")
    public void verify_ui_account_name_is_in_db() {
        DB_Utility.runQuery("select * from document.users where first_name = '"+firstName+"' and last_name = '"+lastName+"'");
        Assert.assertTrue(DB_Utility.getRowCount()>0);
    }
}
