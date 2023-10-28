void main(){

    final String pokemon = 'ditto';
    final int hp = 100;
    final bool isAlive = true;
    final List<String> abilities = ['impostor'];
    final sprites = <String>['ditto/front.pn'];

    //  dynamic == null

    dynamic erroMessage = 'Hola';
    erroMessage = true;
    erroMessage = [1,2,3,4,5,6];
    erroMessage = { 1,2,3,4,5,6};
    erroMessage = () => true;
    erroMessage = null;

  print("""
  $pokemon
  $hp
  $isAlive
  $abilities
  $sprites
  $erroMessage
  """);

}