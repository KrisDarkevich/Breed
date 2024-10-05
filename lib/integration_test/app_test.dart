import 'package:cat_breeds/logic/breeds.dart';
import 'package:cat_breeds/logic/breeds_info.dart';
import 'package:cat_breeds/widgets/start_screen.dart';
// import 'package:flutter/material.dart' hide Card;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  group(
    'blah',
    () {
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();

      final breed = BreedsInfo(list: [
        Breeds(
            id: '1',
            name: 'efe',
            temperament: 'eff',
            origin: 'fe',
            description: 'efe',
            lifeSpan: 'ded',
            intelligence: 2,
            wikipedia: 'vvvs')
      ], url: '');
      // Widget makeTestableWidget() =>
      //     MaterialApp(home: Scaffold(body: Card(index: 1, breedsInfo: breed)));
      testWidgets(
        'help',
        (tester) async {
          await tester.pumpWidget(
            Card(
              index: 1,
              breedsInfo: breed,
            ),
          );
        },
      );
      expect(find.text('1'), findsOneWidget);
    },
  );
}
