import 'package:cat_breeds/constants/colors.dart';
import 'package:cat_breeds/constants/icons.dart';
import 'package:cat_breeds/constants/text_style.dart';
import 'package:cat_breeds/logic/breeds.dart';
import 'package:cat_breeds/logic/breeds_info.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key, required this.breedsInfo, required this.index});

  final BreedsInfo breedsInfo;
  final int index;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  // final bool isLiked;
  @override
  Widget build(BuildContext context) {
    // const bool isLiked = false;
    final breed = widget.breedsInfo.list.first;
    // bool toggle = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BreedColors.appBarColor,
        shadowColor: BreedColors.lightGrey,
        title: Text(
          breed.name,
          style: const TextStyle(
            color: BreedColors.cardFirst,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: BreedIcon.arrowBack,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                widget.breedsInfo.isFavorite = !widget.breedsInfo.isFavorite;
              });
            },
            icon: widget.breedsInfo.isFavorite
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_outline),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: widget.index.toString(),
              child: Image(
                image: NetworkImage(widget.breedsInfo.url),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Column(
                children: [
                  RowText(
                    breed: breed,
                    first: 'Breed name:  ',
                    last: breed.name,
                  ),
                  RowText(
                    breed: breed,
                    first: 'Origin:  ',
                    last: breed.origin,
                  ),
                  RowText(
                    breed: breed,
                    first: 'Life span:  ',
                    last: '${breed.lifeSpan} years',
                  ),
                  RowText(
                    breed: breed,
                    first: 'Description:  ',
                    last: breed.description,
                  ),
                  RowText(
                    breed: breed,
                    first: 'Temperament:  ',
                    last: breed.temperament,
                  ),
                  RowText(
                    breed: breed,
                    first: 'Intellegence (1-5):  ',
                    last: breed.intelligence.toString(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RowText extends StatelessWidget {
  const RowText({
    super.key,
    required this.breed,
    required this.first,
    required this.last,
  });

  final Breeds breed;
  final String first;
  final String last;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: first,
                      style: BreedsText.mainCardFirst,
                    ),
                    TextSpan(
                      text: last,
                      style: BreedsText.mainCardLast,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 7,
        ),
      ],
    );
  }
}
