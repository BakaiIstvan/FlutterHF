import 'package:dio/dio.dart';
import 'package:nba_app/data/network/model/network_teams_reply.dart';
import 'package:nba_app/data/network/model/network_players_reply.dart';
import 'package:nba_app/data/network/model/network_team.dart';
import 'package:nba_app/data/network/model/network_player.dart';
import 'package:nba_app/data/network/nba_api.dart';
import 'package:retrofit/retrofit.dart';

part 'dio_nba_service.g.dart';

@RestApi(baseUrl: "https://www.balldontlie.io")
abstract class NbaService implements NbaApi {

  factory NbaService() {
    final _dio = Dio();

    _dio.interceptors.add(
        InterceptorsWrapper(
            onRequest: (request, handler) {
              handler.next(request);
            }
        )
    );
    _dio.interceptors.add(LogInterceptor());
    return _NbaService(_dio);
  }

  @override
  @GET("/api/v1/teams")
  Future<HttpResponse<NetworkTeamsReply>> getTeams();

  @override
  @GET("/api/v1/players")
  Future<HttpResponse<NetworkPlayersReply>> getPlayers();

  @override
  @GET("/api/v1/teams/{id}")
  Future<HttpResponse<NetworkTeam>> getSpecificTeam(@Path("id") int id);

  @override
  @GET("/api/v1/players/{id}")
  Future<HttpResponse<NetworkPlayer>> getSpecificPlayer(@Path("id") int id);
}