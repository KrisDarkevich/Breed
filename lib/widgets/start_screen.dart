import 'package:cat_breeds/logic/api_list.dart';
import 'package:cat_breeds/logic/breeds_info.dart';
import 'package:cat_breeds/constants/colors.dart';
import 'package:cat_breeds/constants/icons.dart';
import 'package:cat_breeds/constants/text_style.dart';
import 'package:cat_breeds/widgets/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final apiList = Provider.of<ApiList>(context);

    return Scaffold(
      body: FutureBuilder(
        future: apiList.getList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: apiList.list.length,
              itemBuilder: (_, int index) {
                return Card(
                  breedsInfo: apiList.list[index],
                  index: index,
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 5,
                color: BreedColors.cardFirst,
              ),
            );
          }
        },
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    super.key,
    required this.breedsInfo,
    required this.index,
  });

  final BreedsInfo breedsInfo;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InfoScreen(
              breedsInfo: breedsInfo,
              index: index,
            ),
          ),
        );
      },
      child: Container(
        height: 150,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: BreedColors.lightGrey,
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(5, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: _ImageIndicator(
                breedsInfo: breedsInfo,
                index: index,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    breedsInfo.list.first.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: BreedsText.mainScreenName,
                  ),
                  const Spacer(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Learn more',
                        style: BreedsText.mainScreenLearn,
                      ),
                      SizedBox(width: 10),
                      BreedIcon.arrowNext,
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ImageIndicator extends StatelessWidget {
  const _ImageIndicator({required this.breedsInfo, required this.index});
  final BreedsInfo breedsInfo;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: index.toString(),
      child: Image.network(
        breedsInfo.url,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return const Padding(
            padding:
                EdgeInsets.only(left: 30.0, right: 9.0, top: 9.0, bottom: 9.0),
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 5,
                color: BreedColors.cardFirst,
              ),
            ),
          );
        },
      ),
    );
  }
}
