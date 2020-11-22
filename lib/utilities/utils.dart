import 'package:covidstats_app/models/iso_3166.dart';
import 'package:flutter/material.dart';

Widget getFlagIcon(String countryName) {
  String countrycode = Iso3166Code.getCode(countryName);
  if (countrycode != null) {
    String icoName = 'images/flags/$countrycode.png';
    return Image.asset(icoName);
  } else {
    return Icon(Icons.map, color: Colors.white);
  }
}
