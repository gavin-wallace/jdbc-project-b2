package io.loopcamp.pages;
import io.loopcamp.utility.Driver;
import org.openqa.selenium.By;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class LeadsPage extends BasePage{

    public List<Map<String,String>> getAllLeadsInformation(String fullName, String emailAddress, String phoneNumber){
        List<Map<String,String>>expectedList=new ArrayList<>();
        for (int i = 1; i <= getResultCount(); i++) {
            Map<String, String> expectedMap = new LinkedHashMap<>();
            expectedMap.put(fullName, Driver.getDriver().findElement(By.xpath("((//tbody//tr)["+i+"]//td)[2]")).getText());
            expectedMap.put(emailAddress,Driver.getDriver().findElement(By.xpath("((//tbody//tr)["+i+"]//td)[3]")).getText());
            expectedMap.put(phoneNumber,Driver.getDriver().findElement(By.xpath("((//tbody//tr)["+i+"]//td)[4]")).getText());
            expectedList.add(expectedMap);
        }
        return expectedList;
    }


}
