package io.loopcamp.steps;

import io.cucumber.java.en.*;
import io.loopcamp.pages.LoginPage;

public class DashboardStepDef {

    LoginPage loginPage;


    @Given("the {string} on the home page")
    public void the_on_the_home_page(String string) {
        loginPage = new LoginPage();
        loginPage.login(string);
    }



}
