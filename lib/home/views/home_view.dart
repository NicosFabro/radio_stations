import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio/home/bloc/home_bloc.dart';
import 'package:radio/radio/radio.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        radioService: context.read<RadioService>(),
      )..add(const HomeRadioStationsRequested()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeBloc>().state;

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, isInnerBoxScrolled) => [
            const SliverAppBar(
              centerTitle: true,
              title: Text('Radio Stations'),
            ),
          ],
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.radioStations.isEmpty) {
                if (state.status == HomeStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.status != HomeStatus.success) {
                  return const Center(
                    child:
                        Text("There's a problem fetching the radio stations."),
                  );
                } else {
                  return const Center(
                    child: Text("There's no radio stations at the moment."),
                  );
                }
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
