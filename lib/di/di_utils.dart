import 'package:get_it/get_it.dart';
import 'package:nba_app/data/network/team_network_data_source.dart';
import 'package:nba_app/data/network/player_network_data_source.dart';
import 'package:nba_app/data/network/dio_nba_service.dart';
import 'package:nba_app/data/network/nba_api.dart';
import 'package:nba_app/domain/interactor/player_interactor.dart';
import 'package:nba_app/domain/interactor/team_interactor.dart';

final injector = GetIt.instance;

void initDependencies() {
  injector.registerSingleton<NbaApi>(NbaService());

  injector.registerSingleton(
    TeamNetworkDataSource(injector<NbaApi>()),
  );

  injector.registerSingleton(
    PlayerNetworkDataSource(injector<NbaApi>()),
  );

  injector.registerSingletonAsync(
        () async {
      return TeamInteractor(
        injector<TeamNetworkDataSource>(),
      );
    },
    dependsOn: [TeamNetworkDataSource],
  );

  injector.registerSingletonAsync(
      () async {
        return PlayerInteractor(
            injector<PlayerNetworkDataSource>(),
        );
      },
    dependsOn: [PlayerNetworkDataSource],
  );
}
