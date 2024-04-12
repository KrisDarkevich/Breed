import 'package:cat_breeds/constants/colors.dart';
import 'package:cat_breeds/logic/api_call.dart';
// import 'package:cat_breeds/logic/api_list.dart';
import 'package:cat_breeds/logic/mob.dart';
import 'package:cat_breeds/widgets/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarExample extends StatelessWidget {
  const BottomNavigationBarExample({
    super.key,
    // required this.apiClient,
  });
  // final ApiClient apiClient;

  @override
  Widget build(BuildContext context) {
    final counter = Counter();

    return Scaffold(
      body: Observer(
        builder: (_) {
          return Center(
            child: [
              const StartScreen(
                  // apiClient: apiClient,
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
