import 'package:desafio_modulo9/arguments.dart';
import 'package:flutter/material.dart';

class Produto extends StatefulWidget {
  Produto({Key key}) : super(key: key);

  @override
  _ProdutoState createState() => _ProdutoState();
}

class _ProdutoState extends State<Produto> {
  List<dynamic> dados; //Map de String, dynamic

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Selecionar produtos"),
      ),
      body: Container(
        child: Column(
          children: [
            Text(args.nome),
          ],
        ),
      ),
    );
  }
}
