package io.loopcamp.pages;

import io.loopcamp.utility.BrowserUtil;
import io.loopcamp.utility.Driver;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.util.List;

public class BasePage {

    public BasePage() {
        PageFactory.initElements(Driver.getDriver(), this);
    }

    @FindBy(xpath = "//div[@class='v-list-item__title']//span")
    List<WebElement> allModules;


    @FindBy(xpath = "//div[@class='v-data-footer__pagination']")
    public WebElement totalResultCount; //1-10 of 869

    @FindBy(xpath = "//div[@class='v-avatar primary']/following-sibling::span")
    public WebElement userIcon; //First and Last name from upper right

    @FindBy(xpath = "//a[@href='/profile']")
    public WebElement profileButton; //First and Last name from upper right

    @FindBy(xpath = "//span[.='First name']/..//following-sibling::div//span")
    public WebElement firstName; //First and Last name from upper right

    @FindBy(xpath = "//span[.='Last name']/..//following-sibling::div//span")
    public WebElement lastname; //First and Last name from upper right




    public void navigateModule(String moduleName) {
        for (WebElement each : allModules) {
            if (each.getText().equals(moduleName)) {
                each.click();
            }
        }
    }

    public void closeLeftNavigationPanel(){
        Driver.getDriver().findElement(By.xpath("//button[@class='pa-0 v-btn v-btn--rounded v-btn--text theme--light v-size--default gray--text']")).sendKeys(Keys.ENTER, Keys.ENTER);
    }


    public int getResultCount() { //1-10 of 869 ----> 869
        BrowserUtil.waitFor(2);
        String expectedCount = totalResultCount.getText().substring(totalResultCount.getText().lastIndexOf(" ") + 1);
        return Integer.parseInt(expectedCount);


    }
}
