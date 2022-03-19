import 'package:flutter/material.dart';
import 'package:projeto_reg_snake/view/reports/teste.dart';

class RelatorioPlantel extends StatefulWidget {
  const RelatorioPlantel({ Key key }) : super(key: key);

  @override
  State<RelatorioPlantel> createState() => _RelatorioPlantelState();
}

class _RelatorioPlantelState extends State<RelatorioPlantel> {
  ScrollController scrollController = new ScrollController(initialScrollOffset: 0 , debugLabel: "erro");
 List<String> mesesDoAno =[
   'Janeiro',
   'Fevereiro',
   'Março',
   'Abril',
   'Maio',
   'Junho',
   'Julho',
   'Agosto',
   'Setembro',
   'Outubro',
   'Novembro',
   'Dezembro'
 ];

 List<String> labelsRelatorio = [
   'Id Animal',
   'Especie', 
   'Sexo Animal',
   'Nome doador',
   'Endereço Doador',
   'Data Doaçao',
   

 ];
 

 List<TextEditingController> controlers = [new TextEditingController(),
 new TextEditingController(), new TextEditingController(), new TextEditingController(),
 new TextEditingController()];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Relatorio"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue ,
            Colors.yellow])
         ),
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: double.infinity,
              child: Scrollbar(
                controller: scrollController,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: scrollController,
                  shrinkWrap: true,
                    itemBuilder: (context , i){
                      return InkWell(
                        child: TesteTabela(title: mesesDoAno[i], posicao: i,),
                        
                        onTap: (){
                          setState(() {
                            controlers.forEach((element) {
                              element.text = "Teste $i";
                            });

                          });
                        },
                        );
                        },
                   
                   itemCount: mesesDoAno.length),
              ),
            ),
            Divider(),

            Flexible(
              child: Container(
                child: Column(
                  children: List.generate(5, (index) => 
                  TextField(
                    controller: controlers[index],
                    decoration: InputDecoration(
                      labelText: labelsRelatorio[index]
                    ),
                  )),
                ),
              )
            ),
     /*  Flexible(
        
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 20,
          itemBuilder: (context , i){
            return Container(
              color: Colors.green,
              padding: EdgeInsets.all(8),
              child: Text("teste $i"),
            );
          })),  */
   
          ],
        ),
      )
    );

  }

  }
  
   /* criaTabela() {
    return Table(
      defaultColumnWidth: FixedColumnWidth(150.0),

      border: TableBorder(
        horizontalInside: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        verticalInside: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 1.0,
        ),
      ),
      children: [
        _criarLinhaTable("Pontos, Time, Gols, Teste, Teste, Teste"),
        _criarLinhaTable("25, Palmeiras,16 , Teste, Teste, Teste "),
        _criarLinhaTable("20, Santos, 5 , Teste, Teste, Teste"),
        _criarLinhaTable("17, Flamento, 6 , Teste, Teste, Teste"),
      ],
    );
  }
  _criarLinhaTable(String listaNomes) {
    return TableRow(
      children: 
      List.generate
      (3, (index) => Text("Teste $index"))

      
     /*  listaNomes.split(',').map((name) {
        return Container(
          alignment: Alignment.center,
          child: Text(
            name,
            style: TextStyle(fontSize: 20.0),
          ),
          padding: EdgeInsets.all(8.0),
        );
      }).toList(), */
    );
  } */
