import 'package:network/network.dart';

class CryptoCurrencyListingRepository {
  final apiProvider = ApiProvider();
  Future<CryptoCurrencyListing> getTop20CryptoCurrencyListing() => apiProvider.getTop20CryptoCurrencyListing();
}