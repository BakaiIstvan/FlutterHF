import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Team extends Equatable implements Comparable {
  final int id;
  final String abbreviation;
  final String city;
  final String conference;
  final String division;
  final String fullName;
  final String name;
  final String url;

  const Team({
    required this.id,
    required this.abbreviation,
    required this.city,
    required this.conference,
    required this.division,
    required this.fullName,
    required this.name,
    required this.url,
  });

  Team copyWith({
    int? id,
    String? abbreviation,
    String? city,
    String? conference,
    String? division,
    String? fullName,
    String? name,
    String? url,
  }) {
    return new Team(
      id: id ?? this.id,
      abbreviation: abbreviation ?? this.abbreviation,
      city: city ?? this.city,
      conference: conference ?? this.conference,
      division: division ?? this.division,
      fullName: fullName ?? this.fullName,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  List<Object?> get props => [
    id,
    abbreviation,
    city,
    conference,
    division,
    fullName,
    name,
    url,
  ];

  @override
  int compareTo(other) {
    if (this.conference == "West" && other.conference == "East") {
      return 0;
    }

    return 1;
  }
}