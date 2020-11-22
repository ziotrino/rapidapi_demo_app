class Deaths {
  String M_pop;
  String news;
  int total;

  Deaths({this.M_pop, this.news, this.total});

  factory Deaths.fromJson(Map<String, dynamic> json) {
    return Deaths(
      M_pop: json['1M_pop'],
      news: json['new'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1M_pop'] = this.M_pop;
    data['new'] = this.news;
    data['total'] = this.total;
    return data;
  }
}
