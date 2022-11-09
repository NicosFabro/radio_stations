import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio/player/player.dart';

class PlayerFAB extends StatelessWidget {
  const PlayerFAB({super.key});

  @override
  Widget build(BuildContext context) {
    final playerBloc = context.read<PlayerBloc>();

    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        if (state.status == PlayerStatus.initial) {
          return const SizedBox();
        }

        return FloatingActionButton.extended(
          onPressed: () => playerBloc.add(const TogglePlayerRequested()),
          icon: Icon(
            state.status == PlayerStatus.stopped
                ? Icons.play_arrow
                : Icons.pause,
          ),
          label: Text(
            state.nowPlaying.radioName,
            overflow: TextOverflow.ellipsis,
          ),
        );
      },
    );
  }
}
