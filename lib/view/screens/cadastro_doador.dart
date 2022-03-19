import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto_reg_snake/control/cadastro_controller.dart';
import 'package:projeto_reg_snake/control/doador_controller.dart';
import 'package:projeto_reg_snake/data/models/doador.dart';
import 'package:projeto_reg_snake/data/service/snake_auth_service.dart';
import 'package:projeto_reg_snake/data/service/snake_service_api_get.dart';
import 'package:projeto_reg_snake/data/service/snake_service_api_post.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_botao.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_campo_texto.dart';
import 'package:toast/toast.dart';

import 'menu_page.dart';


class CadastroDoador extends StatefulWidget {
  CadastroDoador({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CadastroDoador createState() => _CadastroDoador();
}

class _CadastroDoador extends State<CadastroDoador> {
  DoadorController cadastroController = DoadorController(
      txtCPF: MaskedTextController(mask: '000.000.000-00'),
      txtNome: TextEditingController(),
      formKey: GlobalKey<FormState>(), 
      txtEndereco: TextEditingController(),
      snakeServiceApiPost: new SnakeServiceApiPost()
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastrar Doador',
              style: Theme.of(context).textTheme.headline1),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(40),
                child: Form(
                  key: cadastroController.formKey,
                  child: Column(children: [
                    /*SvgPicture.asset('imagens/scared.svg',
                        semanticsLabel: 'scared'), */
                        Icon(Icons.person_add, size: 50,),
                    WCampoTexto(
                       validator: (value) {
                          if (value.length < 12) {
                            return 'Informe o nome completo do doador';
                            } else {
                            return null;
                            }
                          },
                        rotulo: 'Nome',
                        variavel: cadastroController.txtNome,
                        eSenha: false),
                   
                    WCampoTexto(
                       validator: (value) {
                          if (value.length < 12) {
                            return 'Informe o CPF do doador';
                            } else {
                            return null;
                            }
                          },
                      rotulo: 'CPF',
                      variavel: cadastroController.txtCPF,
                      eSenha: false,
                    ),
                    WCampoTexto(
                      
                        validator: (value) {
                          RegExp valor =new RegExp(r'^[(a-z)+(A-Z)+( @#$%&,*|\/?)+(0-9)]+$') ;
                          if (value.length >= 6 && valor.hasMatch(value)) {
                            return null;
                            } else {
                            return 'Informe o endereço';
                            }
                          },
                        rotulo: 'Endereço',
                        variavel: cadastroController.txtEndereco,
                        eSenha: false),
                    GestureDetector(
                      onTap: () {
                       cadastro();
                      
                      },
                      child: WBotao(rotulo: 'Cadastrar'),
                    )
                  ]),
                ))));
  }



  Future<void> cadastro() async {
    if (cadastroController.formKey.currentState.validate()) {
     
     
    /// Aqui salva os doadores
    ///
       
        Doador doador = new Doador();
        doador.nome = cadastroController.txtNome.text;
        doador.endereco = cadastroController.txtEndereco.text;
        doador.cpf = cadastroController.txtCPF.text;

        Map<String, dynamic> map = {
          'nome': doador.nome,
          'endereco': doador.endereco,
          'cpf': doador.cpf,
        };

        

        print(map);

        bool result = await cadastroController.snakeServiceApiPost
            .addDado(colecao: 'doador', map: map);

        if (result == true) {
          Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 100),
                pageBuilder: (_, __, ___) => MenuPage()),
          );
          } else {
            Toast.show("Erro ao Salvar", context,
                duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
          }
    }

    
  }
}
