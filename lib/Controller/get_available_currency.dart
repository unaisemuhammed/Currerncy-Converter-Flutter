import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../instance.dart';
import 'exeption_class.dart';

class GetCurrency extends GetxController {
  List<String> currenciesList = [];

  //Get All Currencies Method
  Future<List<String>?> getAllCurrencies() async {
    http.Response? response;
    try {
      response = await http.get(Uri.parse(api.getCurrencies));
      switch (response.statusCode) {
        case 200:
          final decoded =
              jsonDecode(response.body.toString().toUpperCase()) as Map;
          final data = decoded;
          for (final name in data.keys) {
            currenciesList.add(name.toString());
          }
          return currenciesList;
        case 400:
          throw BadRequestException(response.body.toString());
        default:
          throw FetchDataException(
              'Error occured while Communication with Server with StatusCode: ${response.statusCode}');
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on BadRequestException {
      throw BadRequestException(response!.body.toString());
    }
  }
}
