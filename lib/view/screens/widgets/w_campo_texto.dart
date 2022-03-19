import 'package:flutter/material.dart';

class WCampoTexto extends StatelessWidget {
  final variavel;
  final String rotulo;
  final bool eSenha;
  final IconButton icon;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onchange;

  WCampoTexto({this.variavel, this.rotulo, this.eSenha, this.icon, this.validator, this.onchange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: variavel,
        style: TextStyle(fontSize: 24),
        obscureText: eSenha,
        onChanged:onchange,

        decoration: InputDecoration(
          labelText: rotulo,
          labelStyle: TextStyle(fontSize: 16),
          hintText: 'Insira as informações',
          hintStyle: TextStyle(fontSize: 16),
          suffixIcon: icon != null ? icon : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        //validar a entrada de dados
        validator: validator
      ),
    );
  }
}
