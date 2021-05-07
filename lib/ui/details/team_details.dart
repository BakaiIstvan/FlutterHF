import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nba_app/di/di_utils.dart';
import 'package:nba_app/ui/details/team_details_event.dart';

import 'team_details_bloc.dart';
import 'team_details_state.dart';

class TeamDetails extends StatelessWidget {
  final int teamId;

  TeamDetails(this.teamId);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<TeamDetailsBloc>(),
      child: BlocBuilder<TeamDetailsBloc, TeamDetailsState>(
        builder: (context, state) {
          if (state is Loading) {
            BlocProvider.of<TeamDetailsBloc>(context)
                .add(LoadTeamEvent(teamId));
            return TeamDetailsLoading();
          }

          if (state is ContentReady) {
            final team = state.team;
            return Scaffold(
              appBar: AppBar(
                title: Text(team.name),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    team.url != null
                        ? Image.network(
                            team.url,
                            fit: BoxFit.cover,
                          )
                        : Icon(
                            Icons.image,
                            size: 200,
                          ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(team.fullName),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(team.conference),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Text(team.city),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return Center(
            child: Text(
              "Something went wrong while retrieving Team with id $teamId",
            ),
          );
        },
      ),
    );
  }
}

class TeamDetailsLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Team details"),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
