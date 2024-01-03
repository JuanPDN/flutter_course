import 'package:toktik/domain/entities/video_post.dart';

class LocalVideoModel {
  LocalVideoModel(
      {required this.name,
      required this.videoUrl,
      this.likes = 0,
      this.views = 0});

  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  factory LocalVideoModel.fromJson(Map<String, dynamic> json) =>
      LocalVideoModel(
          name: json['name'] ?? 'No name video',
          videoUrl: json['videoUrl'],
          likes: json['likes'] ?? 0,
          views: json['views'] ?? 0);

  VideoPost toVideoPostEntity() =>
      VideoPost(caption: name, videoUrl: videoUrl, likes: likes, views: views);
}
