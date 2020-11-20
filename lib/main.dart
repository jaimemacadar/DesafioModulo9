import 'package:desafio_modulo9/produto.dart';
import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
    routes: {
      '/home': (_)=> Home(),
      '/produto': (_) => Produto(),
      },
  ));
}