import 'package:flutter/material.dart';
import 'package:projeto_reg_snake/data/models/m_menu.dart';
import 'package:projeto_reg_snake/view/screens/widgets/w_menu_list.dart';



class MenuPage extends StatefulWidget {
  MenuPage({Key key, this.title, this.login}) : super(key: key);

  final String login;
  final String title;
  

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<Menu> listMenu = [];
  bool checaAlerta = false;


  @override
  void initState() {
    super.initState();

    Menu menu1 = new Menu(name:'Sobre',icon:'imagens/information.svg');
    listMenu.add(menu1);
    Menu menu2 = new Menu(name:'Cadastro de doador',icon:'imagens/scared.svg');
    listMenu.add(menu2);
    Menu menu3 = new Menu(name:'Registro de serpente',icon:'imagens/registration.svg');
    listMenu.add(menu3);
    Menu menu4 = new Menu(name:'Consulta',icon:'imagens/find.svg');
    listMenu.add(menu4);
    Menu menu5 = new Menu(name:'Alimentação',icon:'imagens/rat.svg');
    listMenu.add(menu5);
    Menu menu6 = new Menu(name:'Vermifugação',icon:'imagens/medication.svg');
    listMenu.add(menu6);
    Menu menu7 = new Menu(name:'Óbito',icon:'imagens/death.svg');
    listMenu.add(menu7);
    Menu menu8 = new Menu(name:'Especie',icon:'imagens/especie.svg');
    listMenu.add(menu8);
     Menu menu9 = new Menu(name:'Relatorio',icon:'imagens/relatorio.svg');
    listMenu.add(menu9);

    
    
  }

  

  @override
  Widget build(BuildContext context) {
    if (widget.login == "gilmacedosn@gmail.com"){
      listMenu[0] = new Menu(name:"Administrador" , icon: 'imagens/information.svg');

    }

    
   
    print(listMenu[0].name);
    return Scaffold(
        appBar: AppBar(
          title: Text('RegSnake', style: Theme.of(context).textTheme.headline1),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body:  Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              WMenuList(menuList: listMenu,)
            ]),
        ),


    );
  }
}
