import 'package:flutter/foundation.dart';

@immutable
abstract class TeamListEvent {
  const TeamListEvent();
}

class LoadTeamsEvent extends TeamListEvent {
  static final LoadTeamsEvent _instance = LoadTeamsEvent._();

  factory LoadTeamsEvent() => _instance;

  LoadTeamsEvent._();
}

class RefreshTeamsEvent extends TeamListEvent {
  static final RefreshTeamsEvent _instance = RefreshTeamsEvent._();

  factory RefreshTeamsEvent() => _instance;

  RefreshTeamsEvent._();
}