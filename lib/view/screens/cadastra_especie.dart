import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto_reg_snake/control/especie_controller.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_botao.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_campo_bcode.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_campo_texto.dart';

class CadastraEspecie extends StatefulWidget {
  const CadastraEspecie({ Key key, this.title }) : super(key: key);
final String title;


  @override
  _CadastraEspecieState createState() => _CadastraEspecieState();
}

class _CadastraEspecieState extends State<CadastraEspecie> {
 EspecieController especieController = EspecieController(
   txtEspecie : TextEditingController(), 
   txtData : TextEditingController(), 
   formKey : GlobalKey<FormState>()) ;
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Especie"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Form(
            child: Column(
              children: [
                SvgPicture.asset('imagens/scared.svg' , semanticsLabel: 'scared',),
               WCampoTexto(
                 eSenha: false,
                 rotulo: 'Especie',
                 validator: (value){
                   if(value.length<1){
                     return 'Insira um nome';
                   } else{
                     return null;
                   }
                 },
                 variavel: especieController.txtEspecie,
               ),
               GestureDetector(
                 child: WBotao(rotulo: 'Salvar'),
               )
              ],
            )
          ),
        ),
      ),


    );
  }
}