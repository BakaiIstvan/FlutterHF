import 'dart:async';

import 'package:nba_app/data/network/model/network_teams_reply.dart';
import 'package:nba_app/data/network/model/network_players_reply.dart';
import 'package:nba_app/data/network/model/network_team.dart';
import 'package:nba_app/data/network/model/network_player.dart';
import 'package:retrofit/retrofit.dart';

abstract class NbaApi {
  Future<HttpResponse<NetworkTeamsReply>> getTeams();
  Future<HttpResponse<NetworkPlayersReply>> getPlayers(int per_page, int page);
  Future<HttpResponse<NetworkTeam>> getSpecificTeam(int id);
  Future<HttpResponse<NetworkPlayer>> getSpecificPlayer(int id);
}