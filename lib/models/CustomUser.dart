class CustomUser {
  String? username;
  String? email;
  String? contact;
  String? age;

  CustomUser({this.username, this.email, this.contact, this.age});

  CustomUser.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    contact = json['contact'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['contact'] = this.contact;
    data['age'] = this.age;
    return data;
  }
}
