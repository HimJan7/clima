import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future<void> getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);

      double temprature = jsonDecode(data)['main']['temp'];
      int condition = jsonDecode(data)['weather'][0]['id'];
      String cityName = jsonDecode(data)['name'];

      print(temprature);
      print(condition);
      print(cityName);

      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
