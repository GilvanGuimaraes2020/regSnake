import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto_reg_snake/data/models/m_menu.dart';
import 'package:projeto_reg_snake/view/reports/relatorio_plantel.dart';
import 'package:projeto_reg_snake/view/screens/acoes_administrador.dart';
import 'package:projeto_reg_snake/view/screens/cadastra_especie.dart';
import 'package:projeto_reg_snake/view/screens/cadastro_doador.dart';
import '../alimenta_serpente.dart';
import '../cadastro_serpente.dart';
import '../cadastro_usuario.dart';
import '../consulta_serpente.dart';
import '../obito_serpente.dart';
import '../sobre_page.dart';
import '../vermifugacao_serpente.dart';


class WMenu extends StatelessWidget {
  final Menu menu;


  WMenu({this.menu});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        if(menu.name == 'Sobre'){
          Navigator.push(
            context, PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 100),
              pageBuilder: (_, __, ___) => SobrePage(title: menu.name,)),
          );
        }
        else if(menu.name == 'Administrador'){
          Navigator.push(
            context, PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 100),
              pageBuilder: (_, __, ___) => AcoesAdministrador(title: menu.name,)),
          );
        }else if(menu.name == 'Cadastro de usuário'){
          Navigator.push(
            context, PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 100),
              pageBuilder: (_, __, ___) => CadastroUsuario(title: menu.name,)),
          );
        }else if(menu.name == 'Cadastro de doador'){
          Navigator.push(
            context, PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 100),
              pageBuilder: (_, __, ___) => CadastroDoador(title: menu.name,)),
          );
        }else if(menu.name == 'Registro de serpente'){
          Navigator.push(
            context, PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 100),
              pageBuilder: (_, __, ___) => CadastroSerpente()),
          );
        }else if(menu.name == 'Consulta'){
          Navigator.push(
            context, PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 100),
              pageBuilder: (_, __, ___) => ConsultaSerpente()),
          );
        }else if(menu.name == 'Alimentação'){
          Navigator.push(
            context, PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 100),
              pageBuilder: (_, __, ___) => AlimentaSerpente()),
          );
        }else if(menu.name == 'Vermifugação'){
          Navigator.push(
            context, PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 100),
              pageBuilder: (_, __, ___) => VermifugacaoSerpente()),
          );
        }else if(menu.name == 'Óbito'){
          Navigator.push(
            context, PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 100),
              pageBuilder: (_, __, ___) => ObitoSerpente()),
          );
        }else if(menu.name == 'Especie'){
          Navigator.push(
            context, PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 100),
              pageBuilder: (_, __, ___) => CadastraEspecie()),
          );
        }
        else if(menu.name == 'Relatorio'){
          Navigator.push(
            context, PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 100),
              pageBuilder: (_, __, ___) => RelatorioPlantel()),
          );
        }

      },
      child:Hero(
        tag:menu.name,
        child:Container(
          width:MediaQuery.of(context).size.width/3,
          height: MediaQuery.of(context).size.height/4,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(2, 4), // Shadow position
              ),
            ],
          ),
          child: Stack(
            //mainAxisAlignment: MainAxisAlignment.center,
            alignment: Alignment.center,
            children:<Widget> [
              menu.name == "Alimentação" ? Positioned(
                right: 0,
                top: 0,
                child:  Container(
                    width: 30,
                    height: 30,
                    child: Center(
                      child: Text("1" , style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.redAccent
                        ),
                  )):
                  Positioned(child: Container(),),

              SvgPicture.asset(menu.icon,
                semanticsLabel: menu.name,
                color: Colors.blue,
                height: 40,),

              Positioned(
                bottom: 10,
                child: Container(
                  child: Text(menu.name, style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.height/60
                  ))
                ),
              )

            ],
          ),
        )
      )
    ) ;
  }
}
