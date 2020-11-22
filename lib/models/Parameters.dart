class Parameters {
  String country;
  String day;

  Parameters({this.country, this.day});

  factory Parameters.fromJson(Map<String, dynamic> json) {
    return Parameters(
      country: json['country'],
      day: json['day'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['day'] = this.day;
    return data;
  }
}
