import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:radio/radio/radio.dart';

class RadioStationCard extends StatelessWidget {
  const RadioStationCard({
    super.key,
    required this.radioStation,
  });

  final RadioStation radioStation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: RadioService.getLogoURL(radioStation.logo),
            ),
            Text(radioStation.name),
          ],
        ),
      ),
    );
  }
}
