import 'package:flutter/material.dart';

import 'package:teste_de_desempenho/respose_time_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tempo de Resposta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResponseTimePage(),
    );
  }
}

