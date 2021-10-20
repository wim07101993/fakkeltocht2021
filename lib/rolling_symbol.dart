import 'package:flutter/material.dart';

import 'symbol_controller.dart';

class RollingNumber extends StatefulWidget {
  const RollingNumber({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SymbolController controller;

  @override
  _RollingNumberState createState() => _RollingNumberState();
}

class _RollingNumberState extends State<RollingNumber> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(onValueChanged);
  }

  @override
  void didUpdateWidget(covariant RollingNumber oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller.removeListener(onValueChanged);
      widget.controller.addListener(onValueChanged);
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(onValueChanged);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.controller.value < 0) {
      return const SizedBox();
    }
    return Text(
      widget.controller.value.toString(),
      style: const TextStyle(
        color: Color(0xFFBD1A1A),
        fontSize: 400,
        fontFamily: 'Breathe',
      ),
    );
  }

  void onValueChanged() {
    setState(() {});
  }
}
