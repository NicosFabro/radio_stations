import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio/now_playing/bloc/now_playing_bloc.dart';
import 'package:radio/radio/radio.dart';

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
    return BlocProvider(
      create: (context) => NowPlayingBloc(
        radioService: context.read<RadioService>(),
        nowPlaying: nowPlaying,
        index: index,
      ),
      //..add(GetRadioStationInfoRequested(radioId: nowPlaying.radioId)),
      child: const NowPlayingView(),
    );
  }
}

class NowPlayingView extends StatelessWidget {
  const NowPlayingView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final radioLogoSize = screenWidth * 0.4;

    return BlocBuilder<NowPlayingBloc, NowPlayingState>(
      bloc: context.read(),
      builder: (context, state) {
        final nowPlaying = state.nowPlaying;

        return Scaffold(
          appBar: AppBar(
            title: Text(nowPlaying.radioName),
          ),
          body: SafeArea(
            child: Center(
              child: Stack(
                children: [
                  RadioStationLogo(
                    id: state.nowPlayingIndex,
                    logo: RadioService.getLogoURL(
                      nowPlaying.radioLogo,
                    ),
                    width: radioLogoSize,
                    height: radioLogoSize,
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
