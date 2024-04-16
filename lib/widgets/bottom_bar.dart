import 'package:cat_breeds/constants/colors.dart';
import 'package:cat_breeds/logic/mob.dart';
import 'package:cat_breeds/widgets/favorite_screen.dart';
import 'package:cat_breeds/widgets/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class BottomNavigationBarExample extends StatelessWidget {
  const BottomNavigationBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Counter();

    return Scaffold(
      body: Observer(
        builder: (_) {
          return Center(
            child: [
              const StartScreen(),
              const FavoriteScreen(),
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
