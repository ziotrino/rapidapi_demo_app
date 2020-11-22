import 'package:covidstats_app/models/Errors.dart';
import 'package:covidstats_app/models/Parameters.dart';
import 'package:covidstats_app/models/Response.dart';

class RapidResponse {
  String get;
  List<Errors> errors;
  Parameters parameters;
  List<Response> response;
  int results;

  RapidResponse(
      {this.get, this.errors, this.parameters, this.response, this.results});

  factory RapidResponse.fromJson(Map<String, dynamic> json) {
    return RapidResponse(
      get: json['get'],
      errors: json['errors'] != null
          ? (json['errors'] as List).map((i) => Errors.fromJson(i)).toList()
          : null,
      parameters: json['parameters'] != null
          ? Parameters.fromJson(json['parameters'])
          : null,
      response: json['response'] != null
          ? (json['response'] as List).map((i) => Response.fromJson(i)).toList()
          : null,
      results: json['results'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['get'] = this.get;
    data['results'] = this.results;
    if (this.errors != null) {
      data['errors'] = (this.errors).map((v) => v.toJson()).toList();
    }
    if (this.parameters != null) {
      data['parameters'] = this.parameters.toJson();
    }
    if (this.response != null) {
      data['response'] = this.response.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
