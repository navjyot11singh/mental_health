import 'DoctorDataModel.dart';

class DoctorModel {
  final int status;
  final bool error;
  final String message;
  final List<DoctorDataModel> data;

  DoctorModel({
    this.status,
    this.error,
    this.message,
    this.data,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<DoctorDataModel> dataList =
        list.map((i) => DoctorDataModel.fromJson(i)).toList();

    return DoctorModel(
      status: json['status'],
      error: json['error'],
      message: json['message'],
      data: dataList,
    );
    // token: json['token'],
  }
}
