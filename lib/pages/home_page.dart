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
          backgroundColor:Colors.blueGrey,
          title: const Text("Conversor de Moeda"),
          actions: <Widget>[
            IconButton(
              icon:const Icon(Icons.question_mark_outlined),
              onPressed: () {
                exibirDialogo(context);
              },
            ),
          ],
        ),
        backgroundColor:Colors.blueGrey[600],
        body: Center(
            child: ListenableBuilder(
                listenable: _resquest,
                builder: (context, _) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: const Image(image: AssetImage('images/logo_convert.jpg'), 
                        height: 200,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(15)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 160,
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
                                  child: Text(coin,
                                      style: const TextStyle(fontSize: 14,)),
                                );
                              }).toList(),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(10)),
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: TextField(
                              decoration:
                                  const InputDecoration(hintText: "valor"),
                              controller: cashValue,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              autofocus: true,
                            ),
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 160,
                            height: 50,
                            child: DropdownButton<String>(
                              value: selectedCoin2,
                              onChanged: (String? newValue2) {
                                setState(() {
                                  selectedCoin2 = newValue2!;
                                });
                              },
                              items: validCoins2.map<DropdownMenuItem<String>>(
                                  (String coin2) {
                                return DropdownMenuItem<String>(
                                  value: coin2,
                                  child: Text(coin2,
                                      style: const TextStyle(fontSize: 14)),
                                );
                              }).toList(),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(16)),
                          SizedBox(
                              width: 150,
                              height: 50,
                              child: TextField(
                                controller: _resquest.valueConvert,
                                readOnly: true,
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.all(15)),
                      ElevatedButton(
                          onPressed: () {
                            _resquest.requestCoins(cashValue.text);
                          },
                          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.cyan[600])),
                          child: const Text('Converter', style: TextStyle(color: Colors.black)), ),
                    ],
                  );
                })));
  }
}
