import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../instance.dart';
import '../widget.dart';

class AmountController extends GetxController {
  TextEditingController amount = TextEditingController();


  //Validation method of amount field
  customTextFieldValidation() async {
    if (amount.text.isNotEmpty && amount.text.isNum) {
      return null;
    } else {
      return validationSnackBar();
    }
  }

}
