import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environmet {
  static String movieDbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'API key no proporcionada' ;
}