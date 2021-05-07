import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nba_app/domain/interactor/team_interactor.dart';

import 'team_details_event.dart';
import 'team_details_state.dart';

class TeamDetailsBloc extends Bloc<TeamDetailsEvent, TeamDetailsState> {
  final TeamInteractor _teamInteractor;

  TeamDetailsBloc(
    this._teamInteractor,
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

    if(team != null) {
      print("Team fetched, sending ContentReady state with Team");
      yield ContentReady(team: team);
    } else {
      print("Team with ID ${event.id} was not found!");
      yield Error();
    }
  }
}
