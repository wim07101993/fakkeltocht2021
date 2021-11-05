import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';

import 'home_screen.dart';
import 'symbol_controller.dart';

final random = Random();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      setWindowTitle('Slot-machine');
      setWindowMinSize(const Size(800, 600));
    }
  } catch (_) {}
  runApp(MaterialApp(
    title: 'Fakkeltocht',
    debugShowCheckedModeBanner: false,
    home: ChangeNotifierProvider(
      create: (_) => SymbolController(random: random),
      child: const HomeScreen(),
    ),
  ));
}
