// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkPlayer _$NetworkPlayerFromJson(Map<String, dynamic> json) {
  return NetworkPlayer(
    json['id'] as int,
    json['first_name'] as String,
    json['last_name'] as String,
    json['position'] as String,
    json['height_feet'] as int?,
    json['height_inches'] as int?,
    json['weight_pounds'] as int?,
    NetworkTeam.fromJson(json['team'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NetworkPlayerToJson(NetworkPlayer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'position': instance.position,
      'height_feet': instance.heightFeet,
      'height_inches': instance.heightInches,
      'weight_pounds': instance.weightPounds,
      'team': instance.team,
    };
