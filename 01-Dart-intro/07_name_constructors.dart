void main() {
  final ironman = Hero(name: 'Tony Satark', power: 'Money', isAlive: false);
  final Map<String, dynamic> rawJson = {
    'name': 'Tony Stark',
    'power': 'Money',
    'isAlive': true
  };
  final ironman2 = Hero.fromJson(rawJson);

  print(ironman);
  print(ironman2);
}

class Hero {
  String name;
  String power;
  bool isAlive;

  Hero({required this.name, required this.power, required this.isAlive});
  Hero.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? 'No name found',
        power = json['power'] ?? 'No power found',
        isAlive = json['isAlive'] ?? 'No isAlive found';

  @override
  String toString() {
    return '$name, $power, is Alive: ${isAlive ? 'YES!!' : 'NOPE'}';
  }
}
