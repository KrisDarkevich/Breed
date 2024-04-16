import 'package:cat_breeds/logic/mob.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter Store Test', () {
    late Counter counter;

    setUp(() {
      counter = Counter();
    });

    test('Initial Counter Value Test', () {
      expect(counter.selectedIndex, 0);
    });

    test('Counter Increment Test', () {
      counter.onItemTapped(1);
      expect(counter.selectedIndex, 1);
    });
  });
}
