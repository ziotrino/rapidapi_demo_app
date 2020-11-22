class Cases {
  String M_pop;
  int active;
  int critical;
  String news;
  int recovered;
  int total;

  Cases(
      {this.M_pop,
      this.active,
      this.critical,
      this.news,
      this.recovered,
      this.total});

  factory Cases.fromJson(Map<String, dynamic> json) {
    return Cases(
      M_pop: json['1M_pop'],
      active: json['active'],
      critical: json['critical'],
      news: json['new'],
      recovered: json['recovered'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1M_pop'] = this.M_pop;
    data['active'] = this.active;
    data['critical'] = this.critical;
    data['new'] = this.news;
    data['recovered'] = this.recovered;
    data['total'] = this.total;
    return data;
  }
}
