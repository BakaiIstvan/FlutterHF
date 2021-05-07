import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nba_app/data/network/model/network_player.dart';

part 'network_players_reply.g.dart';

@immutable
@JsonSerializable()
class NetworkPlayersReply {
  final List<NetworkPlayer> results;

  NetworkPlayersReply(
      this.results,
      );

  static const fromJsonFactory = _$NetworkPlayersReplyFromJson;

  factory NetworkPlayersReply.fromJson(Map<String, dynamic> json) => _$NetworkPlayersReplyFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkPlayersReplyToJson(this);
}