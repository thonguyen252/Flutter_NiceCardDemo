import 'package:flutter/material.dart';

import './views/home_screen.dart';

main() => runApp(NiceCardApp());

class NiceCardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("NiceCard Demo"),
        ),
        body: HomeScreen(),
      ),
    );
  }
}
