import 'package:cat_breeds/logic/breeds.dart';
import 'package:cat_breeds/logic/breeds_info.dart';
import 'package:cat_breeds/widgets/start_screen.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
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
  Widget makeTestableWidget() =>
      MaterialApp(home: Scaffold(body: Card(index: 1, breedsInfo: breed)));

  testWidgets('find test!', (tester) async {
    await mockNetworkImagesFor(() => tester.pumpWidget(makeTestableWidget()));

    final titleFinder = find.byType(Container);

    expect(titleFinder, findsOneWidget);
  });
}
