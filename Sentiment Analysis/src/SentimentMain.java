

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import javax.net.ssl.HttpsURLConnection;

    class Document {
        public String id, language, text;

        public Document(String id, String language, String text){
            this.id = id;
            this.language = language;
            this.text = text;
        }
    }

    class Documents {
        public List<Document> documents;

        public Documents() {
            this.documents = new ArrayList<Document>();
        }
        public void add(String id, String language, String text) {
            this.documents.add (new Document (id, language, text));
        }
    }

    public class SentimentMain {
        static String subscription_key_var;
        static String subscription_key;
        static String endpoint_var;
        static String endpoint;
        static double test=5;
        String result = "";

        public static void Initialize() throws Exception {
            //subscription_key_var = "TEXT_ANALYTICS_SUBSCRIPTION_KEY";
            subscription_key = "e8816b1f4d7045fa9936891e3c81a796";
            if (null == subscription_key) {
                throw new Exception("Please set/export an environment variable named " + subscription_key_var);
            }

            //endpoint_var = "TEXT_ANALYTICS_ENDPOINT";
            endpoint = "https://aditisentiment.cognitiveservices.azure.com/";
            if (null == endpoint) {
                throw new Exception("Please set/export an environment variable named " + endpoint_var);
            }
        }

        static String path = "/text/analytics/v2.1/sentiment";

        public double sent() {
            try {
                Initialize();

                Documents documents = new Documents();
                documents.add("1", "en", "Good to see you!");
                String response= SentimentFetcher(documents);
                double score = Double.valueOf(response.substring(32, 52));
                return score;
            } catch (Exception e) {
                return test;
            }
        }
        public String SentimentFetcher(Documents documents) {
        try {
            String text = new Gson().toJson(documents);

            URL url = new URL(endpoint + path);
            HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "text/json");
            connection.setRequestProperty("Ocp-Apim-Subscription-Key", subscription_key);
            connection.setDoOutput(true);
            try(OutputStream os = connection.getOutputStream()) {
                byte[] input = text.getBytes("utf-8");
                os.write(input, 0, input.length);
            }
            connection.connect();

            StringBuilder response = new StringBuilder();
            BufferedReader in;
            if (connection.getResponseCode() == 200) {
                in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            } else {
                in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
            }
            String line;
            while ((line = in.readLine()) != null) {
                response.append(line);
            }
            in.close();
            return response.toString();
        }
        catch(Exception e){
             return "";
        }
        }

}