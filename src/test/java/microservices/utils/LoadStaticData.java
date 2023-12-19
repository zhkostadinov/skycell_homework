package microservices.utils;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

public class LoadStaticData {
    private static final String dataToLoad;
    private static final String headersToLoad;
    private static final String loggerMrBody;

    static {
        try {
            dataToLoad = new String(Files.readAllBytes(Paths.get("src/test/resources/static_data.json")));
            headersToLoad = new String(Files.readAllBytes(Paths.get("src/test/resources/models/headers.json")));
            loggerMrBody = new String(Files.readAllBytes(Paths.get("src/test/resources/models/logger_mr_body.json")));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private static JsonObject dataAsJson = JsonParser.parseString(dataToLoad).getAsJsonObject();
    private static JsonObject headersAsJson = JsonParser.parseString(headersToLoad).getAsJsonObject();
    private static JsonObject loggerBodyAsJson = JsonParser.parseString(loggerMrBody).getAsJsonObject();
    private static Map<String, JsonObject> staticData = new HashMap<>();
    ;

    private static void loadEnvVars() {
        dataAsJson.getAsJsonObject("dev_skycell")
                .addProperty("static_username", System.getenv("dev_skycell_static_username"));
        dataAsJson.getAsJsonObject("dev_skycell")
                .addProperty("static_password", System.getenv("dev_skycell_static_password"));
        dataAsJson.getAsJsonObject("dev_skycell")
                .addProperty("api_key", System.getenv("dev_skycell_api_key"));

        dataAsJson.getAsJsonObject("dev_sensor")
                .addProperty("static_username", System.getenv("dev_sensor_static_username"));
        dataAsJson.getAsJsonObject("dev_sensor")
                .addProperty("static_password", System.getenv("dev_sensor_static_password"));
        dataAsJson.getAsJsonObject("dev_sensor")
                .addProperty("api_key", System.getenv("dev_sensor_api_key"));

        dataAsJson.getAsJsonObject("loggers")
                .addProperty("type_810T_logger_nex_number", System.getenv("logger_nex_mr810t"));
        dataAsJson.getAsJsonObject("loggers")
                .addProperty("type_812P_logger_nex_number", System.getenv("logger_nex_mr812p"));
    }

    public static void load() {
        loadEnvVars();
        staticData.put("static_data", dataAsJson);
        staticData.put("headers", headersAsJson);
        staticData.put("loggerMrBody", loggerBodyAsJson);
    }

    public static Map<String, JsonObject> getLoadedData() {
        return staticData;
    }


    public static Map<String, JsonObject> update(String key, JsonObject data) {
        staticData.put(key, data);
        return staticData;
    }
}
