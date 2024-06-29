import 'package:flutter/material.dart';
import 'package:youtube_project/Api.dart';
import 'package:youtube_project/Video.dart';


class Inicio extends StatefulWidget {

  final String pesquisa; 
  Inicio( this.pesquisa );

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  Future<List<Video>> _listarVideos(String pesquisa) {
    Api api = Api();
    return api.pesquisar("pesquisa");
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Video>>(

      
      future: _listarVideos("pesquisa"),

      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              List<Video> videos = snapshot.data ?? [];
              return ListView.separated(
                itemBuilder: (context, index) {
                  Video video = videos[index]; // Linha 50
                  return  Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(video.imagem.toString()),
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(video.titulo.toString()),
                        subtitle: Text(video.canal.toString()),
                      ),
                    ]
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  height: 3,
                  color: Colors.red,
                ),
                itemCount: videos.length, 
              );
            } else {
              return Center(
                child: Text("Nenhum dado a ser exibido!"), 
              );
            }
        }
      },
    );
  }
}