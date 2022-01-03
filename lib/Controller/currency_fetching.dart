import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../instance.dart';

TextEditingController amount = TextEditingController();
String date = '';
String targetCurrencyValue = '';
String totalValue = '';
List<String> Keys = [];

//FetchingCurrenciesMethod
class FetchingCurrencies extends GetxController {
  Future<List<String>> fetchingCurrencies() async {
    final response = await http.get(Uri.parse(api.getCurrencies));
    final decoded = jsonDecode(response.body.toString().toUpperCase()) as Map;
    final data = decoded;
    for (final name in data.keys) {
      Keys.add(name.toString());
    }
    print(Keys);
    return Keys;
  }

  //CurrencyGettingMethod
  Future<String> exchangeCurrencies(
    String source,
    String target,
  ) async {
    final response = await http.get(Uri.parse(api.exchangeRates +
        '${source.toLowerCase()}/${target.toLowerCase()}.json'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
