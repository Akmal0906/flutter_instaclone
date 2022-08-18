class Post {
  String postImage;
  String postCaption;

  Post({required this.postImage, required this.postCaption});

  Post.fromJson(Map<String, dynamic> json)
      : postImage = json['postImage'],
        postCaption = json['postCaption'];

  Map<String, dynamic> toJson() => {
        'postImage': postImage,
        'postCaption': postCaption,
      };

}
