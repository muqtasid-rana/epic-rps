import 'package:epic_rps/view_models/players_list.dart';
import 'package:epic_rps/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F7FB),
      body: Consumer<PlayersList>(
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/images/maingame.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xffF5F7FB),
                    image: DecorationImage(
                      image: AssetImage('assets/button.png'),
                      fit: BoxFit.fill, // Try BoxFit.fill for full coverage
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Loading 65%', // Button text
                      style: TextStyle(
                        color: Color(0xffB67C62), // Set text color
                        fontSize: 18, // Set font size
                        fontWeight: FontWeight.bold, // Set font weight
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
