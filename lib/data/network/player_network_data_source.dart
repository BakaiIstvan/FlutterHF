import 'package:nba_app/data/network/model/network_player.dart';
import 'team_network_data_source.dart';
import 'package:nba_app/data/network/nba_api.dart';
import 'package:nba_app/domain/model/player.dart';

class PlayerNetworkDataSource {
  final NbaApi _nbaApi;

  PlayerNetworkDataSource(this._nbaApi);

  Future<List<Player>?> getPlayers() async {
    final networkResponse = await _nbaApi.getPlayers();

    if (networkResponse.response.statusCode != 200) return null;

    final networkPlayers = networkResponse.data.data;

    return networkPlayers.map((player) => player.toDomainModel()).toList();
  }

  Future<Player?> getPlayer(int id) async {
    final networkResponse = await _nbaApi.getSpecificPlayer(id);

    if (networkResponse.response.statusCode != 200) return null;

    final networkPlayer = networkResponse.data;

    return networkPlayer.toDomainModel();
  }
}

extension on NetworkPlayer {
  Player toDomainModel() {
    return Player(
      id: this.id,
      firstName: this.firstName,
      lastName: this.lastName,
      position: this.position,
      heightFeet: this.heightFeet,
      heightInches: this.heightInches,
      weightPounds: this.weightPounds,
      team: this.team.toDomainModel(),
    );
  }
}