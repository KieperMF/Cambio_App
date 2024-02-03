import 'package:flutter/material.dart';

class CustomAlert extends StatelessWidget{
  
  final String title;
  const CustomAlert({
    Key? key,
    required this.title
  }) : super(key: key);
  @override
  Widget build(BuildContext context){
    return AlertDialog(
        content: Text(
            title),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Fechar'),
          ),
        ],
      );
  }
}