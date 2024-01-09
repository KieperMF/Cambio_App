import 'package:flutter/material.dart';

void exibirDialogo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content:const Text('Algumas combinações não são possiveis de serem feitas.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child:const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
