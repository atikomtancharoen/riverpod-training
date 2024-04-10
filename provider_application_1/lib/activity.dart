// ignore_for_file: public_member_api_docs, sort_constructors_first
/// The response of the `GET /api/activity` endpoint.
class Activity {
  Activity({
    required this.key,
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      key: json['key'] as String,
      activity: json['activity'] as String,
      type: json['type'] as String,
      participants: json['participants'] as int,
      price: (json['price'] is double ? json['price'] as double : null),
    );
  }

  final String key;
  final String activity;
  final String type;
  final int participants;
  double? price;

  @override
  bool operator ==(covariant Activity other) {
    if (identical(this, other)) return true;

    return other.key == key &&
        other.activity == activity &&
        other.type == type &&
        other.participants == participants;
  }

  @override
  int get hashCode {
    return key.hashCode ^ activity.hashCode ^ type.hashCode ^ participants.hashCode;
  }
}
