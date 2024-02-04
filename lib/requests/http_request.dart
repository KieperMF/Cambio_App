import 'dart:convert';

import 'package:cambio_app/models/coin_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpResquest extends ChangeNotifier {
  TextEditingController valueConvert = TextEditingController();
  Coins? coin;
  double valor = 0;
  List<String> validCoins = [
    'USD - Dólar',
    'BRL - Real',
    'EUR - Euro',
    'GBP - Libra',
    'BTC - Bitcoin',
    'JPY - Iene ',
    'CHF - Franco',
    'CNY - Yuan',
    'ARS - Peso',
  ];

  List<String> validCoins2 = [
    'USD - Dólar',
    'BRL - Real',
    'EUR - Euro',
    'GBP - Libra ',
    'BTC - Bitcoin',
    'JPY - Iene',
    'CHF - Franco',
    'CNY - Yuan',
    'ARS - Peso'
  ];

  String selectedCoin = 'USD - Dólar';
  String selectedCoin2 = 'BRL - Real';
  
  Future<void> requestCoins(String value) async {
    try {
      Uri uri = Uri.parse(
          "https://economia.awesomeapi.com.br/last/${reduzirString(selectedCoin)}-${reduzirString(selectedCoin2)}");
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final decode = jsonDecode(response.body)[
            "${reduzirString(selectedCoin)}${reduzirString(selectedCoin2)}"];
        coin = Coins.fromJson(decode);
        valor = double.parse(value) * double.parse(coin!.price);
        valueConvert.text = valor.toString();
        notifyListeners();
      }
    } catch (e) {
      print('erro');
    }
  }
}

String reduzirString(String s) {
  if (s.length > 3) {
    return s.substring(0, 3);
  } else {
    return s;
  }
}
