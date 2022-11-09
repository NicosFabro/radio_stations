import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio/now_playing/bloc/now_playing_bloc.dart';
import 'package:radio/player/player.dart';
import 'package:radio/radio/radio.dart';
import 'package:radio/radio_ui/radio_ui.dart';
import 'package:rive/rive.dart';

class NowPlayingPage extends StatelessWidget {
  const NowPlayingPage({
    super.key,
    required this.nowPlaying,
    required this.index,
  });

  final NowPlaying nowPlaying;
  final int index;

  @override
  Widget build(BuildContext context) {
    context
        .read<PlayerBloc>()
        .add(StreamRadioStationRequested(streamURL: nowPlaying.radioStream));
    return NowPlayingView(
      nowPlaying: nowPlaying,
      nowPlayingIndex: index,
    );
  }
}

class NowPlayingView extends StatelessWidget {
  const NowPlayingView({
    super.key,
    required this.nowPlaying,
    required this.nowPlayingIndex,
  });

  final NowPlaying nowPlaying;
  final int nowPlayingIndex;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(nowPlaying.radioName),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {},
            icon: const Icon(Icons.play_arrow),
            label: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nowPlaying.titleSong,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  nowPlaying.artistSong,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: RadioTextStyles.button.copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
          body: Center(
            child: Column(
              children: [
                RadioStationLogo(
                  id: nowPlayingIndex,
                  logo: RadioService.getLogoURL(
                    nowPlaying.radioLogo,
                  ),
                  width: screenWidth,
                  height: screenWidth * 0.5,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: screenWidth,
                  height: screenWidth,
                  child: RiveAnimation.asset(
                    'assets/animations/audio-visualizer.riv',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
