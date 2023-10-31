void main() {
  print(greetEveryone());
  print('Suma : ${addTwoNumbers(10, 20)}');
  print(greetPerson(name: 'Juan'));
}

String greetEveryone() => 'Hello everyone!';

int addTwoNumbers(int a, int b) => a + b;
int addTwoNumbersOptional(int a, [int? b]) {
  b ??= 0; // ?? = if null
  return a + b;
}

String greetPerson({ required String name, String message = 'Hola, '}) {
  return '$message $name';
}
