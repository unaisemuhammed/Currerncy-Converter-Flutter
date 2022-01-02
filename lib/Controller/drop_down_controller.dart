import 'package:currency_converter/Controller/api_functions.dart';
import 'package:get/get.dart';

class DropDownController extends GetxController {
  String? value;
  String? value2;

  @override
  void onInit() {
    value = 'ADA';
    value2 = 'ADA';
    super.onInit();
  }
}
