import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;
  final Map<String, String> headers;
  NetworkHelper(this.url, this.headers);

  Future getData() async {
    final http.Response response = await http.get(url, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
