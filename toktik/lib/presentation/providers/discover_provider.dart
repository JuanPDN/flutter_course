import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoadin = true;
  List<VideoPost> videos = [];


  Future<void> loadNextPage() async{



    notifyListeners();
  }
}
