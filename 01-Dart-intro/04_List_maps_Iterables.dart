void main() {
  final numbers = [1, 2, 3, 4, 5, 5, 5, 6, 7, 8, 9, 9, 10];

  print('List original $numbers');
  print('List original ${numbers.length}');
  print('Index 0: ${numbers[0]}');
  print('First : ${numbers.first}');
  print('Reversed : ${numbers.reversed}');

  final reversedNumber = numbers.reversed;
  print('Iterable : $reversedNumber');
  print('List: ${reversedNumber.toList()}');
  print('Set: ${reversedNumber.toSet()}');

  final numbersGreaterThan5 = numbers.where((num) {
    return num > 5;
  });
  print('> 5  iterable: $numbersGreaterThan5');
  print('> 5  Set: ${numbersGreaterThan5.toSet()}');
}
