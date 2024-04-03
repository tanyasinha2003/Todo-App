import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpHelper {
  final String baseUrl;

  HttpHelper(this.baseUrl);

  Future<List<dynamic>> getData(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
   
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load data');
    }
  }

}
