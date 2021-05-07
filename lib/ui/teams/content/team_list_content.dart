import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nba_app/main.dart';
import 'package:nba_app/ui/teams/team_list_bloc.dart';
import 'package:nba_app/ui/teams/team_list_event.dart';
import 'package:nba_app/ui/teams/team_list_state.dart';

class TeamListContent extends StatefulWidget {
  final Content state;
  final bool western;

  TeamListContent(this.state, this.western);

  @override
  _TeamListContentState createState() => _TeamListContentState(state, western);
}

class _TeamListContentState extends State<TeamListContent> {
  Content state;
  bool western;
  late Completer _refreshCompleter;

  _TeamListContentState(this.state, this.western);

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TeamListBloc, TeamListState>(
      listener: (_, state) {
        if (!(state is Refreshing)) {
          _refreshCompleter.complete();
          _refreshCompleter = Completer();
        }
      },
      child: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<TeamListBloc>(context).add(RefreshTeamsEvent(western));
          return _refreshCompleter.future;
        },
        child: ListView.builder(
          itemCount: state.teams.length,
          itemBuilder: (context, index) {
            final item = state.teams[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  DETAIL_PAGE,
                  arguments: item.id,
                );
              },
              child: ListTile(
                leading: item.url != null
                    ? Image.network(
                        item.url,
                        fit: BoxFit.cover,
                      )
                    : Icon(
                        Icons.image,
                        size: 40,
                      ),
                title: Text(
                  item.fullName,
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
                            item.conference,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
