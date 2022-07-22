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
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) => News.fromMap(json.decode(source));

  @override
  String toString() {
    return 'News(id: $id, newsTitle: $newsTitle, newsHeadImage: $newsHeadImage, newsDescription: $newsDescription, authorImageUrl: $authorImageUrl, authorName: $authorName, newsPostedOn: $newsPostedOn, newsContentImage: $newsContentImage, newsMoreDescription: $newsMoreDescription, shareUrl: $shareUrl)';
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
        other.shareUrl == shareUrl;
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
        shareUrl.hashCode;
  }
}

class NewsRepository {
  final List<News> newsRepo = [
    News(
        id: '1',
        newsTitle: 'New Kids On',
        newsHeadImage: '',
        newsDescription:
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren',
        authorImageUrl: '',
        authorName: 'Eddie Munson',
        newsPostedOn: '18 July 2022',
        newsMoreDescription:
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren',
        shareUrl: '')
  ];
}
