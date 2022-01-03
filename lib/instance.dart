
import 'package:currency_converter/Controller/drop_down_controller.dart';
import 'package:get/get.dart';
import 'Controller/currency_fetching.dart';
import 'Controller/db_functions.dart';
import 'api.dart';

DropDownController dropDownController =Get.put(DropDownController());
DataBaseController dataBaseController=Get.put(DataBaseController());
FetchingCurrencies fetchingCurrencies =Get.put(FetchingCurrencies());
Api api =Api();
