// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_players_reply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkPlayersReply _$NetworkPlayersReplyFromJson(Map<String, dynamic> json) {
  return NetworkPlayersReply(
    (json['results'] as List<dynamic>)
        .map((e) => NetworkPlayer.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$NetworkPlayersReplyToJson(
        NetworkPlayersReply instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
