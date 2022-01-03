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

  exchangeCurrency()async{

    //functionCalling
    var result = await exchangeRateCurrency.exchangeRateCurrencies(
        dropDownController.value.toString(),
        dropDownController.value2.toString());

    //decodingToJson
    var conversionData = jsonDecode(result!);

    //gettingTargetCurrencyValue
    totalController.targetCurrencyValue =
        conversionData[dropDownController.value2?.toLowerCase()].toString();

    //gettingTotalValue
    totalController.totalValue = (double.parse(
        amountController.amount.text == ''
            ? '1'
            : amountController.amount.text) *
        double.parse(totalController.targetCurrencyValue))
        .toString();
    String history =
        "${amountController.amount.text.toString() == '' ? '1' : amountController.amount.text.toString()}   ${dropDownController.value}    =    ${totalController.totalValue.toString()}   ${dropDownController.value2!}";

    //AddToDatabase
    dataBaseController.addCurrencyHistories(
        historyValue: history, dateTime: conversionData['date'].toString());
  }
}
