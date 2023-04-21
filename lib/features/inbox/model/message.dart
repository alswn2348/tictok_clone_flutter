class MessageModel {
  final String text;
  final String userId;
  final int createAt;

  MessageModel({
    required this.text,
    required this.userId,
    required this.createAt,
  });

  MessageModel.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        userId = json['userId'],
        createAt = json['createAt'];

  Map<String, dynamic> toJson() {
    return {
      "text": text,
      "userId": userId,
      "createAt": createAt,
    };
  }
}
