class Errors {
  String message;

  Errors({this.message});

  factory Errors.fromJson(Map<String, dynamic> json) {
    return Errors(message: json['message']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}
