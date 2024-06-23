



class NewsModel {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  NewsModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  // Factory constructor to create an instance of Comment from a map (JSON)
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      postId: json['postId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }

  // Method to convert an instance of Comment to a map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }
}
