import 'dart:convert';
import 'package:desafio_modulo9/arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> dados; //Map de String, dynamic
  var tipo;
  var cor;
  var melhorPreco;
  var corTag;

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/dados.json').then((jsonDados) {
      this.setState(() {
        dados = json.decode(jsonDados);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      appBar: AppBar(
        title: Text("Escolha uma Revenda"),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.import_export_sharp),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text('Melhor Avaliação'),
                  ),
                  PopupMenuItem(
                    child: Text('Mais rápido'),
                  ),
                  PopupMenuItem(
                    child: Text('Mais barato'),
                  ),
                ];
              }),
          PopupMenuButton(
              icon: Icon(Icons.help_outline),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text('Suporte'),
                  ),
                  PopupMenuItem(
                    child: Text('Termos de serviço'),
                  ),
                ];
              })
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Botijões de 13kg em:",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "Av. Paulista, 1001",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "Paulista, São Paulo, SP",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      //color: Colors.indigo,
                      child: Column(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.blue,
                      ),
                      Text("Mudar",
                          style: TextStyle(
                            color: Colors.blue,
                          )),
                    ],
                  ))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(18),
              color: Colors.grey[300],
              height: 500,
              child: ListView.builder(
                itemCount: dados?.length ?? 0,
                itemBuilder: (_, index) {
                  cor = int.parse('0xFF${dados[index]['cor']}');
                  tipo = dados[index]['tipo'];
                  melhorPreco = dados[index]['melhorPreco'];
                  if (melhorPreco == true) {
                    corTag = Colors.amber;
                  } else {
                    corTag = Colors.white;
                  }
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.of(context).pushNamed(
                          '/produto',
                          arguments: ScreenArguments(
                            dados[index]['tipo'],
                            dados[index]['nome'],
                            dados[index]['nota'],
                            dados[index]['tempoMedio'],
                            dados[index]['preco'],
                            dados[index]['cor'],
                          ),
                        );
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Row(children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(5)),
                              color: Color(cor),
                            ),
                            padding: EdgeInsets.all(10),
                            child: SizedBox(
                              height: 80,
                              child: RotatedBox(
                                  quarterTurns: -1,
                                  child: Text(
                                    dados[index]['tipo'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  )),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 20,
                                          top: 20,
                                        ),
                                        child: Text(
                                          dados[index]['nome'],
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                      Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: corTag,
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                                      left:
                                                          Radius.circular(5))),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.label_rounded,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                "Melhor Preço",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "Nota",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(5),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                dados[index]['nota'].toString(),
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "Tempo Médio",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(5),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                dados[index]['tempoMedio']
                                                    .toString(),
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "min",
                                                style: TextStyle(fontSize: 11),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "Preço",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(5),
                                          ),
                                          Text(
                                            dados[index]['preco'].toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ])),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
