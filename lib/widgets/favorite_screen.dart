import 'package:cat_breeds/logic/api_list.dart';
import 'package:cat_breeds/widgets/start_screen.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final breedsInfo = Provider.of<ApiList>(context);
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: breedsInfo.list.length,
        itemBuilder: (_, int index) {
          if (breedsInfo.list[index].isFavorite) {
            return Card(
              breedsInfo: breedsInfo.list[index],
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
