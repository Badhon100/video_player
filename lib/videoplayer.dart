import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class VideoPlayer extends StatefulWidget {
  final String name, mediaUrl;
  const VideoPlayer({required this.name, required this.mediaUrl, Key? key}) : super(key: key);
  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late BetterPlayerController _betterPlayerController;
  final GlobalKey _betterPlayerKey = GlobalKey();

  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        const BetterPlayerConfiguration(aspectRatio: 16 / 9, fit: BoxFit.contain);

    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network, widget.mediaUrl);
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
    _betterPlayerController.setBetterPlayerGlobalKey(_betterPlayerKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 8,),
          Expanded(
            child: AspectRatio(
              aspectRatio: 16/9,
              child: BetterPlayer(key: _betterPlayerKey, controller: _betterPlayerController,),
            )
          )
        ],
      ),
    );
  }
}
