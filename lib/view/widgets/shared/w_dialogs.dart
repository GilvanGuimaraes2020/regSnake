import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WDialogs extends StatefulWidget {
 
  
   WDialogs({ Key key}) ;

  @override
  State<WDialogs> createState() => _WDialogsState();
}

class _WDialogsState extends State<WDialogs> {
  @override
  Widget build(BuildContext context)  {
    return AlertDialog(
      title: Text("Teste") ,
      content: Text("Teste"),
      backgroundColor: Colors.purple,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 30,
      actions: [
        ElevatedButton(
          
          style: ButtonStyle(
          
             backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 123, 39, 202)) ,
          ),
          onPressed: (){
           
          }, 
          child: Text("Entrada")),
           ElevatedButton(
             style: ButtonStyle(
          
             backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 123, 39, 202)) ,
          ),
          onPressed: (){
            
          }, 
          child: Text("Saida")),
      ],
    );
    
  }
}