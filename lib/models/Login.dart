import 'Data.dart';

class Login {
  final int status;
  final bool error;
  final String message;
  final Data data;

  Login({
    this.status,
    this.error,
    this.message,
    this.data,});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      status: json['status'],
      error: json['error'],
      message: json['message'],
      data: Data.fromJson(json['data']),
      // token: json['token'],
    );
  }

}


