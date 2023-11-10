import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:network/model/crypto_currency_listing_data.dart';

class ApiProvider {
  Client client = Client();

  Future<CryptoCurrencyListing> getTop20CryptoCurrencyListing() async {
    final url = Uri.parse(
        'https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing?start=1&limit=20&sort=cmcRank&sortType=desc&convert=USD');
    final response = await client.get(url);
    return CryptoCurrencyListing.fromJson(json.decode(response.body));
  }
}
