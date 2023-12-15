package microservices;
//
//import com.google.gson.JsonObject;
import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
//import org.junit.BeforeClass;
//import org.junit.jupiter.api.BeforeAll;
import org.junit.runner.RunWith;

import java.text.SimpleDateFormat;
import java.util.Date;

@RunWith(Cucumber.class)
@CucumberOptions(plugin = {"pretty", "html: cucumber-reports/execution-report.html"},
        features = {"src/test/resources/features/"},
        glue = "microservices.cucumber.api",
        tags = "not @ignore")
public class CucumberRunnerTest {

//    @BeforeClass
//    @BeforeAll
    public static void beforeAll() {
//        Map<String, JsonObject> staticData = LoadStaticData.load();
//
//        JsonObject devSkyCell = staticData.get("static_data").getAsJsonObject("dev_skycell");
//        devSkyCell.addProperty("static_username", System.getenv("dev_skycell_static_username"));
//        devSkyCell.addProperty("static_password", System.getenv("dev_skycell_static_password"));
//        devSkyCell.addProperty("api_key", System.getenv("dev_skycell_api_key"));
//
//        JsonObject devSensor = staticData.get("static_data").getAsJsonObject("dev_sensor");
//        devSensor.addProperty("static_username", System.getenv("dev_sensor_static_username"));
//        devSensor.addProperty("static_password", System.getenv("dev_sensor_static_password"));
//        devSensor.addProperty("api_key", System.getenv("dev_sensor_api_key"));
//
//        Map<String, JsonObject> updatedStaticData = LoadStaticData.update("static_data", staticData.get("static_data"));

        // add static data to shared context
        // create a helper for https requests
        // how to read json and parse it to requests
        // start with dsl

        // done
        // create feature file for step 1


        System.out.println("Ran the before");
    }

}