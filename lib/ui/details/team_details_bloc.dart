import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nba_app/domain/interactor/team_interactor.dart';
import 'package:nba_app/domain/interactor/player_interactor.dart';
import 'package:nba_app/domain/model/player.dart';

import 'team_details_event.dart';
import 'team_details_state.dart';

class TeamDetailsBloc extends Bloc<TeamDetailsEvent, TeamDetailsState> {
  final TeamInteractor _teamInteractor;
  final PlayerInteractor _playerInteractor;

  TeamDetailsBloc(
    this._teamInteractor, this._playerInteractor,
  ) : super(Loading());

  @override
  Stream<TeamDetailsState> mapEventToState(TeamDetailsEvent event) async* {
    if (event is LoadTeamEvent) {
      yield* _mapLoadTeamToState(event);
    }
  }

  Stream<TeamDetailsState> _mapLoadTeamToState(LoadTeamEvent event) async* {
    print("Fetching Team from API with id: ${event.id}");
    final team = await _teamInteractor.getTeamById(event.id);
    List<Player> players = [];
    for (int i = 0; i < 36; i++) {
      final playersPage = await _playerInteractor.getPlayers(100, i);
      players.addAll(playersPage);
    }
    final teamPlayers = players.where((player) => player.team.id == team?.id).toSet().toList();

    if(team != null) {
      print("Team fetched, sending ContentReady state with Team");
      yield ContentReady(team: team, players: teamPlayers);
    } else {
      print("Team with ID ${event.id} was not found!");
      yield Error();
    }
  }
}
