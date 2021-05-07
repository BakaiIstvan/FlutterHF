import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nba_app/main.dart';
import 'package:nba_app/ui/teams/team_list_bloc.dart';
import 'package:nba_app/ui/teams/team_list_event.dart';
import 'package:nba_app/ui/teams/team_list_state.dart';

class TeamListContent extends StatefulWidget {
  final Content state;

  TeamListContent(this.state);

  @override
  _TeamListContentState createState() => _TeamListContentState(state);
}

class _TeamListContentState extends State<TeamListContent> {
  Content state;
  late Completer _refreshCompleter;

  _TeamListContentState(this.state);

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
          BlocProvider.of<TeamListBloc>(context).add(RefreshTeamsEvent());
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
                            item.abbreviation,
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
