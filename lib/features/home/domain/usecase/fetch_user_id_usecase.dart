import 'package:victor_trevisan_login_app/app_get_it.dart';
import 'package:victor_trevisan_login_app/core/generic/resource.dart';
import 'package:victor_trevisan_login_app/features/home/domain/repository/home_page_repository.dart';

abstract class FetchUserIdUsecase {
  Future<Resource<String, Exception>> call({required String email});
}

class FetchUserIdUsecaseImpl implements FetchUserIdUsecase {
  final _homePageRepository = AppGetIt.instance.get<HomePageRepository>();
  @override
  Future<Resource<String, Exception>> call({required String email}) async {
    return await _homePageRepository.fetchUserId(email: email);
  }
}
