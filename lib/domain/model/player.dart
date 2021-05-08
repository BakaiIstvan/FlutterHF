import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:nba_app/domain/model/team.dart';

@immutable
class Player extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String position;
  final int? heightFeet;
  final int? heightInches;
  final int? weightPounds;
  final Team team;

  const Player({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.position,
    this.heightFeet,
    this.heightInches,
    this.weightPounds,
    required this.team,
  });

  Player copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? position,
    int? heightFeet,
    int? heightInches,
    int? weightPounds,
    Team? team,
  }) {
    return new Player(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      position: position ?? this.position,
      heightFeet: heightFeet ?? this.heightFeet,
      heightInches: heightInches ?? this.heightInches,
      weightPounds: weightPounds ?? this.weightPounds,
      team: team ?? this.team,
    );
  }

  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    position,
    heightFeet,
    heightInches,
    weightPounds,
    team,
  ];
}