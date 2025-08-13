import 'package:get/get.dart';
import '../models/player.dart';

class FootballController extends GetxController {
  var players = <Player>[
    Player(
      name: "Enrico Octaviano",
      position: "Drummer",
      number: 9,
      image: "assets/enrico.png",
    ),
    Player(
      name: "Daniel Baskara Putra",
      position: "Vocalist",
      number: 8,
      image: "assets/baskaraputra.png",
    ),
    Player(
      name: "Rayhan Noor",
      position: "Rythm Guitarist",
      number: 5,
      image: "assets/rayhannoor.png",
    ),
    Player(
      name: "Adnan Denan",
      position: "Lead Guitarist",
      number: 8,
      image: "assets/adnan.png",
    ),
    Player(
      name: "Tristan Juliano",
      position: "Pianist",
      number: 5,
      image: "assets/tristanjuliano.png",
    ),
  ].obs;

  void updatePlayer(
    int index,
    String name,
    String position,
    int number,
    String image,
  ) {
    players[index].name = name;
    players[index].position = position;
    players[index].number = number;
    players[index].image = image;
    players.refresh(); 
  }
}
