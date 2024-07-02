import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube_project/Video.dart';


const CHAVE_YOUTUBE_API = "AIzaSyCq_1rtaH3Fnprg4RqtABbGl3RzO0bf4NQ";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";

class Api {

  Future<List<Video>> pesquisar(String pesquisa) async {
    var url = 'https://www.googleapis.com/youtube/v3/search?part=snippet&type=video&maxResults=20&order=date&key=$CHAVE_YOUTUBE_API&channeltitle=$ID_CANAL&q=$pesquisa';

    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson["items"].map<Video>(
        (map) {
          return Video.fromJson(map);
        }
      ).toList();
      return videos;
    } else {
      throw Exception("Erro ao carregar vídeos");
    }
  }
}
  



