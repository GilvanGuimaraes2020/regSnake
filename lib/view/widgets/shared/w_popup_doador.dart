
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_reg_snake/data/service/snake_service_api_get.dart';


class WpopupDoador extends StatefulWidget {
   String name;   
   String telefone;
   String cpf;
   String endereco;
   String idCliente;
   WpopupDoador({Key key });

  @override
  _WpopupDoadorState createState() => _WpopupDoadorState();
}

 
  
class _WpopupDoadorState extends State<WpopupDoador> {
  SnakeServiceApiGet snakeServiceApiGet = new SnakeServiceApiGet();
  CollectionReference users = FirebaseFirestore.instance.collection("doador");
  

  Future<List> retornaLista()async{
     List doadores = 
     await  users
    .get()
    .then((value) => value.docs.map((e) => e.data()).toList());
    /* .then((value) {
      
      return value.docs.map((e) => e.data()).toList();
       for (var dado in value.docs) {
        print(dado.data());
        doadores.add(dado.data());         
       } 
      
    }); */

    print(doadores);

    return doadores;    
    }

 /* @override
  void initState() {
    //ist<QueryDocumentSnapshot> listaCpf = [];
    
    users
    .get()
    .then((value) async {
      
      
      for (var dado in value.docs) {
        print(dado.data());
        doadores.add(dado.data());         
       }
      
    });    

    super.initState();
  } */

   
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
                         title: Center(child: Text("Selecione o doador")),
                        backgroundColor: Colors.blue[200],
                         //Forma lista com cadastros ja realizados para verificar se ja esta salvo
                         content: FutureBuilder<List>(
                           future: retornaLista(),
                           builder: (context, snapshot) {
                           if(snapshot.hasError){
                             print("Erro");
                            return Icon(Icons.error); 
                           } else if(snapshot.hasData){
                             print("Dados");
                             print(snapshot.data);
                             return listaClienteCadastrado(snapshot.data);
                           } else{
                             print("Esperando");
                             return CircularProgressIndicator(); 
                           }
                           
                         },),
                         
                       );
  }

  listaClienteCadastrado(List doadores){
    print(doadores);
   
      return  Container(
              height: 300,
              width: 300,         
              child: 
              ListView.builder(
               itemCount: doadores.length,
              
               itemBuilder: (context, index){
                
                   return Card(
                     color: Colors.white,
                     elevation: 3,
                     shape: RoundedRectangleBorder(
                       borderRadius:BorderRadius.all(
                         Radius.circular(10)
                       ) 
                     ),
                     child: ListTile(
                     title: Text("Nome: ${doadores[index]['nome']}"),
                     
                     subtitle: Text("Endereço: ${doadores[index]['endereco']}"),
                                                        
                     onTap: (){
                      
                     },
                                    ),
                   );          
               },
      
             ), 
           );
   
      } 
    
    
}
