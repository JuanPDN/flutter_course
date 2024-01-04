import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButton extends StatelessWidget {
  final VideoPost video;

  const VideoButton({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
            value: video.likes, iconData: Icons.favorite, iconColor: Colors.red),
      _CustomIconButton(value: video.views, iconData: Icons.remove_red_eye_outlined,)
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  const _CustomIconButton(
      {required this.value, required this.iconData, iconColor})
      : color = iconColor ?? Colors.white;

  final int value;
  final IconData iconData;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              iconData,
              color: color,
              size: 30,
            )),
        Text('$value')
      ],
    );
  }
}
