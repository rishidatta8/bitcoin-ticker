import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:io';

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

class CoinData {
  var currencyName;
  var btcPrice;
  var ethPrice;
  var ltcPrice;
  var batPrice;
  var bnbPrice;
  var neoPrice;
  var data;
  int statusCode;

  Future<void> getPrice(String currency) async {
    String url =
        'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,LTC,BAT,NEO,BNB&tsyms=$currency&api_key=8fd1c64220832dfce509f1548360eab03888e2d96820af6a155847a0242de823';

    var webData = await http.get(url);
    statusCode = webData.statusCode;
      data = webData.body;
      btcPrice = jsonDecode(data)['BTC'][currency];
      ethPrice = jsonDecode(data)['ETH'][currency];
      ltcPrice = jsonDecode(data)['LTC'][currency];
      batPrice = jsonDecode(data)['BAT'][currency];
      neoPrice = jsonDecode(data)['NEO'][currency];
      bnbPrice = jsonDecode(data)['BNB'][currency];
      currencyName = currency;
  }
}
