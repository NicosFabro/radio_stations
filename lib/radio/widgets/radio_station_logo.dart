import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RadioStationLogo extends StatelessWidget {
  const RadioStationLogo({
    super.key,
    required this.id,
    required this.logo,
    required this.width,
    required this.height,
    required this.fit,
  });

  final int id;
  final String logo;
  final double width;
  final double height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Hero(
        tag: '$id-$logo',
        child: CachedNetworkImage(
          imageUrl: logo,
          fit: fit,
        ),
      ),
    );
  }
}
