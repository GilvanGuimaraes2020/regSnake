import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TesteTabela extends StatelessWidget {
   String title;
   int posicao;
  TesteTabela({ Key key, this.title, this.posicao }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      color: posicao.isEven?
      Colors.red:
      Color.fromARGB(255, 175, 98, 92),
      child: Column(
        children: [
          RotatedBox(
            quarterTurns: -1,
            child: Center(child: Text(title ,))),
          
        ],
      ),
    );
  }
}