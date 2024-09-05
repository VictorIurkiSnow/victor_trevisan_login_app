
import 'package:victor_trevisan_login_app/app_get_it.dart';
import 'package:victor_trevisan_login_app/core/adapter/remote_client_adapter.dart';
import 'package:victor_trevisan_login_app/core/constants/app_urls.dart';
import 'package:victor_trevisan_login_app/core/generic/custom_api_exception.dart';
import 'package:victor_trevisan_login_app/core/generic/resource.dart';

class AuthServices {
  static final _remoteClient = AppGetIt.instance.get<RemoteClientAdapter>();

  static Future<Resource<void, CustomApiException>> login({
    required String email,
    required String password,
  }) async {
    try {
      String url = AppUrls.login;
      final body = {
        'email': email,
        'password': password,
      };

      final response = await _remoteClient.post(url, body);

      if (response.hasError) {
        throw response.error!;
      }

      return Resource.success();
    } catch (e) {
      return Resource.failed(error: CustomApiException(e.toString()));
    }
  }
}
