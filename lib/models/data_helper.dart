import 'dart:async';

import 'package:covidstats_app/networking/networking.dart';
import 'package:covidstats_app/utilities/Constants.dart';

class DataHelper {
  Future<dynamic> getData(String url) async {
    Map<String, String> headers = {
      "content-type": "application/json",
      "charset": "utf-8",
      "X-RapidAPI-Key": rapidApiKey,
    };
    print(url);
    try {
      NetworkHelper networkHelper = NetworkHelper(url, headers);
      var covidData =
          await networkHelper.getData().timeout(Duration(seconds: 10));
      return covidData;
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
