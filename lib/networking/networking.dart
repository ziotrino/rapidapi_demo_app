import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;
  final Map<String, String> headers;
  NetworkHelper(this.url, this.headers);

  Future getData() async {
    try {
      final http.Response response = await http
          .get(url, headers: headers)
          .timeout(const Duration(seconds: 10));
      print(response.statusCode);
      if (response.statusCode == 200) {
        String data = response.body;
        return jsonDecode(data);
      } else {
        print(response.statusCode);
        return null;
      }
    } on TimeoutException catch (_) {
      Fluttertoast.showToast(
          msg:
              "Timeout occurred while connecting to: $url\nCheck network settings",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return null;
    } on SocketException catch (_) {
      Fluttertoast.showToast(
          msg: "Socket exception occurred\nCheck network settings",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return null;
    }
  }
}
