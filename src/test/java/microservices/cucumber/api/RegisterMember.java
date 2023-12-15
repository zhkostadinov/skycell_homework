package microservices.cucumber.api;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import kong.unirest.Unirest;
import kong.unirest.HttpResponse;
import kong.unirest.json.JSONObject;
import microservices.utils.LoadStaticData;

import java.util.Map;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class RegisterMember {
    private HttpResponse<String>  HttpResponse;
    private Map<String, JsonObject> staticData = LoadStaticData.load();
    private String tokenUrl = staticData.get("static_data").getAsJsonObject("dev_skycell")
            .getAsJsonPrimitive("token").getAsString();
    private String username = staticData.get("static_data").getAsJsonObject("dev_skycell")
            .getAsJsonPrimitive("static_username").getAsString();
    private String password = staticData.get("static_data").getAsJsonObject("dev_skycell")
            .getAsJsonPrimitive("static_password").getAsString();

    @When("I register member with {string} and {string}")
    public void registerMember(String username, String password) {
        if (username.contains("static")){
            username = this.username;
        }
        if (password.contains("static")){
            password = this.password;
        }

        HttpResponse = Unirest
                .post(tokenUrl)
                .header("Content-Type", "application/x-www-form-urlencoded")
                .header("origin", "https://skynet.test.skycell.ch")
                .field("client_id", "webapp")
                .field("grant_type", "password")
                .field("username", username)
                .field("password", password)
                .asString();
    }

    @Then("I should see token is generated with status {string}")
    public void tokenIsGenerated(String isSuccessful) {
        JSONObject res = new JSONObject(HttpResponse.getBody());

        if (isSuccessful.contains("successfully")) {
            assertFalse(res.get("access_token").toString().isEmpty());
        } else {
            assertTrue(res.get("error").toString().contains("invalid_grant"));
        }
    }

}
