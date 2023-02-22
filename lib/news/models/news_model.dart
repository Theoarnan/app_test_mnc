class NewsModel {
  final String id;
  final String title;
  final String content;
  final String contentThumbnail;
  final String cotributorName;
  final String contributorAvatar;
  final String createdAt;
  final List<dynamic>? slideshow;

  NewsModel(
      this.id,
      this.title,
      this.content,
      this.contentThumbnail,
      this.cotributorName,
      this.contributorAvatar,
      this.createdAt,
      this.slideshow);

  NewsModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        content = json['content'],
        contentThumbnail = json['contentThumbnail'],
        cotributorName = json['contributorName'],
        contributorAvatar = json['contributorAvatar'],
        createdAt = json['createdAt'],
        slideshow = json['slideshow'] ?? [];
}
