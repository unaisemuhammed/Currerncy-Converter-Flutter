// import 'package:get/get.dart';
//
// class ConversionModel extends GetxController{
//   int? id;
//   String amountValue;
//   String totalTargetValue;
//   String sourceCurrency;
//   String targetCurrency;
//   String dateTime;
//
//   ConversionModel({ required this.amountValue,
//     required this.totalTargetValue,
//     required this.sourceCurrency,
//     required this.targetCurrency,
//     required this.dateTime});
//
//   ConversionModel.fromMap(Map<String, dynamic> conversion)
//       :
//         id =conversion['id'],
//         amountValue=conversion['amountValue'],
//         totalTargetValue=conversion['totalTargetValue'],
//         sourceCurrency=conversion['sourceCurrency'],
//         targetCurrency=conversion['targetCurrency'],
//         dateTime=conversion['dateTime'];
//
//
//   Map<String, Object> toMap() {
//     return {
//       'id': id!,
//       'amountValue': amountValue,
//       'totalTargetValue': totalTargetValue,
//       'sourceCurrency': sourceCurrency,
//       'targetCurrency': targetCurrency,
//       'dateTime':dateTime,
//     };
//   }
// }


import 'package:get/get.dart';

class ConversionModel extends GetxController {
  int? id;
  String historyValue;
  String dateTime;

  ConversionModel({required this.historyValue,
    required this.dateTime});

  ConversionModel.fromMap(Map<String, dynamic> conversion)
      :
        id =conversion['id'],
        historyValue=conversion['historyValue'],
        dateTime=conversion['dateTime'];


  Map<String, Object?> toMap() {
    return {
      'id': id,
      'historyValue': historyValue,
      'dateTime': dateTime,

    };
  }
}
