import 'package:cat_breeds/constants/colors.dart';
import 'package:cat_breeds/logic/breeds_info.dart';
import 'package:cat_breeds/widgets/favorite_screen.dart';
import 'package:cat_breeds/widgets/mob.dart';
import 'package:cat_breeds/widgets/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

final counter = Counter();

class BottomNavigationBarExample extends StatelessWidget {
  const BottomNavigationBarExample({
    super.key,
    required this.breedsInfo,
  });
  final List<BreedsInfo> breedsInfo;

  // int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          return Center(
            child: [
              StartScreen(
                breedsInfo: breedsInfo,
              ),
              // FavoriteScreen(
              //   breedsInfo: breedsInfo,
              // ),
            ].elementAt(counter.selectedIndex),
          );
        },
      ),
      bottomNavigationBar: Observer(
        builder: (_) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
            ],
            currentIndex: counter.selectedIndex,
            selectedItemColor: BreedColors.cardFirst,
            onTap: counter.onItemTapped,
          );
        },
      ),
    );
  }
}
