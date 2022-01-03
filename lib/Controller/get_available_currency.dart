import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../instance.dart';
import 'exeption_class.dart';

TextEditingController amount = TextEditingController();
String date = '';
String targetCurrencyValue = '';
String totalValue = '';
List<String> Keys = [];

//FetchingCurrenciesMethod
class GetCurrency extends GetxController {
  //Get All Currencies Method
  Future<List<String>> getAllCurrencies() async {
    final response = await http.get(Uri.parse(api.getCurrencies));
    switch (response.statusCode) {
      case 200:
        final decoded =
            jsonDecode(response.body.toString().toUpperCase()) as Map;
        final data = decoded;
        for (final name in data.keys) {
          Keys.add(name.toString());
        }
        return Keys;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode: ${response.statusCode}');
    }
  }
}
