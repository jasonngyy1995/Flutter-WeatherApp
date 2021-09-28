// since no class in http.dart (can be called without creating a new object)
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getWeather() async {
    // Response type -> An HTTP response where the entire response body is known in advance
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;

      // use var since data type of variable decodedData is unknown until decoded
      var decodedData = jsonDecode(data);

      return decodedData;

    } else {
      print(response.statusCode);
    }
  }
}