// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkTeam _$NetworkTeamFromJson(Map<String, dynamic> json) {
  return NetworkTeam(
    json['id'] as int,
    json['abbreviation'] as String,
    json['city'] as String,
    json['conference'] as String,
    json['division'] as String,
    json['full_name'] as String,
    json['name'] as String,
  );
}

Map<String, dynamic> _$NetworkTeamToJson(NetworkTeam instance) =>
    <String, dynamic>{
      'id': instance.id,
      'abbreviation': instance.abbreviation,
      'city': instance.city,
      'conference': instance.conference,
      'division': instance.division,
      'full_name': instance.fullName,
      'name': instance.name,
    };
