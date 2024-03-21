import 'package:cat_breeds/logic/breeds_info.dart';
import 'package:cat_breeds/widgets/start_screen.dart';
import 'package:flutter/material.dart' hide Card;

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({
    super.key,
    required this.breedsInfo,
    // required this.index,
  });
  final List<BreedsInfo> breedsInfo;
  // final int index;

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
            return SizedBox();
          }
        },
      ),
      // Center(
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         height: 100,
      //       ),
      //       Text('kjk'),
      //     ],
      //   ),
      // ),
    );
  }
}
