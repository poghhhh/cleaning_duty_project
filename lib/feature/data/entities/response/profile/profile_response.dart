class ProfileResponse {
  String? message;
  Data? data;

  ProfileResponse({this.message, this.data});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? username;
  String? name;
  String? dateOfBirth;
  String? email;
  String? phoneNumber;
  String? avatarUrl;

  Data(
      {this.username,
      this.name,
      this.dateOfBirth,
      this.email,
      this.phoneNumber,
      this.avatarUrl});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    name = json['name'];
    dateOfBirth = json['date_of_birth'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['name'] = this.name;
    data['date_of_birth'] = this.dateOfBirth;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['avatar_url'] = this.avatarUrl;
    return data;
  }
}
