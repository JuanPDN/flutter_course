void main() {
  emitNumbers().listen((int value) {
    print('Stream value: $value');
  });
}

Stream<int> emitNumbers() async* {
  //async* devuelve un stream
  final valuesToEmit = [1, 2, 3, 4, 5];

  for (int i in valuesToEmit) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}
