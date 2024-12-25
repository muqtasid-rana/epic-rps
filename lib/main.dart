import 'package:epic_rps/view_models/players_list.dart';
import 'package:epic_rps/views/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

late var mq;

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => PlayersList(), child: const MyApp()),
  ]));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: IntroScreen());
  }
}
