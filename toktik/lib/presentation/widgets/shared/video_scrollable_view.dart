import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  const VideoScrollableView({required this.videos, super.key});

  final List<VideoPost> videos;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPosts = videos[index];

        return Stack(
          children: [
            Positioned(
                bottom: 40, 
                right: 20,
                child: VideoButton(video: videoPosts)
                )],
        );
      },
    );
  }
}
