class UserProfileModel {
  final String uid;
  final String email;
  final String name;
  final String bio;
  final String link;
  final bool hasAvatar;

  UserProfileModel({
    required this.hasAvatar,
    required this.uid,
    required this.email,
    required this.name,
    required this.bio,
    required this.link,
  });

  UserProfileModel.empty()
      : bio = "",
        uid = "",
        email = "",
        link = "",
        hasAvatar = false,
        name = "";

  UserProfileModel.formJson(Map<String, dynamic> json)
      : bio = json["bio"],
        uid = json["uid"],
        email = json["email"],
        link = json["link"],
        hasAvatar = json["hasAvatar"] ?? false,
        name = json["name"];

  Map<String, String> toJson() {
    return {
      "uid": uid,
      "email": email,
      "name": name,
      "bio": bio,
      "link": link,
    };
  }

  UserProfileModel copyWith({
    String? uid,
    String? email,
    String? name,
    String? bio,
    String? link,
    bool? hasAvatar,
  }) {
    return UserProfileModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      link: link ?? this.link,
      hasAvatar: hasAvatar ?? this.hasAvatar,
    );
  }
}
