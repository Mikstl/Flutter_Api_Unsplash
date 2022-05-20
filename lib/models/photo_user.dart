class SearchListUser {
  List<PhotoUser> resultSearch;
  SearchListUser({required this.resultSearch}) {}

  factory SearchListUser.fromJson(Map<String, dynamic> json) {
    var resultJson = json['results'] as List;

    List<PhotoUser> photoUserSearchList =
        resultJson.map((i) => PhotoUser.fromJson(i)).toList();
    return SearchListUser(
      resultSearch: photoUserSearchList,
    );
  }
}

class PhotoUser {
  String? id;
  String? user;
  String? picture;
  String? pictureAvatar;
  String? likes;

  PhotoUser({this.id, this.picture, this.user, this.pictureAvatar, this.likes});

  factory PhotoUser.fromJson(Map<String, dynamic> json) {
    // print(json["id"]);
    // print(json['user']["username"]);
    // print(json['urls']["regular"]);

    return PhotoUser(
        id: json['id'],
        user: json['user']["username"],
        picture: json['urls']["regular"],
        pictureAvatar: json['user']["profile_image"]["large"],
        likes: json['color'].toString());
  }
}


// Это наша плиточка фотографии с именем и id.