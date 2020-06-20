import 'package:json_annotation/json_annotation.dart';

part 'userData.g.dart';

@JsonSerializable()
class UserModel {
  
  @JsonKey(name: '_id')
  final String userId;

  @JsonKey(name: 'name')
  final String userName;

  final String password;
  final String email;
  final String firebaseToken;
  final String bio;
  final String sex;
  final List<String> imageUrl;
  final List<String> videoUrl;
  final int reviewCount;
  final int likeCount;

  UserModel( 
    {this.userId,this.userName,this.password,this.email,this.firebaseToken,
    this.bio,this.sex,this.imageUrl,this.videoUrl,this.reviewCount,this.likeCount}
  );

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson () => _$UserModelToJson(this);

  void showUserDetail(){
    print( 'userId -> ${this.userId}\nuserName -> ${this.userName}\npassword -> ${this.password}\nemail -> ${this.email}\nfirebaseToken -> ${this.firebaseToken}\nbio -> ${this.bio}\nsex -> ${this.sex}\nimageUrl -> ${this.imageUrl}\nvideoUrl -> ${this.videoUrl}\nreviewCount -> ${this.reviewCount}\nlikeCount -> ${this.likeCount}\n');
  }

}