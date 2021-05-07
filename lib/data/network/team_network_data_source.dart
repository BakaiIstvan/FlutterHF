import 'package:nba_app/data/network/model/network_team.dart';
import 'package:nba_app/data/network/nba_api.dart';
import 'package:nba_app/domain/model/team.dart';

class TeamNetworkDataSource {
  final NbaApi _nbaApi;

  TeamNetworkDataSource(this._nbaApi);

  Future<List<Team>?> getTeams() async {
    final networkResponse = await _nbaApi.getTeams();

    if (networkResponse.response.statusCode != 200) return null;

    final networkTeams = networkResponse.data.results;

    return networkTeams.map((team) => team.toDomainModel()).toList();
  }

  Future<Team?> getTeam(int id) async {
    final networkResponse = await _nbaApi.getSpecificTeam(id);

    if (networkResponse.response.statusCode != 200) return null;

    final networkTeam = networkResponse.data;

    return networkTeam.toDomainModel();
  }
}