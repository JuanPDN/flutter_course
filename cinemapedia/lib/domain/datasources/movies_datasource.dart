import 'package:cinemapedia/domain/entities/movies.dart';

abstract class MovieDatasource {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
