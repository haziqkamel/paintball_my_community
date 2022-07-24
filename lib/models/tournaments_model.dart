import 'dart:convert';

class Tournaments {
  final String type;
  final String id;
  final String title;
  final String subTitle;
  final String eventDate;
  final String eventLocation;
  final String headImage;
  Tournaments({
    required this.type,
    required this.id,
    required this.title,
    required this.subTitle,
    required this.eventDate,
    required this.eventLocation,
    required this.headImage,
  });

  Tournaments copyWith({
    String? type,
    String? id,
    String? title,
    String? subTitle,
    String? eventDate,
    String? eventLocation,
    String? headImage,
  }) {
    return Tournaments(
      type: type ?? this.type,
      id: id ?? this.id,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      eventDate: eventDate ?? this.eventDate,
      eventLocation: eventLocation ?? this.eventLocation,
      headImage: headImage ?? this.headImage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'id': id,
      'title': title,
      'subTitle': subTitle,
      'eventDate': eventDate,
      'eventLocation': eventLocation,
      'headImage': headImage,
    };
  }

  factory Tournaments.fromMap(Map<String, dynamic> map) {
    return Tournaments(
      type: map['type'] ?? '',
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      subTitle: map['subTitle'] ?? '',
      eventDate: map['eventDate'] ?? '',
      eventLocation: map['eventLocation'] ?? '',
      headImage: map['headImage'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Tournaments.fromJson(String source) =>
      Tournaments.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Tournaments(type: $type, id: $id, title: $title, subTitle: $subTitle, eventDate: $eventDate, eventLocation: $eventLocation, headImage: $headImage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Tournaments &&
      other.type == type &&
      other.id == id &&
      other.title == title &&
      other.subTitle == subTitle &&
      other.eventDate == eventDate &&
      other.eventLocation == eventLocation &&
      other.headImage == headImage;
  }

  @override
  int get hashCode {
    return type.hashCode ^
      id.hashCode ^
      title.hashCode ^
      subTitle.hashCode ^
      eventDate.hashCode ^
      eventLocation.hashCode ^
      headImage.hashCode;
  }
}
