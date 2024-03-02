class PostModel {
  final String id;
  final bool mostLiked;
  final String image;
  final String description;
  final double likes;
  final String date;

  PostModel(
    this.id, {
    required this.mostLiked,
    required this.image,
    required this.description,
    required this.likes,
    required this.date,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      json['id'],
      mostLiked: json['mostLiked'],
      image: json['image'],
      description: json['description'],
      likes: json['likes'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'mostLiked': mostLiked,
      'image': image,
      'description': description,
      'likes': likes,
      'date': date,
    };
  }
}
