import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiClient extends GetxController {

  TextEditingController amount = TextEditingController();
  String date = '';
  String targetCurrencyValue = '';
  String totalValue = '';
  List<String> Keys = [];


  @override
  void onInit() {
    printCurrencies();
    update();
    super.onInit();
  }



  //FetchingCurrenciesMethod
  Future<List<String>> printCurrencies() async {
    final response = await http.get(Uri.parse('https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies.json'));
    final decoded = jsonDecode(response.body.toString().toUpperCase()) as Map;
    final data = decoded;
    for (final name in data.keys) {
      Keys.add(name.toString());}
     return Keys;
  }


  //CurrencyGettingMethod
  Future<String> exchangeCurrencies(String source, String target,) async {
    final response = await http.get(Uri.parse('https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/${source.toLowerCase()}/${target.toLowerCase()}.json'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load album');
    }
  }


}
