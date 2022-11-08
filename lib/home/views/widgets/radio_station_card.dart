import 'package:flutter/material.dart';
import 'package:radio/now_playing/now_playing.dart';
import 'package:radio/radio/radio.dart';

class RadioStationCard extends StatelessWidget {
  const RadioStationCard({
    super.key,
    required this.index,
    required this.nowPlaying,
  });

  final int index;
  final NowPlaying nowPlaying;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<NowPlayingPage>(
          builder: (context) => NowPlayingPage(
            nowPlaying: nowPlaying,
            index: index,
          ),
        ),
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: RadioStationLogo(
          id: index,
          logo: RadioService.getLogoURL(
            nowPlaying.radioLogo,
          ),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
