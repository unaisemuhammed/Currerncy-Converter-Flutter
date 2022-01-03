import 'package:currency_converter/Model/conversion_handler.dart';
import 'package:currency_converter/Model/conversion_history_model.dart';
import 'package:get/get.dart';

import '../instance.dart';

class DataBaseController extends GetxController {
  InsertData? insertData;
  DeleteData? deleteData;
  ClearDataBase? clearDataBase;
  @override
  void onInit() {
    insertData = InsertData();
    deleteData=DeleteData();
    clearDataBase=ClearDataBase();
    // TODO: implement onInit
    super.onInit();
  }

//AddCurrencyHistoryToDataBase
  Future<int?> addCurrencyHistories(
      {required String historyValue, required String dateTime}) async {
    final ConversionModel conversionModel =
        ConversionModel(dateTime: dateTime, historyValue: historyValue);
    final List<ConversionModel> listOfHistory = [conversionModel];
    return await insertData?.insertCurrencyData(listOfHistory);
  }

  //ClearAllData
  void clearAllData() async {
    await dataBaseController.clearDataBase?.deleteAll();
    update();
  }

//DeleteData
  void deleteHistoryData(int id)async{
    await  deleteData?.deleteData(id);
    update();
  }
}
