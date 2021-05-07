import 'package:get_it/get_it.dart';
import 'package:nba_app/data/network/team_network_data_source.dart';
import 'package:nba_app/data/network/player_network_data_source.dart';
import 'package:nba_app/data/network/dio_nba_service.dart';
import 'package:nba_app/data/network/nba_api.dart';
import 'package:nba_app/domain/interactor/player_interactor.dart';
import 'package:nba_app/domain/interactor/team_interactor.dart';
import 'package:nba_app/ui/teams/team_list_bloc.dart';
import 'package:nba_app/ui/details/team_details_bloc.dart';

final injector = GetIt.instance;

void initDependencies() {
  injector.registerSingletonAsync<NbaApi>(
        () async {
          return NbaService();
        },
  );

  injector.registerSingletonAsync(
        () async {
      return TeamNetworkDataSource(
        injector<NbaApi>(),
      );
    },
    dependsOn: [NbaApi],
  );

  injector.registerSingletonAsync(
          () async {
        return PlayerNetworkDataSource(
          injector<NbaApi>(),
        );
      },
      dependsOn: [NbaApi],
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

  injector.registerFactory(
        () => TeamListBloc(
      injector<TeamInteractor>(),
    ),
  );

  injector.registerFactory(
        () => TeamDetailsBloc(
      injector<TeamInteractor>(),
    ),
  );
}
