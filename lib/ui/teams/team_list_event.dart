import 'package:flutter/foundation.dart';

@immutable
abstract class TeamListEvent {
  const TeamListEvent();
}

class LoadTeamsEvent extends TeamListEvent {
  final bool western;

  LoadTeamsEvent(this.western);
}

class RefreshTeamsEvent extends TeamListEvent {
  final bool western;

  RefreshTeamsEvent(this.western);
}