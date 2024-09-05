import 'package:victor_trevisan_login_app/app_get_it.dart';
import 'package:victor_trevisan_login_app/core/generic/resource.dart';
import 'package:victor_trevisan_login_app/features/home/domain/entity/user_entity.dart';
import 'package:victor_trevisan_login_app/features/home/domain/repository/home_page_repository.dart';

abstract class FetchUserDataUsecase {
  Future<Resource<UserEntity, Exception>> call({required String id});
}

class FetchUserDataUsecaseImpl implements FetchUserDataUsecase {
  final _homePageRepository = AppGetIt.instance.get<HomePageRepository>();
  @override
  Future<Resource<UserEntity, Exception>> call({required String id}) async {
    return await _homePageRepository.fetchUserData(id: id);
  }
}
