import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List list = [
    {
      'icon': 'lib/images/player1.png',
      'name': 'Tony Newman',
      'namecolor': const Color(0xffFCBD11),
      'match': '15,220',
      'rate': '98%',
      'color': const Color(0xffFBD43A).withOpacity(0.44),
      'coin': 'lib/images/coin.png',
    },
    {
      'icon': 'lib/images/player3.png',
      'name': 'Herman Weich',
      'match': '15,220',
      'rate': '98%',
      'color': const Color(0xffF4F5F9),
      'coin': 'lib/images/silvercoin.png',
    },
    {
      'icon': 'lib/images/player2blue.png',
      'name': 'Dollie Mann',
      'namecolor': const Color(0xffD0A18F),
      'match': '15,220',
      'rate': '98%',
      'color': const Color(0xffF5EEE5),
      'coin': 'lib/images/browncoin.png',
    },
    {
      'icon': 'lib/images/player2blue.png',
      'name': 'Ian Burtan',
      'match': '5,333',
      'rate': '98%',
    },
    {
      'icon': 'lib/images/player1.png',
      'name': 'Roxie Hansen',
      'match': '5,333',
      'rate': '98%',
    },
    {
      'icon': 'lib/images/player1.png',
      'name': 'Steven Vadghn',
      'match': '5,333',
      'rate': '98%',
    },
    {
      'icon': 'lib/images/player2blue.png',
      'name': 'Harriett Singletr..',
      'match': '2,333',
      'rate': '98%',
    },
    {
      'icon': 'lib/images/player1.png',
      'name': 'Henry Padilla',
      'match': '1,833',
      'rate': '98%',
    },
  ];

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade100,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('lib/images/play.png', width: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('lib/images/menu.png', width: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('lib/images/home.png', width: 30),
            label: '',
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20.0, top: 80, right: 8, bottom: 8),
            child: Row(
              children: [
                const Image(
                    image: AssetImage('lib/images/player1.png'), width: 50),
                const SizedBox(width: 10),
                const Text(
                  'Player 1',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff4A6495),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                _buildBadge(
                    'Beginner', Colors.purple, 'lib/images/diamond.png'),
                const SizedBox(width: 10),
                _buildBadge('40', Colors.orange, 'lib/images/coin.png'),
                const SizedBox(width: 10),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
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
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 60),
                          _buildHeader(),
                          Expanded(
                            child: ListView.builder(
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                final player = list[index];
                                return _buildPlayerCard(player, index);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topCenter,
                  child: Image(
                    image: AssetImage('lib/images/main.png'),
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
              color: const Color(0xff4A6495).withOpacity(0.5),
            ),
          ),
          Row(
            children: [
              Text(
                'Match',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff4A6495).withOpacity(0.5),
                ),
              ),
              const SizedBox(width: 30),
              Text(
                'Rate',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff4A6495).withOpacity(0.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerCard(Map player, int index) {
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
                color: player['color'] ?? Colors.white,
              ),
              child: Row(
                children: [
                  Image(image: AssetImage(player['icon'])),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      player['name'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: player['namecolor'] ?? const Color(0xffACB4C3),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 30),
                  Text(
                    player['match'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff5C5C5C),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Text(
                    player['rate'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff5C5C5C),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 35,
          left: 425,
          child: Align(
            alignment: Alignment.centerRight,
            child: player['coin'] != null && player['coin'].isNotEmpty
                ? Image.asset(
                    player['coin'] ?? '',
                    width: 23,
                    fit: BoxFit.contain,
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}
