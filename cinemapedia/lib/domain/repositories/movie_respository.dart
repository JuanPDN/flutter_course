import 'package:cinemapedia/domain/entities/movies.dart';

abstract class MovieRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
