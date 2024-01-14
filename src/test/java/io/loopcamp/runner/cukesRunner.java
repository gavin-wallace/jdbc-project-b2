package io.loopcamp.runner;

import io.cucumber.junit.*;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        plugin = {"html:target/html-report/cucumber-reports.html",
                "rerun:target/rerun.txt",
                "json:target/json-reports/json-report"},
        features = "src/test/resources/features",
        glue = "io/loopcamp/steps",
        dryRun = false,
        tags = "",
        monochrome = true
        //publish = true
)


public class cukesRunner {
}
