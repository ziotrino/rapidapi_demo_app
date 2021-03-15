import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kBaseURL = "https://covid-193.p.rapidapi.com/";
const rapidApiKey = "341ceb3ec8msh842c71dd9cac453p1b32ebjsn357f2c34544d";
const kStatsSearch = 'statistics';
const kHistorySearch = "history";
const kCountryList = 'countries';

//max number of days to display
const kMaxFetchCount = 120;
const kWeekData = 7;
const kMonthData = 30;

const TextStyle kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.w700,
  color: Colors.white, //  Color(0xFF8D8E98),
);
const TextStyle kLabelTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w700,
  color: Colors.white, //  Color(0xFF8D8E98),
);
const TextStyle kMediumLabelTextStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w700,
  color: Colors.white, //  Color(0xFF8D8E98),
);
const TextStyle kDataTextStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.white, //  Color(0xFF8D8E98),
);
const TextStyle kHypeTextStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w900,
  color: Colors.white, //  Color(0xFF8D8E98),
);
const TextStyle kCountryTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.w900,
  color: Colors.white, //  Color(0xFF8D8E98),
);
const TextStyle kSplashTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w700,
  color: Colors.deepOrangeAccent, //  Color(0xFF8D8E98),
);
const TextStyle kSplashInfoTextStyle = TextStyle(
  fontSize: 15.0,
  fontWeight: FontWeight.w400,
  color: Colors.deepOrangeAccent, //  Color(0xFF8D8E98),
);
