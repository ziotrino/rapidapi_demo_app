import 'package:covidstats_app/models/Cases.dart';
import 'package:covidstats_app/models/Deaths.dart';
import 'package:covidstats_app/models/Tests.dart';

class Response {
  Cases cases;
  String continent;
  String country;
  String day;
  Deaths deaths;
  int population;
  Tests tests;
  String time;

  Response(
      {this.cases,
      this.continent,
      this.country,
      this.day,
      this.deaths,
      this.population,
      this.tests,
      this.time});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      cases: json['cases'] != null ? Cases.fromJson(json['cases']) : null,
      continent: json['continent'],
      country: json['country'],
      day: json['day'],
      deaths: json['deaths'] != null ? Deaths.fromJson(json['deaths']) : null,
      population: json['population'],
      tests: json['tests'] != null ? Tests.fromJson(json['tests']) : null,
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['continent'] = this.continent;
    data['country'] = this.country;
    data['day'] = this.day;
    data['population'] = this.population;
    data['time'] = this.time;
    if (this.cases != null) {
      data['cases'] = this.cases.toJson();
    }
    if (this.deaths != null) {
      data['deaths'] = this.deaths.toJson();
    }
    if (this.tests != null) {
      data['tests'] = this.tests.toJson();
    }
    return data;
  }
}
