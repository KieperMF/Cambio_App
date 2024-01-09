import 'package:cambio_app/requests/http_request.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController cashValue = TextEditingController();
  HttpResquest _resquest = HttpResquest();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Conversor de Moeda"),
        ),
        body: Center(
            child: ListenableBuilder(
                listenable: _resquest,
                builder: (context, _) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        child: TextField(
                          decoration: const InputDecoration(
                              hintText: "informe um valor"),
                          controller: cashValue,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      const Text(
                        'De',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 240,
                        height: 50,
                        child: DropdownButton<String>(
                          value: selectedCoin,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCoin = newValue!;
                            });
                          },
                          items: validCoins
                              .map<DropdownMenuItem<String>>((String coin) {
                            return DropdownMenuItem<String>(
                              value: coin,
                              child: Text(coin),
                            );
                          }).toList(),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(15)),
                      const Text(
                        "Para",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 240,
                        height: 50,
                        child: DropdownButton<String>(
                          value: selectedCoin2,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCoin = newValue!;
                            });
                          },
                          items: validCoins
                              .map<DropdownMenuItem<String>>((String coin) {
                            return DropdownMenuItem<String>(
                              value: coin,
                              child: Text(coin),
                            );
                          }).toList(),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _resquest.requestCoins(cashValue.text);
                          },
                          child: const Text('Converter')),
                      if (coin != null) ...[
                        SizedBox(
                          width: 240,
                          child: Text(
                              "${cashValue.text} $selectedCoin = ${reduceNumber(valor)} $selectedCoin2"),
                        )
                      ]
                    ],
                  );
                })));
  }
}
