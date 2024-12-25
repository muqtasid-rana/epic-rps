import 'package:epic_rps/main.dart';
import 'package:epic_rps/models/players.dart';
import 'package:epic_rps/utils/colors.dart';
import 'package:epic_rps/view_models/players_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade100,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/play.png', width: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/menu.png', width: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/home.png', width: 30),
            label: '',
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade100,
      body: Consumer<PlayersList>(builder: (context, value, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, top: 80, right: 8, bottom: 8),
              child: Row(
                children: [
                  const Image(
                      image: AssetImage('assets/player1.png'), width: 50),
                  const SizedBox(width: 10),
                  Text(
                    'Player 1',
                    style: TextStyle(
                      fontSize: 20,
                      color: ColorsApp.headertext2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _buildBadge('Beginner', Colors.purple, 'assets/diamond.png'),
                  const SizedBox(width: 10),
                  _buildBadge('40', Colors.orange, 'assets/coin.png'),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40.0, bottom: 80),
                    child: Container(
                      height: mq.height,
                      width: mq.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Column(
                        children: [
                          _buildHeader(),
                          Expanded(
                            child: ListView.builder(
                              itemCount: value.players.length,
                              itemBuilder: (context, index) {
                                final player = value.players[index];
                                return _buildPlayerCard(player, index);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                      image: AssetImage('assets/main.png'),
                      width: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildBadge(String text, Color color, String iconPath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Text(
              '$text  ',
              style: TextStyle(
                  color: color, fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Image(image: AssetImage(iconPath)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Players',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: ColorsApp.headertext,
            ),
          ),
          Row(
            children: [
              Text(
                'Match',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: ColorsApp.headertext,
                ),
              ),
              const SizedBox(width: 30),
              Text(
                'Rate',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: ColorsApp.headertext,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerCard(Player player, int index) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
          child: Material(
            elevation: 1,
            borderRadius: BorderRadius.circular(25),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: player.color ?? Colors.white,
              ),
              child: Row(
                children: [
                  Image(image: AssetImage(player.icon)),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      player.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: player.namecolor ?? ColorsApp.maintext,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 30),
                  Text(
                    player.match,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ColorsApp.defaulttext),
                  ),
                  const SizedBox(width: 30),
                  Text(
                    player.rate,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: ColorsApp.defaulttext),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
