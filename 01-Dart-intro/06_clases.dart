void main() {
  final wolverine = Hero('Logan', 'Regeneration');

  print(wolverine);
  print(wolverine.name);
  print(wolverine.power);
}

class Hero {
  String name;
  String power;

  Hero(this.name, this.power);
  // Hero (String pName, String pPower)
  //   : name = pName,
  //     power = pPower;
}
