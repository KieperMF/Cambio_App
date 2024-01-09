import 'dart:convert';

import 'package:cambio_app/models/coin_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HttpResquest extends ChangeNotifier {
  Future<void> requestCoins(String value) async{
    try{
      Uri uri = Uri.parse("https://economia.awesomeapi.com.br/last/${reduzirString(selectedCoin)}-${reduzirString(selectedCoin2)}");
      final response = await http.get(uri);
      if(response.statusCode == 200){
        final decode = jsonDecode(response.body)["${reduzirString(selectedCoin)}${reduzirString(selectedCoin2)}"];
        coin = Coins.fromJson(decode);
        valor = double.parse(value) * double.parse(coin!.price);
        notifyListeners();
      }
      
    }catch(e){
      print("erro $e");
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

double reduceNumber(double numero) {
  NumberFormat formato = NumberFormat.decimalPattern(); 
  String numeroFormatado = formato.format(numero);
  return double.parse(numeroFormatado);
}

Coins? coin;
double valor = 0;

List<String> validCoins = ['USD - Dólar Americano', 'BRL - Real Brasileiro', 'EUR - Euro', 'GBP - Libra Esterlina', 'BTC - Bitcoin',
'JPY - Iene Japonês', 'CHF - Franco Suiço', 'CNY - Yuan Chinês', 'ARS - Peso Argentino'
]; 

String selectedCoin = 'USD - Dólar Americano';
String selectedCoin2 = 'BRL - Real Brasileiro';