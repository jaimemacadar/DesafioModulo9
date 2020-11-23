import 'package:desafio_modulo9/arguments.dart';
import 'package:flutter/material.dart';

class Produto extends StatefulWidget {
  Produto({Key key}) : super(key: key);

  @override
  _ProdutoState createState() => _ProdutoState();
}

class _ProdutoState extends State<Produto> {
  List<dynamic> dados; //Map de String, dynamic
  var contar = 1;  

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    var totalPedido = contar*args.preco;

    return Scaffold(
      appBar: AppBar(
        title: Text("Selecionar produtos"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[300],
                        ),
                        padding: EdgeInsets.all(6),
                        child: Icon(
                          Icons.brightness_1,
                          color: Colors.blue,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2),
                      ),
                      Text(
                        "Comprar",
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    child: Align(
                      alignment: Alignment(0, -0.5),
                      child: Divider(
                        height: 10,
                        color: Colors.grey[200],
                        thickness: 2,
                        indent: 5,
                        endIndent: 5,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          //color: Colors.grey[300],
                        ),
                        padding: EdgeInsets.all(6),
                        child: Icon(
                          Icons.brightness_1_outlined,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2),
                      ),
                      Text(
                        "Pagamento",
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    child: Align(
                      alignment: Alignment(0, -0.5),
                      child: Divider(
                        height: 10,
                        color: Colors.grey[200],
                        thickness: 2,
                        indent: 5,
                        endIndent: 5,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          //color: Colors.grey[300],
                        ),
                        padding: EdgeInsets.all(6),
                        child: Icon(
                          Icons.brightness_1_outlined,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2),
                      ),
                      Text(
                        "Confirmação",
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Divider(
                    height: 20,
                    color: Colors.grey[200],
                    thickness: 2,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.all(6),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black,
                        ),
                        child: Center(
                          child: Text(
                            "1",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                        height: 50,
                      ),
                      Text(args.nome + " - Botijão de 13kg"),
                      Container(
                        //alignment: Alignment(1, 1),
                        child: Row(
                          children: [
                            Text("R\$"),
                            Text(
                              totalPedido.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                //color: Colors.red,
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Container(
                      //height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.home,
                                    color: Colors.grey,
                                    size: 30,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      args.nome,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              args.nota.toString(),
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 10,
                                              color: Colors.amber,
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          args.tempoMedio + 'min',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: Color(int.parse('0xFF${args.cor}')),
                                    padding: EdgeInsets.all(3),
                                    child: Text(
                                      args.tipo,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                          Container(
                            //width: 100,
                            height: 20,
                            child: Align(
                              alignment: Alignment(0, -0.5),
                              child: Divider(
                                height: 10,
                                color: Colors.grey[200],
                                thickness: 1,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Botijão de 13kg",
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                  Text(
                                    args.nome,
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "R\$",
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                      Text(
                                        args.preco.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 70,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        contar--;
                                      });
                                      //print(contar);
                                    },
                                    icon: Icon(
                                      Icons.remove_circle_sharp,
                                      color: Colors.grey,
                                      size: 30,
                                    ),
                                  ),
                                  Stack(children: [
                                    Image.asset(
                                      'assets/botijao.png',
                                      scale: 12,
                                      color: Colors.amber,
                                    ),
                                    Container(
                                        margin: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                            color: Colors.amber[800],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        padding: EdgeInsets.all(3),
                                        child: 
                                        Text(contar.toString(),
                                          style: TextStyle(fontSize: 11),
                                        )),
                                  ]),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        contar++;  
                                      });                                      
                                      print(contar);
                                    },
                                    icon: Icon(
                                      Icons.add_circle_sharp,
                                      color: Colors.grey,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
