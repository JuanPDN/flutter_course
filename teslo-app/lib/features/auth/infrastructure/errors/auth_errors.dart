class ConectionTimeout implements Exception {}
class WrongCredentials implements Exception {}
class InvalidToken implements Exception {}
class CustomError implements Exception {
  final String message;
  // final int errorCode;

  CustomError(this.message,);
}
