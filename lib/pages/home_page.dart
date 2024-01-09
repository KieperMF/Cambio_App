import 'package:cambio_app/requests/http_request.dart';
import 'package:flutter/material.dart';
import 'package:cambio_app/widgets/alert.dart';

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
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.question_mark_outlined),
              onPressed: () {
                exibirDialogo(context);
              },
            ),
          ],
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
                          onChanged: (String? newValue2) {
                            setState(() {
                              selectedCoin2 = newValue2!;
                            });
                          },
                          items: validCoins2
                              .map<DropdownMenuItem<String>>((String coin2) {
                            return DropdownMenuItem<String>(
                              value: coin2,
                              child: Text(coin2),
                            );
                          }).toList(),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      ElevatedButton(
                          onPressed: () {
                            _resquest.requestCoins(cashValue.text);
                          },
                          child: const Text('Converter')),
                      const Padding(padding: EdgeInsets.all(10)),
                      if (coin != null) ...[
                        SizedBox(
                          width: 240,
                          child: Text(
                              "${cashValue.text} $selectedCoin = ${valor} $selectedCoin2"),
                        )
                      ]
                    ],
                  );
                })));
  }
}
