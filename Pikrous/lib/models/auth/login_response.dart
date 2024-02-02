class LoginResponse {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;

  LoginResponse(
      {this.id,
      this.name,
      this.email,
      this.phoneNumber,});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    return data;
  }
}



