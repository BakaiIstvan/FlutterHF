import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nba_app/data/network/model/network_team.dart';

part 'network_teams_reply.g.dart';

@immutable
@JsonSerializable()
class NetworkTeamsReply {
  final List<NetworkTeam> results;

  NetworkTeamsReply(
      this.results,
      );

  static const fromJsonFactory = _$NetworkTeamsReplyFromJson;

  factory NetworkTeamsReply.fromJson(Map<String, dynamic> json) => _$NetworkTeamsReplyFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkTeamsReplyToJson(this);
}