import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../instance.dart';
import 'package:http/http.dart' as http;

import '../widget.dart';

class GetExchangeRateCurrency extends GetxController {
  //CurrencyGettingMethod
  Future<String?> exchangeRateCurrencies(
    String source,
    String target,
  ) async {
    try {
      final response = await http.get(Uri.parse(api.exchangeRates +
          '${source.toLowerCase()}/${target.toLowerCase()}.json'));
      if (response.statusCode == 200) {
        return response.body;
      }
    } on SocketException {
      snackBar();
    }
  }
}
