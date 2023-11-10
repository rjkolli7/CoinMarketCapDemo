import 'package:network/network.dart';
import 'package:repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class CryptoCurrencyListingBloc {
  final _repository = CryptoCurrencyListingRepository();
  final _listingTop20CryptoCurrencyFetcher = PublishSubject<CryptoCurrencyListing>();

  Stream<CryptoCurrencyListing> get top20CryptoCurrencyListingStream => _listingTop20CryptoCurrencyFetcher.stream;

  getTop20CryptoCurrencyListing() async {
    CryptoCurrencyListing top20CryptoCurrencyListing = await _repository.getTop20CryptoCurrencyListing();
    _listingTop20CryptoCurrencyFetcher.sink.add(top20CryptoCurrencyListing);
  }

  dispose() {
    _listingTop20CryptoCurrencyFetcher.close();
  }
}