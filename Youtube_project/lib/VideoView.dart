import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';

class Play extends StatefulWidget {
  final String video_id;
  Play({required this.video_id, Key? key}) : super(key: key);

  @override
  State<Play> createState() => _PlayState();
}

class _PlayState extends State<Play> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.video_id,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 54, 54, 54),
        child: Center(
          child: YoutubePlayer(
            controller: _controller,
          ),
        ),
      ),
    );
  }
}
