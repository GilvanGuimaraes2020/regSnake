//rimport 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_botao.dart';

class AcoesAdministrador extends StatefulWidget {
  const AcoesAdministrador({ Key key, this.title }) : super(key: key);
final String title;


  @override
  _AcoesAdministradorState createState() => _AcoesAdministradorState();
}

class _AcoesAdministradorState extends State<AcoesAdministrador> {
  

  
  @override 
  void initState(){

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Açoes do Administrador",
        style: Theme.of(context).textTheme.headline1),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Form(

            child: Column(
              

              children: [
                GestureDetector(
                  onTap: (){
                    print("Acionou");
                  },
                  child: WBotao(rotulo:'Listar Usuarios'),
                )
              ],
            ),
            ),),
      ),
    );
  }
}

class ListaUsuarios{


}