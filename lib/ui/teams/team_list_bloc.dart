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
      yield* _mapLoadTeamsToState();
    } else if (event is RefreshTeamsEvent) {
      yield* _mapRefreshTeamsEvent();
    }
  }

  Stream<TeamListState> _mapLoadTeamsToState() async* {
    try {
      print("Refreshing Teams");
      await _teamInteractor.getTeams();
    } on Exception catch (e) {
      print("Refreshing Teams failed, reason: ${e.toString()}");
      yield Error(teams: []);
    }

    print("Getting Teams from API");
    final teams = await _teamInteractor.getTeams();

    print("Articles refreshed, sending Content state with Team list");
    yield ContentReady(teams: teams);
  }

  Stream<TeamListState> _mapRefreshTeamsEvent() async* {
    final currentState = state;
    if (!(currentState is Refreshing)) {
      if (currentState is Content) {
        print("Teams refreshing requested");
        yield Refreshing(teams: currentState.teams);

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

    print("Getting Teams from API");
    final teams = await _teamInteractor.getTeams();

    yield ContentReady(teams: teams);
  }
}
