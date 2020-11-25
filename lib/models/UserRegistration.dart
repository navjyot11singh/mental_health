import 'Data.dart';

class UserRegistration{
  final int status;
  final bool error;
  final String message;
  final Data data;

  UserRegistration({
    this.status,
    this.error,
    this.message,
    this.data,});

  factory UserRegistration.fromJson(Map<String, dynamic> json) {
    return UserRegistration(
      status: json['status'],
      error: json['error'],
      message: json['message'],
      data: Data.fromJson(json['data']),
      // token: json['token'],
    );
  }
}