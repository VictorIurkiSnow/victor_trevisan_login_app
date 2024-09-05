import 'package:victor_trevisan_login_app/core/generic/resource.dart';
import 'package:victor_trevisan_login_app/features/home/domain/entity/user_entity.dart';

abstract class HomePageRepository {
  Future<Resource<String, Exception>> fetchUserId({required String email});
  Future<Resource<UserEntity, Exception>> fetchUserData({required String id});
}
