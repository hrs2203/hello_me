// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    userId: json['_id'] as String,
    userName: json['name'] as String,
    password: json['password'] as String,
    email: json['email'] as String,
    firebaseToken: json['firebaseToken'] as String,
    bio: json['bio'] as String,
    sex: json['sex'] as String,
    imageUrl: (json['imageUrl'] as List)?.map((e) => e as String)?.toList(),
    videoUrl: (json['videoUrl'] as List)?.map((e) => e as String)?.toList(),
    reviewCount: json['reviewCount'] as int,
    likeCount: json['likeCount'] as int,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      '_id': instance.userId,
      'name': instance.userName,
      'password': instance.password,
      'email': instance.email,
      'firebaseToken': instance.firebaseToken,
      'bio': instance.bio,
      'sex': instance.sex,
      'imageUrl': instance.imageUrl,
      'videoUrl': instance.videoUrl,
      'reviewCount': instance.reviewCount,
      'likeCount': instance.likeCount,
    };
