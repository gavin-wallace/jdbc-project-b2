package io.loopcamp.steps;

import io.cucumber.java.*;
import io.loopcamp.utility.ConfigurationReader;
import io.loopcamp.utility.DB_Utility;
import io.loopcamp.utility.Driver;

import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;

import java.util.concurrent.TimeUnit;

public class z_Hooks {


    @Before("@ui")
    public void setUp() {
        Driver.getDriver().get(ConfigurationReader.getProperty("docuport.ui.url"));
        Driver.getDriver().manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
    }


    @After("@ui")
    public void tearDown(Scenario scenario){
        if(scenario.isFailed()){
            final byte[] screenshot = ((TakesScreenshot) Driver.getDriver()).getScreenshotAs(OutputType.BYTES);
            scenario.attach(screenshot,"image/png", scenario.getName());
        }
        Driver.closeDriver();
    }

    @Before("@db")
    public void setUpDb() {
        DB_Utility.createConnection(ConfigurationReader.getProperty("docuport.db.url"),ConfigurationReader.getProperty("docuport.db.username"),ConfigurationReader.getProperty("docuport.db.password"));
    }
    @After("@db")
    public void tearDownDB() {
        DB_Utility.destroy();
    }
}
