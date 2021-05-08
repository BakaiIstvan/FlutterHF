import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nba_app/ui/details/team_details_bloc.dart';
import 'package:nba_app/ui/details/team_details_state.dart';

class PlayerListContent extends StatefulWidget {
  final ContentReady state;

  PlayerListContent(this.state);

  @override
  _PlayerListContentState createState() => _PlayerListContentState(state);
}

class _PlayerListContentState extends State<PlayerListContent> {
  ContentReady state;

  _PlayerListContentState(this.state);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TeamDetailsBloc, TeamDetailsState>(
      listener: (_, state) {},
      child: ListView.builder(
        itemCount: widget.state.players.length,
        itemBuilder: (context, index) {
          final item = widget.state.players[index];
          return ListTile(
            title: Text(
              item.firstName + " " + item.lastName,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        item.position,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
