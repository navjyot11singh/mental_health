import 'Data.dart';

class UserDetailsModel{
  final int status;
  final bool error;
  final String message;
  final Data data;

  UserDetailsModel({
    this.status,
    this.error,
    this.message,
    this.data,});

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
    return UserDetailsModel(
      status: json['status'],
      error: json['error'],
      message: json['message'],
      data: Data.fromJson(json['data']),
      // token: json['token'],
    );
  }
}