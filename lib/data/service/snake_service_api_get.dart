
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;

class SnakeServiceApiGet {
  SnakeServiceApiGet();

  Future<QueryDocumentSnapshot<Object>> consultaDado(
      String colecao, String atributo, String valorBuscado) async {
    CollectionReference users = FirebaseFirestore.instance.collection(colecao);
    List<QueryDocumentSnapshot> dados = await users
        .where(atributo, isEqualTo: valorBuscado)
        .get()
        .then((snapshot) => snapshot.docs);

    print(dados.first['chip']);

    return dados.first;
  }

  Future<String> downloadURL(String chip) async {
    String downloadURL = await FirebaseStorage.instance
        .ref('fotosSerpente/$chip.png')
        .getDownloadURL();

    return downloadURL;
  }

//verificaçao se ha doador salvo com cpf passado
  Future<String> dadoRepetido(String cpfDoador) async{
    String result;
    Query<Map<String , dynamic>> dadoRepetido = FirebaseFirestore.instance.collection("doador").where("cpf" , isEqualTo: cpfDoador);
    await dadoRepetido.get()
    .then((value) {
      print(value.docs.cast());
      
      if(value.docs.cast().isEmpty){
      result ="CPF Inexistente" ;
    } else{
      result =  "CPF Existente";
    }

    } )
    .onError((error, stackTrace) {
      print(error);
      result = "Erro ao buscar CPF";
    } );
    
    return result;   

  }
Future<List<QueryDocumentSnapshot>> listaCpf() async {
    CollectionReference users = FirebaseFirestore.instance.collection("doador");
    List<QueryDocumentSnapshot> dados = await users
        .get()
        .then((snapshot) => snapshot.docs);

    //print(dados.first['chip']);

        
    return dados;
  }
 
}
