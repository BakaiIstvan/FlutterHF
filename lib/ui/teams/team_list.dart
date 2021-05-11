import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nba_app/di/di_utils.dart';
import 'package:nba_app/ui/teams/team_list_bloc.dart';
import 'package:nba_app/ui/teams/team_list_event.dart';
import 'package:nba_app/ui/teams/team_list_state.dart';
import 'package:nba_app/ui/teams/content/team_list_content.dart';
import 'package:nba_app/utils.dart';

class TeamListPage extends StatefulWidget {
  @override
  _TeamListPage createState() => _TeamListPage();
}

class _TeamListPage extends State<TeamListPage> {
  bool western = true;

  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NBA Teams"),
        actions: [
          TextButton(
            child: western
                ? Text('Western Conference')
                : Text('Eastern Conference'),
            onPressed: () async {
              setState(() {
                western = !western;
              });
              BlocProvider.of<TeamListBloc>(_context)
                  .add(RefreshTeamsEvent(western));
            },
            style: TextButton.styleFrom(
              primary: Colors.white,
              textStyle: TextStyle(fontSize: 18),
            ),
          ),
        ],
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
                    .add(LoadTeamsEvent(western));
                return TeamListLoading();
              }

              if (state is Content) {
                _context = context;
                if (western) {
                  state.teams.sort((a, b) { return a.compareTo(b); });
                } else {
                  state.teams.sort((a,b) { return a.compareTo(b) ^ 1; });
                }
                return TeamListContent(state, western);
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
