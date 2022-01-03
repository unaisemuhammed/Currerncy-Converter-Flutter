import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../instance.dart';
import 'package:http/http.dart' as http;

import 'exception_handler.dart';

class GetExchangeRateCurrency extends GetxController {

  //CurrencyGettingMethod
  Future<String> exchangeRateCurrencies(
    String source,
    String target,
  ) async {
    final response = await http.get(Uri.parse(api.exchangeRates +
        '${source.toLowerCase()}/${target.toLowerCase()}.json'));
    switch (response.statusCode) {
      case 200:
        return response.body;
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
