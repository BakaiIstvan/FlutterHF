import 'package:flutter/foundation.dart';

@immutable
abstract class TeamDetailsEvent {
  const TeamDetailsEvent();
}

class LoadTeamEvent extends TeamDetailsEvent {
  final int id;

  LoadTeamEvent(this.id);
}
