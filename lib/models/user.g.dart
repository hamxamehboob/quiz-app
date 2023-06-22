part of 'user_model.dart';

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['uid'] as String,
    json['email'] as String?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
    };
