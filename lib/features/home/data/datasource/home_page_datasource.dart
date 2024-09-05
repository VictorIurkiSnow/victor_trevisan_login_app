import 'package:get_it/get_it.dart';
import 'package:victor_trevisan_login_app/core/adapter/remote_client_adapter.dart';
import 'package:victor_trevisan_login_app/core/constants/app_urls.dart';
import 'package:victor_trevisan_login_app/core/generic/resource.dart';

abstract class HomePageDatasource {
  Future<Resource<Map<String, dynamic>?, Exception>> fetchUserId(
      {required Map<String, dynamic> variables});
  Future<Resource<Map<String, dynamic>?, Exception>> fetchUserData(
      {required Map<String, dynamic> variables});
}

class HomePageDatasourceImpl extends HomePageDatasource {
  final RemoteClientAdapter _remoteClientAdapter =
      GetIt.instance<RemoteClientAdapter>();

  @override
  Future<Resource<Map<String, dynamic>?, Exception>> fetchUserId(
      {required Map<String, dynamic> variables}) async {
    try {
      final resource =
          await _remoteClientAdapter.post(AppUrls.getId, variables);

      if (resource.hasError) {
        throw resource.error.toString();
      }
      return Resource.success(data: resource.data);
    } catch (e) {
      return Resource.failed(error: Exception(e.toString()));
    }
  }

  @override
  Future<Resource<Map<String, dynamic>?, Exception>> fetchUserData(
      {required Map<String, dynamic> variables}) async {
    try {
      final resource = await _remoteClientAdapter.get(
          url: AppUrls.getUserData(id: variables["id"]));

      if (resource.hasError) {
        throw resource.error.toString();
      }
      return Resource.success(data: resource.data);
    } catch (e) {
      return Resource.failed(error: Exception(e.toString()));
    }
  }
}
