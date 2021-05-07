import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nba_app/di/di_utils.dart';
import 'package:nba_app/ui/teams/team_list_bloc.dart';
import 'package:nba_app/ui/teams/team_list_event.dart';
import 'package:nba_app/ui/teams/team_list_state.dart';
import 'package:nba_app/ui/teams/content/team_list_content.dart';
import 'package:nba_app/utils.dart';

class TeamListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NBA Teams"),
      ),
      body: BlocProvider(
        create: (context) => injector<TeamListBloc>(),
        child: BlocListener<TeamListBloc, TeamListState>(
          listener: (context, state) {
            if (state is Error) {
              context.showSnackBar(
                content: Text("Failed to refresh teams!"),
              );
            }
          },
          child: BlocBuilder<TeamListBloc, TeamListState>(
            builder: (context, state) {
              if (state is Loading) {
                BlocProvider.of<TeamListBloc>(context)
                    .add(LoadTeamsEvent());
                return TeamListLoading();
              }

              if (state is Content) {
                return TeamListContent(state);
              }

              return Center(
                child: Text("Something went wrong :("),
              );
            },
          ),
        ),
      ),
    );
  }
}

class TeamListLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
