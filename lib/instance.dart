
import 'package:currency_converter/Controller/drop_down_controller.dart';
import 'package:get/get.dart';
import 'Controller/get_available_currency.dart';
import 'Controller/db_functions.dart';
import 'Controller/get_exchange_rate.dart';
import 'Controller/total_controller.dart';
import 'api.dart';

DropDownController dropDownController =Get.put(DropDownController());
DataBaseController dataBaseController=Get.put(DataBaseController());
GetCurrency getCurrencies =Get.put(GetCurrency());
TotalController totalController = Get.put(TotalController());
GetExchangeRateCurrency exchangeRateCurrency = Get.put(GetExchangeRateCurrency());
Api api =Api();
