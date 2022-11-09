import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        .add(StreamRadioStationRequested(nowPlaying: nowPlaying));
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
    final animationSize = screenWidth * 0.7;

    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.nowPlaying.radioName),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: const PlayerFAB(),
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
                  width: animationSize,
                  height: animationSize,
                  child: const RiveAnimation.asset(
                    'assets/animations/audio-visualizer.riv',
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  'Now playing:',
                  style: RadioTextStyles.headline5,
                  textAlign: TextAlign.center,
                ),
                Text(
                  '${nowPlaying.titleSong} - ${nowPlaying.artistSong}',
                  maxLines: 2,
                  style: RadioTextStyles.headline6,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
