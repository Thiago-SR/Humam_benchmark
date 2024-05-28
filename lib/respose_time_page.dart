import 'dart:async';
//import 'dart:isolate';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResponseTimePage extends StatefulWidget {
  @override
  _ResponseTimePageState createState() => _ResponseTimePageState();
}

class _ResponseTimePageState extends State<ResponseTimePage> {
  Color _currentColor = Colors.blue;
  DateTime? _startTime;
  DateTime? _endTime;
  Stopwatch timer = new Stopwatch();
  

  Future<void> _startTest() async  {
    setState(() {
      _currentColor = Colors.red;
      
      // Iniciar o temporizador para mudar a cor após 3 segundos
      Timer(const Duration(seconds: 3), () {
        setState(() {
          timer.reset();
          _currentColor = Colors.green;
          timer.start();
          _startTime = DateTime.now();
        });
      });
    });
  }

  void _endTest() {
    setState(() {
      timer.stop();
      _endTime = DateTime.now();
      _currentColor = Colors.blue;
    });
  }

  int _calculateResponseTime() {
    if (_startTime != null && _endTime != null) {
      return _endTime!.difference(_startTime!).inMilliseconds;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste de Tempo de Resposta'),
      ),
      body: GestureDetector(
        onTap: ()async {
          if (_currentColor == Colors.green) {
            _endTest();
          }
          else if(_currentColor == Colors.blue){
            _startTest();
          
          }
        },
        child: Container(
          color: _currentColor,
            child: Center(
              child: _currentColor == Colors.blue
                  ? Container(   
                    child: (_startTime != null && _endTime != null)? 
                    Text('Tempo de resposta: ${timer.elapsedMilliseconds} ms, ${_calculateResponseTime()}',
                     style: const TextStyle(color: Colors.white,
                     fontWeight: FontWeight.bold,
                      fontSize: 20.0,))
                    :  ElevatedButton( onPressed: () {_startTest();},
                      child: const Text('Iniciar Teste', 
                      style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,),
                      )),
                        
                  )
                  : Text(
                      _currentColor == Colors.red
                          ? 'Clique quando a tela ficar verde'
                          : 'clique',
                      style: const TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,),
                    ),
            ),
          ),
        ),
      );
    
  }
}
