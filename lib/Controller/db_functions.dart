import 'package:currency_converter/Model/conversion_handler.dart';
import 'package:currency_converter/Model/conversion_history_model.dart';
import 'package:get/get.dart';

class DataBaseController extends GetxController {
  ConversionHandler? conversionHandler;

  Future<int?> addCurrencyHistories(
      {required String historyValue, required String dateTime}) async {
    final ConversionModel conversionModel =
        ConversionModel(dateTime: dateTime, historyValue: historyValue);
    final List<ConversionModel> listOfHistory = [conversionModel];
    print("kissoff${historyValue},${dateTime}");
    return await conversionHandler?.insertCurrencyData(listOfHistory);
  }
  @override
  void onInit() {
    conversionHandler =ConversionHandler();
    // TODO: implement onInit
    super.onInit();
  }
}
