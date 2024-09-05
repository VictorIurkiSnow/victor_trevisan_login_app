class UserIdEntity {
  final String userId;

  UserIdEntity({
    required this.userId,
  });

  factory UserIdEntity.fromMap(Map<String, dynamic> map) {
    return UserIdEntity(
      userId: map['id'].toString(),
    );
  }
}
