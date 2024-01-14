package io.loopcamp.pages;

import io.loopcamp.utility.ConfigurationReader;
import io.loopcamp.utility.Driver;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.util.InputMismatchException;

public class LoginPage extends BasePage{


    @FindBy(xpath = "//label[.='Username or email']//following-sibling::input")
    public WebElement username;

    @FindBy(xpath = "//label[.='Password']//following-sibling::input")
    public WebElement password;

    @FindBy(xpath = "//span[.=' Log in ']/..")
    public WebElement loginButton;

    public void login(String userType) {

        username.sendKeys(ConfigurationReader.getProperty(userType+"_username"));
        password.sendKeys(ConfigurationReader.getProperty("password"));
        loginButton.click();

        if (userType.toLowerCase().equals("client")){
            //click continue
        }

    }
}
