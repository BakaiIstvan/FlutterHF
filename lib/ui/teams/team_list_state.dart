import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:nba_app/domain/model/team.dart';

@immutable
abstract class TeamListState {
  const TeamListState();
}

class Loading extends TeamListState {
  static final Loading _instance = Loading._();

  factory Loading() => _instance;

  Loading._();
}

abstract class Content extends TeamListState {
  final List<Team> teams;

  Content({required this.teams});
}

class ContentReady extends Content with EquatableMixin {
  ContentReady({required List<Team> teams}): super(teams: teams);

  @override
  List<Object> get props => [teams];
}

class Refreshing extends Content with EquatableMixin {
  Refreshing({required List<Team> teams}): super(teams: teams);

  @override
  List<Object> get props => [teams];
}

class Error extends Content with EquatableMixin {
  Error({required List<Team> teams}): super(teams: teams);

  @override
  List<Object> get props => [teams];
}