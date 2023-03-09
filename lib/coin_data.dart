import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = '11D2DDB4-D6A9-47D7-A170-E2508447746B';
const coinAPIUrl = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future<dynamic> getCoinData(String? currency) async {
    Map<String, String> cryptoValue = {};
    for (String crypto in cryptoList) {
      http.Response response = await http
          .get(Uri.parse('$coinAPIUrl/$crypto/$currency?apikey=$apiKey'));
      if (response.statusCode == 200) {
        cryptoValue[crypto] =
            jsonDecode(response.body)['rate'].toStringAsFixed(0);
      } else {
        throw 'Problem with the get request.\nError ${response.statusCode}';
      }
    }
    return cryptoValue;
  }
}
