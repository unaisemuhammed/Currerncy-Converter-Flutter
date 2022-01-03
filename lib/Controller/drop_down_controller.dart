import 'package:currency_converter/instance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownController extends GetxController {
  String? value = 'ADA';
  String? value2 = 'ADA';

//DropDownItemsFunction
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
}
