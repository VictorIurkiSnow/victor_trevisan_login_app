import 'package:get_it/get_it.dart';
import 'package:victor_trevisan_login_app/core/generic/resource.dart';
import 'package:victor_trevisan_login_app/features/home/data/datasource/home_page_datasource.dart';
import 'package:victor_trevisan_login_app/features/home/domain/entity/user_entity.dart';
import 'package:victor_trevisan_login_app/features/home/domain/entity/user_id_entity.dart';
import 'package:victor_trevisan_login_app/features/home/domain/repository/home_page_repository.dart';

class HomePageRepositoryImpl extends HomePageRepository {
  HomePageDatasource homePageDatasource =
      GetIt.instance.get<HomePageDatasource>();
  @override
  Future<Resource<String, Exception>> fetchUserId(
      {required String email}) async {
    try {
      final resource = await homePageDatasource
          .fetchUserId(variables: {"email": email, "password": "123456"});

      if (resource.hasError) {
        throw resource.error.toString();
      }

      final userIdEntity = UserIdEntity.fromMap(resource.data!);

      final String userId = userIdEntity.userId;

      return Resource.success(data: userId);
    } catch (e) {
      return Resource.failed(error: Exception(e.toString()));
    }
  }

  @override
  Future<Resource<UserEntity, Exception>> fetchUserData(
      {required String id}) async {
    try {
      final resource =
          await homePageDatasource.fetchUserData(variables: {"id": id});

      if (resource.hasError) {
        throw resource.error.toString();
      }

      final userEntity = UserEntity.fromMap(resource.data!);

      return Resource.success(data: userEntity);
    } catch (e) {
      return Resource.failed(error: Exception(e.toString()));
    }
  }
}
