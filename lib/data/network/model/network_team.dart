import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nba_app/domain/model/team.dart';

part 'network_team.g.dart';

@immutable
@JsonSerializable()
class NetworkTeam {
  final int id;
  final String abbreviation;
  final String city;
  final String conference;
  final String division;
  @JsonKey(name: "full_name")
  final String fullName;
  final String name;

  NetworkTeam(
      this.id,
      this.abbreviation,
      this.city,
      this.conference,
      this.division,
      this.fullName,
      this.name,
      );

  static const fromJsonFactory = _$NetworkTeamFromJson;

  factory NetworkTeam.fromJson(Map<String, dynamic> json) => _$NetworkTeamFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkTeamToJson(this);

  Team toDomainModel() {
    final String logoUrl = "https://i.cdn.turner.com/nba/nba/.element/img/1.0/teamsites/logos/teamlogos_500x500/" + this.abbreviation.toLowerCase() + ".png";

    return Team(
      id: this.id,
      abbreviation: this.abbreviation,
      city: this.city,
      conference: this.conference,
      division: this.division,
      fullName: this.fullName,
      name: this.name,
      url: logoUrl,
    );
  }
}