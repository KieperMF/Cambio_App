class Coins{
  String coinOne;
  String coinTwo;
  String price;

  Coins({
    required this.coinOne,
    required this.coinTwo,
    required this.price,
  });

  factory Coins.fromJson(Map<String, dynamic> json){

    return Coins(
      coinOne: json['code']!,
      coinTwo: json['codein']!,
      price: json['ask']!,
    );
  }
}


// https://economia.awesomeapi.com.br/last/BRL-USD