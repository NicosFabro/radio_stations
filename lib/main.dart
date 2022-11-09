import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio/home/home.dart';
import 'package:radio/player/player.dart';
import 'package:radio/radio/radio.dart';
import 'package:radio/radio_ui/radio_ui.dart' as radio;

void main() {
  final radioService = RadioService();

  runApp(RadioApp(radioService: radioService));
}

class RadioApp extends StatelessWidget {
  const RadioApp({super.key, required this.radioService});

  final RadioService radioService;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: radioService,
      child: BlocProvider(
        create: (context) => PlayerBloc(),
        child: const RadioAppView(),
      ),
    );
  }
}

class RadioAppView extends StatelessWidget {
  const RadioAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: radio.RadioTheme.dark,
      home: const HomePage(),
    );
  }
}
