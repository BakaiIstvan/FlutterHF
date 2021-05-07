import 'package:nba_app/data/network/team_network_data_source.dart';
import 'package:nba_app/domain/model/team.dart';

class TeamInteractor {
  final TeamNetworkDataSource _teamNetworkDataSource;

  TeamInteractor(
      this._teamNetworkDataSource
      );

  Future<List<Team>> getTeams() async {
    return await _teamNetworkDataSource.getTeams() ?? [];
  }

  Future<Team?> getTeamById(int id) async {
    print("Getting team $id from api");
    return await _teamNetworkDataSource.getTeam(id);
  }
}