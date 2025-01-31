class PhotoModel {
  final String title;
  final String url;

  PhotoModel({required this.title, required this.url});

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      title: json['title'],
      url: json['url'],
    );
  }
}
