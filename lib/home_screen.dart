import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'background.dart';
import 'game.dart';
import 'main.dart';
import 'symbol_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SymbolController controller = SymbolController(random: random);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: const [
          Background(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: EdgeInsets.all(32),
              child: Game(),
            ),
          )
        ],
      ),
    );
  }
}
