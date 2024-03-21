import 'package:cat_breeds/logic/breeds_info.dart';
import 'package:cat_breeds/widgets/bottom_bar.dart';
// import 'package:cat_breeds/widgets/start_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.breedsInfo});

  final List<BreedsInfo> breedsInfo;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarExample(breedsInfo: breedsInfo),
    );
  }
}
