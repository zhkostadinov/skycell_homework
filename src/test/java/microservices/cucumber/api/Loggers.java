package microservices.cucumber.api;

import com.google.gson.JsonObject;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import kong.unirest.Unirest;
import kong.unirest.HttpResponse;
import microservices.utils.LoadStaticData;
import microservices.utils.RandomData;

import java.util.Map;

import static org.junit.Assert.assertTrue;

public class Loggers {
    private HttpResponse<String> HttpResponse;
    private final Map<String, JsonObject> staticData = LoadStaticData.getLoadedData();
    private final String loggerConfigUrl = staticData.get("static_data").getAsJsonObject("dev_sensor")
            .getAsJsonPrimitive("logger_config").getAsString();
    private final String apiKey = staticData.get("static_data").getAsJsonObject("dev_sensor")
            .getAsJsonPrimitive("api_key").getAsString();
    private final String type810T = staticData.get("static_data").getAsJsonObject("loggers")
            .getAsJsonPrimitive("type_810T").getAsString();
    private final String type810TLoggerNumber = staticData.get("static_data").getAsJsonObject("loggers")
            .getAsJsonPrimitive("type_810T_logger_nex_number").getAsString();

    private final String type812P = staticData.get("static_data").getAsJsonObject("loggers")
            .getAsJsonPrimitive("type_812P").getAsString();
    private final String type812PLoggerNumber = staticData.get("static_data").getAsJsonObject("loggers")
            .getAsJsonPrimitive("type_812P_logger_nex_number").getAsString();

    private JsonObject loggerMrBody = staticData.get("loggerMrBody");


    @When("I register logger {string} with nex {string} length of {int}")
    public void registerLogger(String loggerType, String loggerNumber, Integer length) {
        // TODO: replace with two switch cases
        if (loggerType.contains("type810T")) {
            loggerType = this.type810T;
        } else if (loggerType.contains("type812P")) {
            loggerType = this.type812P;
        }
        if (loggerNumber.contains("staticLoggerNumberType810T")) {
            loggerNumber = this.type810TLoggerNumber;
        } else if (loggerNumber.contains("staticLoggerNumberType812P")) {
            loggerNumber = this.type812PLoggerNumber;
        } else if (loggerNumber.isBlank()) {
            loggerNumber = "";
        } else {
            loggerNumber = RandomData.getRandomHexString(length);
        }

        loggerMrBody.addProperty("loggerNumber", loggerNumber);
        loggerMrBody.addProperty("loggerType", loggerType);

        HttpResponse = Unirest
                .post(loggerConfigUrl)
                .header("APIKEY", apiKey)
                .header("Content-Type", "application/json")
                .body(loggerMrBody.toString())
                .asString();
    }

    @Then("I should see request with status {string}")
    public void loggerIsCreated(String isSuccessful) {
        assertTrue(HttpResponse.getStatusText().equalsIgnoreCase(isSuccessful));
    }
}
