import 'package:nba_app/data/network/player_network_data_source.dart';
import 'package:nba_app/domain/model/player.dart';

class PlayerInteractor {
  final PlayerNetworkDataSource _playerNetworkDataSource;

  PlayerInteractor(
      this._playerNetworkDataSource
      );

  Future<List<Player>> getPlayers() async {
    return await _playerNetworkDataSource.getPlayers() ?? [];
  }

  Future<Player?> getPlayerById(int id) async {
    print("Getting player $id from api");
    return await _playerNetworkDataSource.getPlayer(id);
  }
}