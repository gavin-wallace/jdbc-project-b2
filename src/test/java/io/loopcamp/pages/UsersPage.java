package io.loopcamp.pages;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class UsersPage extends BasePage{

    @FindBy(xpath = "//span[.='Search']")
    public WebElement searchButton;

    @FindBy(xpath = "//label[.='All']")
    public WebElement allRadioButton;

    @FindBy(xpath = "//span[.=' Search ']")
    public WebElement updateSearchButton;
}
