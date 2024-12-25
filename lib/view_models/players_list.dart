import 'package:epic_rps/models/players.dart';
import 'package:epic_rps/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayersList with ChangeNotifier {
  final List<Player> _players = [
    Player(
      icon: 'lib/images/player1.png',
      name: 'Tony Newman',
      namecolor: ColorsApp.player1name,
      match: '15,220',
      rate: '98%',
      color: ColorsApp.player1,
      coin: 'lib/images/coin.png',
    ),
    Player(
      icon: 'lib/images/player3.png',
      name: 'Herman Weich',
      match: '15,220',
      rate: '98%',
      color: ColorsApp.player2,
      coin: 'lib/images/silvercoin.png',
    ),
    Player(
      icon: 'lib/images/player2blue.png',
      name: 'Dollie Mann',
      namecolor: ColorsApp.player3name,
      match: '15,220',
      rate: '98%',
      color: ColorsApp.player3,
      coin: 'lib/images/browncoin.png',
    ),
    Player(
      icon: 'lib/images/player2blue.png',
      name: 'Ian Burtan',
      match: '5,333',
      rate: '98%',
    ),
    Player(
      icon: 'lib/images/player1.png',
      name: 'Roxie Hansen',
      match: '5,333',
      rate: '98%',
    ),
    Player(
      icon: 'lib/images/player1.png',
      name: 'Steven Vadghn',
      match: '5,333',
      rate: '98%',
    ),
    Player(
      icon: 'lib/images/player2blue.png',
      name: 'Harriett Singletr..',
      match: '2,333',
      rate: '98%',
    ),
    Player(
      icon: 'lib/images/player1.png',
      name: 'Henry Padilla',
      match: '1,833',
      rate: '98%',
    ),
  ];

  List<Player> get players => _players;
}
