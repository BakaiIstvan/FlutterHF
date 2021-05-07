// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_teams_reply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkTeamsReply _$NetworkTeamsReplyFromJson(Map<String, dynamic> json) {
  return NetworkTeamsReply(
    (json['data'] as List<dynamic>)
        .map((e) => NetworkTeam.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$NetworkTeamsReplyToJson(NetworkTeamsReply instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
