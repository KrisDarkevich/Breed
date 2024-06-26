import 'package:cat_breeds/logic/breeds_info.dart';
import 'package:cat_breeds/widgets/start_screen.dart';
import 'package:flutter/material.dart' hide Card;

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({
    super.key,
    required this.breedsInfo,
  });
  final List<BreedsInfo> breedsInfo;

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.breedsInfo.length,
        itemBuilder: (_, int index) {
          if (widget.breedsInfo[index].isFavorite) {
            return Card(
              breedsInfo: widget.breedsInfo[index],
              index: index,
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
