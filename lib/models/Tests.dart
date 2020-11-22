class Tests {
  String M_pop;
  int total;

  Tests({this.M_pop, this.total});

  factory Tests.fromJson(Map<String, dynamic> json) {
    return Tests(
      M_pop: json['1M_pop'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1M_pop'] = this.M_pop;
    data['total'] = this.total;
    return data;
  }
}
