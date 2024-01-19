import 'result.dart';

class PokemonListResponse {
  int? count;
  String? next;
  dynamic previous;
  List<Result>? results;

  PokemonListResponse({this.count, this.next, this.previous, this.results});

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) {
    return PokemonListResponse(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as dynamic,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'count': count,
        'next': next,
        'previous': previous,
        'results': results?.map((e) => e.toJson()).toList(),
      };
}
