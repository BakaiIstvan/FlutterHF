import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nba_app/domain/interactor/team_interactor.dart';
import 'package:nba_app/ui/teams/team_list_event.dart';
import 'package:nba_app/ui/teams/team_list_state.dart';

class TeamListBloc extends Bloc<TeamListEvent, TeamListState> {
  final TeamInteractor _teamInteractor;

  TeamListBloc(
    this._teamInteractor,
  ) : super(Loading());

  @override
  Stream<TeamListState> mapEventToState(TeamListEvent event) async* {
    if (event is LoadTeamsEvent) {
      yield* _mapLoadTeamsToState(event.western);
    } else if (event is RefreshTeamsEvent) {
      yield* _mapRefreshTeamsEvent(event.western);
    }
  }

  Stream<TeamListState> _mapLoadTeamsToState(bool western) async* {
    try {
      print("Refreshing Teams");
      await _teamInteractor.getTeams();
    } on Exception catch (e) {
      print("Refreshing Teams failed, reason: ${e.toString()}");
      yield Error(teams: []);
    }

    print("Load - Getting Teams from API");
    final teams = await _teamInteractor.getTeams();
    if (western) {
      teams.sort((a, b) { return a.compareTo(b); });
    } else {
      teams.sort((a,b) { return a.compareTo(b) ^ 1; });
    }

    print("Teams refreshed, sending Content state with Team list");
    yield ContentReady(teams: teams);
  }

  Stream<TeamListState> _mapRefreshTeamsEvent(bool western) async* {
    final currentState = state;
    if (!(currentState is Refreshing)) {
      if (currentState is Content) {
        print("Teams refreshing requested");
        final teams = currentState.teams;
        if (western) {
          teams.sort((a, b) { return a.compareTo(b); });
        } else {
          teams.sort((a,b) { return a.compareTo(b) ^ 1; });
        }

        yield Refreshing(teams: teams);

        try {
          print("Refreshing Teams");
          await _teamInteractor.getTeams();
        } catch (e) {
          print(
              "Refreshing Teams failed, reason: ${e.toString()}, sending Error state");
          yield Error(teams: currentState.teams);
        }
      }
    }

    print("Refresh - Getting Teams from API");
    final teams = await _teamInteractor.getTeams();
    if (western) {
      teams.sort((a, b) { return a.compareTo(b); });
    } else {
      teams.sort((a,b) { return a.compareTo(b) ^ 1; });
    }

    yield ContentReady(teams: teams);
  }
}
