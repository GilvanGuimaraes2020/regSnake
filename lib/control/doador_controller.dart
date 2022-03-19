
import 'package:projeto_reg_snake/data/service/snake_service_api_post.dart';

class DoadorController{
  var txtNome;
  var txtCPF;
  var txtEndereco;
  var formKey;

  SnakeServiceApiPost snakeServiceApiPost;
  

  DoadorController({this.txtNome, this.txtCPF, this.txtEndereco,
  this.formKey, this.snakeServiceApiPost});

  
}