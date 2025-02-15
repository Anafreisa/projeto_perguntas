import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas': [
          {'texto': 'Preto', 'pontuacao': 10} ,
          {'texto': 'Vermelho', 'pontuacao': 5}, 
          {'texto': 'Verde', 'pontuacao': 3}, 
          {'texto': 'Branco', 'pontuacao': 1},
        ],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'respostas': [
          {'texto': 'Coelho', 'pontuacao': 10},
          {'texto': 'Cobra', 'pontuacao': 5},
          {'texto': 'Elefante', 'pontuacao': 3},
          {'texto': 'Leão','pontuacao': 1},
        ],
      },
      {
        'texto': 'Qual é o seu esporte favorito?',
        'respostas': [
          {'texto': 'Futebol', 'pontuacao': 10},
          {'texto': 'Volei', 'pontuacao': 5},
          {'texto': 'Basquete','pontuacao': 3}, 
          {'texto': 'Tenis','pontuacao': 1},
        ],
      }
  ];

  void _responder(int pontuacao) {
    if(temPerguntaSelecionada){
      setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;  
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada 
            ? Questionario(perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada, 
                responder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}