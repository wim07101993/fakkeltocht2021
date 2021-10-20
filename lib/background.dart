import 'package:flutter/material.dart';

import 'heart.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset(
        'assets/images/background-left.png',
        fit: BoxFit.fitHeight,
      ),
      const Spacer(),
      Heart(),
    ]);
  }
}
