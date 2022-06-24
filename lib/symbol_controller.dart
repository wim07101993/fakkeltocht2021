import 'dart:math';

import 'package:flutter/foundation.dart';

class SymbolController extends ValueNotifier<int> {
  /// Creates a new controller which controls a [Number].
  ///
  /// [minValue] is the minimum generated value.
  ///
  /// [maxValue] is the maximum generated value.
  ///
  /// [minRollDuration] is the minimum duration the number should roll.
  ///
  /// [maxRollDuration] is the maximum duration the number should roll.
  ///
  /// [rollSpeed] is the speed at which the number should change in numbers per
  /// millisecond.
  SymbolController({
    required this.random,
    this.minRollDuration = const Duration(seconds: 1),
    this.maxRollDuration = const Duration(seconds: 5),
    this.rollSpeed = 1,
  })  : _valueIndex = 0,
        _isRolling = false,
        super(_values[0]);

  final Random random;
  final Duration minRollDuration;
  final Duration maxRollDuration;
  final double rollSpeed;

  static const maxValue = 100;

  int _valueIndex;
  bool _isRolling;

  static const List<int> _values = [-1, 16, 21, 37, 42, 52, 68, 73, 89, 101];

  bool get isRolling => _isRolling;

  Future<int> roll() async {
    _valueIndex++;
    if (_valueIndex >= _values.length) {
      return value;
    }
    _isRolling = true;
    final start = DateTime.now();
    final rollDuration = _getRandomRollDuration();
    final interval = (1 / rollSpeed).round();
    // ignore: literal_only_boolean_expressions
    while (true) {
      value = random.nextInt(maxValue + 1);

      if (DateTime.now().difference(start).inMicroseconds > rollDuration) {
        _isRolling = false;
        return value = _values[_valueIndex];
      }

      await Future.delayed(Duration(milliseconds: interval));
    }
  }

  int _getRandomRollDuration() {
    final randomValue = random.nextInt(
      maxRollDuration.inMicroseconds - minRollDuration.inMicroseconds,
    );
    return randomValue + minRollDuration.inMicroseconds;
  }

  void reset() {
    _valueIndex = 0;
    value = _values[_valueIndex];
  }
}
