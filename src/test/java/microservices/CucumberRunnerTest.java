package microservices;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import microservices.utils.LoadStaticData;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;


@RunWith(Cucumber.class)
@CucumberOptions(plugin = {"pretty", "html: cucumber-reports/execution-report.html"},
        features = {"src/test/resources/features/"},
        glue = "microservices.cucumber.api",
        tags = "not @ignore")
public class CucumberRunnerTest {

    @BeforeClass
    public static void beforeAll() {
        LoadStaticData.load();
    }

}