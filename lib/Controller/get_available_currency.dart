import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../instance.dart';

class GetCurrency extends GetxController {
  List<String> currenciesList = [];

  //Get All Currencies Method
  Future<List<String>?> getAllCurrencies() async {
    final response = await http.get(Uri.parse(api.getCurrencies));
    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body.toString().toUpperCase()) as Map;
      final data = decoded;
      for (final name in data.keys) {
        currenciesList.add(name.toString());
      }
      return currenciesList;
    }
  }
}
