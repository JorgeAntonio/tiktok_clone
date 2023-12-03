import 'package:flutter/material.dart';
import 'package:tik_tok_clone/domain/entities/video_post.dart';
import 'package:tik_tok_clone/presentation/widgets/shared/video_buttons.dart';
import 'package:tik_tok_clone/presentation/widgets/video/full_screen_player.dart';

class VideScrollableView extends StatelessWidget {
  final List<VideoPost> videos;
  const VideScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final VideoPost videoPost = videos[index];

          return Stack(
            children: [
              FullScreenPlayer(
                videoUrl: videoPost.videoUrl,
                caption: videoPost.caption,
              ),
              Positioned(
                bottom: 40,
                right: 16,
                child: VideoButtons(video: videoPost),
              ),
            ],
          );
        });
  }
}
