import 'dart:io';

import 'package:currency_converter/Controller/exeption_class.dart';
import 'package:get/get.dart';
import '../instance.dart';
import 'package:http/http.dart' as http;
import '../widget.dart';

class GetExchangeRateCurrency extends GetxController {
  //CurrencyGettingMethod
  Future<String> exchangeRateCurrencies(
    String source,
    String target,
  ) async {
    http.Response? response;
    try {
      response = await http.get(Uri.parse(api.exchangeRates +
          '${source.toLowerCase()}/${target.toLowerCase()}.json'));
      switch (response.statusCode) {
        case 200:
          return response.body;
          break;
        case 400:
          throw BadRequestException(response.body.toString());
        default:
          throw FetchDataException(
              'Error occured while Communication with Server with StatusCode: ${response.statusCode}');
      }
    } on SocketException {
      snackBar();
      throw FetchDataException('No internet connection');
    } on BadRequestException {
      throw BadRequestException(response!.body.toString());
    }
  }
}
