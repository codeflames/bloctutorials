import 'dart:convert';

import 'package:equatable/equatable.dart';

class BoredPandaResponse extends Equatable {
  final String? activity;
  final String? type;
  final int? participants;
  final num? price;
  final String? link;
  final String? key;
  final num? accessibility;

  const BoredPandaResponse({
    this.activity,
    this.type,
    this.participants,
    this.price,
    this.link,
    this.key,
    this.accessibility,
  });

  factory BoredPandaResponse.fromMap(Map<String, dynamic> data) {
    return BoredPandaResponse(
      activity: data['activity'] as String?,
      type: data['type'] as String?,
      participants: data['participants'] as int?,
      price: data['price'] as num?,
      link: data['link'] as String?,
      key: data['key'] as String?,
      accessibility: data['accessibility'] as num?,
    );
  }

  Map<String, dynamic> toMap() => {
        'activity': activity,
        'type': type,
        'participants': participants,
        'price': price,
        'link': link,
        'key': key,
        'accessibility': accessibility,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BoredPandaResponse].
  factory BoredPandaResponse.fromJson(String data) {
    return BoredPandaResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BoredPandaResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  BoredPandaResponse copyWith({
    String? activity,
    String? type,
    int? participants,
    num? price,
    String? link,
    String? key,
    num? accessibility,
  }) {
    return BoredPandaResponse(
      activity: activity ?? this.activity,
      type: type ?? this.type,
      participants: participants ?? this.participants,
      price: price ?? this.price,
      link: link ?? this.link,
      key: key ?? this.key,
      accessibility: accessibility ?? this.accessibility,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      activity,
      type,
      participants,
      price,
      link,
      key,
      accessibility,
    ];
  }
}
