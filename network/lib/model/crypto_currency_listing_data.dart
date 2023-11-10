// ignore_for_file: non_constant_identifier_names

class CryptoCurrencyListing {
  CryptoCurrencyListingStatus? status;
  CryptoCurrencyListingData? data;

  CryptoCurrencyListing.fromJson(dynamic json) {
    if (json['status'] != null) {
      status = CryptoCurrencyListingStatus.fromJson(json['status']);
    }
    if (json['data'] != null) {
      data = CryptoCurrencyListingData.fromJson(json['data']);
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status?.toJson();
    map['data'] = data?.toJson();
    return map;
  }
}

class CryptoCurrencyListingStatus {
  String? timestamp;
  String? error_code;
  String? error_message;
  String? elapsed;
  int? credit_count;

  CryptoCurrencyListingStatus.fromJson(dynamic json) {
    timestamp = json['timestamp'];
    error_code = json['error_code'];
    error_message = json['error_message'];
    elapsed = json['elapsed'];
    credit_count = json['credit_count'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['timestamp'] = timestamp;
    map['error_code'] = error_code;
    map['error_message'] = error_message;
    map['elapsed'] = elapsed;
    map['credit_count'] = credit_count;
    return map;
  }
}

class CryptoCurrencyListingData {
  List<CryptoCurrencyListingItem>? cryptoCurrencyList;
  String? totalCount;

  CryptoCurrencyListingData.fromJson(dynamic json) {
    cryptoCurrencyList = List.empty(growable: true);
    if (json['cryptoCurrencyList'] != null) {
      json['cryptoCurrencyList'].forEach((v) {
        cryptoCurrencyList?.add(CryptoCurrencyListingItem.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (cryptoCurrencyList != null) {
      map['cryptoCurrencyList'] =
          cryptoCurrencyList?.map((v) => v.toJson()).toList();
    }
    map['totalCount'] = totalCount;
    return map;
  }
}

class CryptoCurrencyListingItem {
  int? id;
  String? name;
  String? symbol;
  String? slug;
  List<String>? tags;
  int? cmcRank;
  int? marketPairCount;
  double? circulatingSupply;
  int? selfReportedCirculatingSupply;
  double? totalSupply;
  double? maxSupply;
  int? isActive;
  String? lastUpdated;
  String? dateAdded;
  List<CryptoCurrencyListingItemQuotesItem>? quotes;
  bool? isAudited;
  List<int>? badges;

  CryptoCurrencyListingItem.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    if (json['tags'] != null) {
      tags = List.empty(growable: true);
      json['tags'].forEach((v) {
        if (v != null) {
          tags?.add(v);
        }
      });
    }
    cmcRank = json['cmcRank'];
    marketPairCount = json['marketPairCount'];
    circulatingSupply = json['circulatingSupply'];
    selfReportedCirculatingSupply = json['selfReportedCirculatingSupply'];
    totalSupply = json['totalSupply'];
    maxSupply = json['maxSupply'];
    isActive = json['isActive'];
    lastUpdated = json['lastUpdated'];
    dateAdded = json['dateAdded'];
    if (json['quotes'] != null) {
      quotes = List.empty(growable: true);
      json['quotes'].forEach((v) {
        quotes?.add(CryptoCurrencyListingItemQuotesItem.fromJson(v));
      });
    }
    isAudited = json['isAudited'];
    if (json['badges'] != null) {
      badges = List.empty(growable: true);
      json['badges'].forEach((v) {
        if (v != null) {
          badges?.add(v);
        }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['symbol'] = symbol;
    map['slug'] = slug;
    map['tags'] = tags;
    map['cmcRank'] = cmcRank;
    map['marketPairCount'] = marketPairCount;
    map['circulatingSupply'] = circulatingSupply;
    map['selfReportedCirculatingSupply'] = selfReportedCirculatingSupply;
    map['totalSupply'] = totalSupply;
    map['maxSupply'] = maxSupply;
    map['isActive'] = isActive;
    map['lastUpdated'] = lastUpdated;
    map['dateAdded'] = dateAdded;
    if (quotes != null) {
      map['quotes'] = quotes?.map((v) => v.toJson()).toList();
    }
    map['isAudited'] = isAudited;
    map['badges'] = badges;
    return map;
  }
}

class CryptoCurrencyListingItemQuotesItem {
  String? name;
  double? price;
  double? volume24h;
  double? marketCap;
  double? percentChange1h;
  double? percentChange24h;
  double? percentChange7d;
  String? lastUpdated;
  double? percentChange30d;
  double? percentChange60d;
  double? percentChange90d;
  double? fullyDilluttedMarketCap;
  double? marketCapByTotalSupply;
  double? dominance;
  double? turnover;
  double? ytdPriceChangePercentage;
  double? percentChange1y;

  CryptoCurrencyListingItemQuotesItem.fromJson(dynamic json) {
    name = json['name'];
    price = json['price'];
    volume24h = json['volume24h'];
    marketCap = json['marketCap'];
    percentChange1h = json['percentChange1h'];
    percentChange24h = json['percentChange24h'];
    percentChange7d = json['percentChange7d'];
    lastUpdated = json['lastUpdated'];
    percentChange30d = json['percentChange30d'];
    percentChange60d = json['percentChange60d'];
    percentChange90d = json['percentChange90d'];
    fullyDilluttedMarketCap = json['fullyDilluttedMarketCap'];
    marketCapByTotalSupply = json['marketCapByTotalSupply'];
    dominance = json['dominance'];
    turnover = json['turnover'];
    ytdPriceChangePercentage = json['ytdPriceChangePercentage'];
    percentChange1y = json['percentChange1y'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['price'] = price;
    map['volume24h'] = volume24h;
    map['marketCap'] = marketCap;
    map['percentChange1h'] = percentChange1h;
    map['percentChange24h'] = percentChange24h;
    map['percentChange7d'] = percentChange7d;
    map['lastUpdated'] = lastUpdated;
    map['percentChange30d'] = percentChange30d;
    map['percentChange60d'] = percentChange60d;
    map['percentChange90d'] = percentChange90d;
    map['fullyDilluttedMarketCap'] = fullyDilluttedMarketCap;
    map['marketCapByTotalSupply'] = marketCapByTotalSupply;
    map['dominance'] = dominance;
    map['turnover'] = turnover;
    map['ytdPriceChangePercentage'] = ytdPriceChangePercentage;
    map['percentChange1y'] = percentChange1y;
    return map;
  }
}
