import 'package:flutter/material.dart';
import 'package:youtube_project/CustomSearchDelegate.dart';
import 'package:youtube_project/biblioteca.dart';
import 'package:youtube_project/em_altas.dart';
import 'package:youtube_project/inicio.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String resultado = " ";

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(resultado),
      em_alta(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: Image.asset("images/youtube.png",
          width: 120,
          height: 200,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              String? res = await showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );

              if (res != null && res.isNotEmpty) {
                setState(() {
                  resultado = res;
                });
              }
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
            if (indice == 0) {
              resultado = "";
            }
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            label: 'Início',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Em alta',
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            label: 'Biblioteca',
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
