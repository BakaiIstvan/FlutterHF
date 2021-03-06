import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:nba_app/domain/model/player.dart';
import 'package:nba_app/domain/model/team.dart';

@immutable
abstract class TeamDetailsState {
  const TeamDetailsState();
}

class Loading extends TeamDetailsState {
  static final Loading _instance = Loading._();

  factory Loading() => _instance;

  Loading._();
}

class Error extends TeamDetailsState {
  static final Error _instance = Error._();

  factory Error() => _instance;

  Error._();
}

class ContentReady extends TeamDetailsState with EquatableMixin {
  final Team team;
  final List<Player> players;

  ContentReady({required this.team,
                required this.players});

  @override
  List<Object> get props => [team, players];
}