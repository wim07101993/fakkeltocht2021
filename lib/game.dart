import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'rolling_symbol.dart';
import 'symbol_controller.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode()..requestFocus(),
      onKey: (e) => onKey(context, e),
      child: GestureDetector(
        onTap: () => roll(context),
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Spacer(),
                        Center(
                          child: RollingNumber(controller: context.read()),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onKey(BuildContext context, RawKeyEvent value) {
    if (value is RawKeyUpEvent) {
      if (value.logicalKey == LogicalKeyboardKey.space ||
          value.logicalKey == LogicalKeyboardKey.enter) {
        roll(context);
      } else if (value.logicalKey == LogicalKeyboardKey.keyR) {
        context.read<SymbolController>().reset();
      }
    }
  }

  Future<void> roll(BuildContext context) async {
    final controller = context.read<SymbolController>();
    if (controller.isRolling) {
      return;
    }
    try {
      log('Rolling');
      controller.roll();
    } catch (e, stackTrace) {
      log('Error on roll', error: e, stackTrace: stackTrace);
    }
  }
}
