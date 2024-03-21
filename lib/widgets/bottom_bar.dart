import 'package:cat_breeds/constants/colors.dart';
import 'package:cat_breeds/logic/breeds_info.dart';
import 'package:cat_breeds/widgets/favorite_screen.dart';
import 'package:cat_breeds/widgets/start_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({
    super.key,
    required this.breedsInfo,
    // required this.breedInfo,
  });
  final List<BreedsInfo> breedsInfo;
  // final BreedsInfo breedInfo;

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: [
          StartScreen(
            breedsInfo: widget.breedsInfo,
          ),
          FavoriteScreen(
            breedsInfo: widget.breedsInfo,
            // index: widget.index,
          ),
        ].elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectedIndex,
        selectedItemColor: BreedColors.cardFirst,
        onTap: _onItemTapped,
      ),
    );
  }
}
