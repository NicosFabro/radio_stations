import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio/home/bloc/home_bloc.dart';
import 'package:radio/home/views/widgets/radio_station_card.dart';
import 'package:radio/radio/radio.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        radioService: context.read<RadioService>(),
      )..add(const GetNowPlayingRadioStationsRequested()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.nowPlayingRadioStations.isEmpty) {
              if (state.status == HomeStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.status != HomeStatus.success) {
                return const Center(
                  child: Text("There's a problem fetching the radio stations."),
                );
              } else {
                return const Center(
                  child: Text("There's no radio stations at the moment."),
                );
              }
            }

            return CustomScrollView(
              controller: scrollController,
              slivers: [
                const SliverAppBar(
                  centerTitle: true,
                  title: Text('Radio Stations'),
                ),
                LiveSliverGrid(
                  controller: scrollController,
                  itemCount: state.nowPlayingRadioStations.length,
                  showItemInterval: const Duration(milliseconds: 100),
                  showItemDuration: const Duration(milliseconds: 200),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemBuilder: (_, index, animation) => buildRadioStationCard(
                    animation: animation,
                    index: index,
                    nowPlaying: state.nowPlayingRadioStations[index],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildRadioStationCard({
    required Animation<double> animation,
    required int index,
    required NowPlaying nowPlaying,
  }) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.1),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
        child: RadioStationCard(
          index: index,
          nowPlaying: nowPlaying,
        ),
      ),
    );
  }
}
