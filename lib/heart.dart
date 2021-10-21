import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'symbol_controller.dart';

class Heart extends StatefulWidget {
  const Heart({Key? key}) : super(key: key);

  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> {
  static const end = 0.25;
  static const start = 0.87;
  double previousValue = start;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: [
          Image.asset(
            'assets/images/background-right.png',
            height: constraints.maxHeight,
          ),
          ClipRect(
            child: Consumer<SymbolController>(
              builder: (context, controller, child) => AnimatedAlign(
                alignment: Alignment.topRight,
                heightFactor: calculateHeight(controller),
                duration: const Duration(seconds: 5),
                curve: Curves.easeInOutSine,
                child: Image.asset(
                  'assets/images/background-right-empty.png',
                  height: constraints.maxHeight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  double calculateHeight(SymbolController controller) {
    if (controller.isRolling) {
      return previousValue;
    }
    if (controller.value < 0) {
      return previousValue = start;
    }
    if (controller.value > 100) {
      return previousValue = end;
    }
    const scale = start - end;
    final percent = controller.value / 100;
    final scaled = (percent * scale) + 1 - start;
    return previousValue = 1 - scaled;
  }
}
