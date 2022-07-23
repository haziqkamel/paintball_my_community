import 'dart:convert';

class News {
  String id;
  String newsTitle;
  String newsHeadImage;
  String newsDescription;
  String authorImageUrl;
  String authorName;
  String newsPostedOn;
  String? newsContentImage;
  String newsMoreDescription;
  String shareUrl;
  bool isMocked;
  String type;
  News({
    required this.id,
    required this.newsTitle,
    required this.newsHeadImage,
    required this.newsDescription,
    required this.authorImageUrl,
    required this.authorName,
    required this.newsPostedOn,
    this.newsContentImage,
    required this.newsMoreDescription,
    required this.shareUrl,
    this.isMocked = true,
    required this.type,
  });

  News copyWith({
    String? id,
    String? newsTitle,
    String? newsHeadImage,
    String? newsDescription,
    String? authorImageUrl,
    String? authorName,
    String? newsPostedOn,
    String? newsContentImage,
    String? newsMoreDescription,
    String? shareUrl,
    bool? isMocked,
    String? type,
  }) {
    return News(
      id: id ?? this.id,
      newsTitle: newsTitle ?? this.newsTitle,
      newsHeadImage: newsHeadImage ?? this.newsHeadImage,
      newsDescription: newsDescription ?? this.newsDescription,
      authorImageUrl: authorImageUrl ?? this.authorImageUrl,
      authorName: authorName ?? this.authorName,
      newsPostedOn: newsPostedOn ?? this.newsPostedOn,
      newsContentImage: newsContentImage ?? this.newsContentImage,
      newsMoreDescription: newsMoreDescription ?? this.newsMoreDescription,
      shareUrl: shareUrl ?? this.shareUrl,
      isMocked: isMocked ?? this.isMocked,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'newsTitle': newsTitle,
      'newsHeadImage': newsHeadImage,
      'newsDescription': newsDescription,
      'authorImageUrl': authorImageUrl,
      'authorName': authorName,
      'newsPostedOn': newsPostedOn,
      'newsContentImage': newsContentImage,
      'newsMoreDescription': newsMoreDescription,
      'shareUrl': shareUrl,
      'isMocked': isMocked,
      'type': type,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      id: map['id'] ?? '',
      newsTitle: map['newsTitle'] ?? '',
      newsHeadImage: map['newsHeadImage'] ?? '',
      newsDescription: map['newsDescription'] ?? '',
      authorImageUrl: map['authorImageUrl'] ?? '',
      authorName: map['authorName'] ?? '',
      newsPostedOn: map['newsPostedOn'] ?? '',
      newsContentImage: map['newsContentImage'],
      newsMoreDescription: map['newsMoreDescription'] ?? '',
      shareUrl: map['shareUrl'] ?? '',
      isMocked: map['isMocked'] ?? false,
      type: map['type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) => News.fromMap(json.decode(source));

  @override
  String toString() {
    return 'News(id: $id, newsTitle: $newsTitle, newsHeadImage: $newsHeadImage, newsDescription: $newsDescription, authorImageUrl: $authorImageUrl, authorName: $authorName, newsPostedOn: $newsPostedOn, newsContentImage: $newsContentImage, newsMoreDescription: $newsMoreDescription, shareUrl: $shareUrl, isMocked: $isMocked, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is News &&
      other.id == id &&
      other.newsTitle == newsTitle &&
      other.newsHeadImage == newsHeadImage &&
      other.newsDescription == newsDescription &&
      other.authorImageUrl == authorImageUrl &&
      other.authorName == authorName &&
      other.newsPostedOn == newsPostedOn &&
      other.newsContentImage == newsContentImage &&
      other.newsMoreDescription == newsMoreDescription &&
      other.shareUrl == shareUrl &&
      other.isMocked == isMocked &&
      other.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      newsTitle.hashCode ^
      newsHeadImage.hashCode ^
      newsDescription.hashCode ^
      authorImageUrl.hashCode ^
      authorName.hashCode ^
      newsPostedOn.hashCode ^
      newsContentImage.hashCode ^
      newsMoreDescription.hashCode ^
      shareUrl.hashCode ^
      isMocked.hashCode ^
      type.hashCode;
  }
}
