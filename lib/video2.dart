import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class videoplayer extends StatelessWidget {
  final String video;
  videoplayer({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    final videoURL = video;
    late YoutubePlayerController _controller;

    final videoID = YoutubePlayer.convertUrlToId(videoURL);

    return Container(
      padding: EdgeInsets.all(30),
      child: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: videoID!,
          flags: YoutubePlayerFlags(
              autoPlay: false,
              hideControls: false,
              mute: true,
              showLiveFullscreenButton: true),
        ),
        showVideoProgressIndicator: true,
      ),
    );
  }
}
