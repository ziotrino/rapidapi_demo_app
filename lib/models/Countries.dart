import 'package:covidstats_app/models/Errors.dart';
import 'package:covidstats_app/models/Parameters.dart';

class Countries {
  String get;
  List<Errors> errors;
  List<Parameters> parameters;
  List<String> response;
  int results;

  Countries(
      {this.get, this.errors, this.parameters, this.response, this.results});

  factory Countries.fromJson(Map<String, dynamic> json) {
    return Countries(
      get: json['get'],
      errors: json['errors'] != null
          ? (json['errors'] as List).map((i) => Errors.fromJson(i)).toList()
          : null,
      parameters: json['parameters'] != null
          ? (json['parameters'] as List)
              .map((i) => Parameters.fromJson(i))
              .toList()
          : null,
      response: json['response'] != null
          ? new List<String>.from(json['response'])
          : null,
      results: json['results'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['get'] = this.get;
    data['results'] = this.results;
    if (this.errors != null) {
      data['errors'] = this.errors.map((v) => v.toJson()).toList();
    }
    if (this.parameters != null) {
      data['parameters'] = this.parameters.map((v) => v.toJson()).toList();
    }
    if (this.response != null) {
      data['response'] = this.response;
    }
    return data;
  }
}
