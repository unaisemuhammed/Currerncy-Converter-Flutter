import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget.dart';

class AmountController extends GetxController {
  final GlobalKey<FormState> amountFormKey = GlobalKey<FormState>();
  TextEditingController amount = TextEditingController();

   customTextFieldValidation() {
    if (amount.text.isNotEmpty && amount.text.isNum) {
      return null;
    } else {
      return validationSnackBar();
    }

  }
}
