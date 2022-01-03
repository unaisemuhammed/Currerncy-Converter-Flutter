import 'package:get/get.dart';

class ConversionModel extends GetxController {
  int? id;
  String historyValue;
  String dateTime;

  ConversionModel({required this.historyValue, required this.dateTime});

  ConversionModel.fromMap(Map<String, dynamic> conversion)
      : id = conversion['id'],
        historyValue = conversion['historyValue'],
        dateTime = conversion['dateTime'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'historyValue': historyValue,
      'dateTime': dateTime,
    };
  }
}
