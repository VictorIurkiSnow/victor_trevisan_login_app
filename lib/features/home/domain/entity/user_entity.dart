class UserEntity {
  final String userId;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;
  final String supportUrl;
  final String supportText;

  UserEntity({
    required this.userId,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.supportUrl,
    required this.supportText,
  });

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      userId: map['data']['id'].toString(),
      email: map['data']['email'],
      firstName: map['data']['first_name'],
      lastName: map['data']['last_name'],
      avatar: map['data']['avatar'],
      supportUrl: map['support']['url'],
      supportText: map['support']['text'],
    );
  }
}
