import 'dart:math';
import 'package:equatable/equatable.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class StockPhoto extends Equatable {
  static List<StockPhoto?> _cache = [];

  factory StockPhoto.fromId(int id){
    while(_cache.length <= id){
      _cache.add(null);
    }
    if (_cache[id] == null){
      _cache[id] = StockPhoto._generate(id);
    }
    return _cache[id]!;
  }

  final int id;
  final String url;
  final String title;
  final String description;
  final double rating;

  StockPhoto._generate(this.id)
      : this.url = "https://i.cdn.turner.com/nba/nba/.element/img/1.0/teamsites/logos/teamlogos_500x500/lal.png",
        this.title = lorem(paragraphs: 1, words: 2),
        this.description = lorem(paragraphs: 2, words: 40),
        this.rating = Random().nextDouble() * 5;

  @override
  List<Object?> get props => [
    id,
    url,
    title,
    description,
    rating,
  ];
}
