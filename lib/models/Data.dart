class Data {
  final String token;
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String address;
  final String dateofcreation;

  Data({
    this.token,
    this.name,
    this.email,
    this.phone,
    this.gender,
    this.address,
    this.dateofcreation,});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      token: json['token'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      gender: json['gender'],
      address: json['address'],
      dateofcreation: json['dateofcreation'],
    );
  }

}