import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'network_team.dart';

part 'network_player.g.dart';

@immutable
@JsonSerializable()
class NetworkPlayer {
  final int id;
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "last_name")
  final String lastName;
  final String position;
  @JsonKey(name: "height_feet")
  final int heightFeet;
  @JsonKey(name: "height_inches")
  final int heightInches;
  @JsonKey(name: "weight_pounds")
  final int weightPounds;
  final NetworkTeam team;

  NetworkPlayer(
      this.id,
      this.firstName,
      this.lastName,
      this.position,
      this.heightFeet,
      this.heightInches,
      this.weightPounds,
      this.team,
      );

  static const fromJsonFactory = _$NetworkPlayerFromJson;

  factory NetworkPlayer.fromJson(Map<String, dynamic> json) => _$NetworkPlayerFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkPlayerToJson(this);
}