import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:victor_trevisan_login_app/app_get_it.dart';
import 'package:victor_trevisan_login_app/core/generic/resource.dart';
import 'package:victor_trevisan_login_app/core/utils/navigation_utils.dart';
import 'package:victor_trevisan_login_app/features/home/domain/entity/user_entity.dart';
import 'package:victor_trevisan_login_app/features/home/domain/usecase/fetch_user_data_usecase.dart';
import 'package:victor_trevisan_login_app/features/home/domain/usecase/fetch_user_id_usecase.dart';

class HomePageController extends GetxController {
  final fetchUserIdUsecase = AppGetIt.instance.get<FetchUserIdUsecase>();
  final fetchUserDataUsecase = AppGetIt.instance.get<FetchUserDataUsecase>();
  late final RxString email = ''.obs;
  RxBool isLoading = false.obs;
  String userId = "";
  final Rxn<UserEntity> userEntity = Rxn<UserEntity>();

  Future<void> fetchUserId() async {
    if (email.value.isEmpty) NavigationUtils.goLogin();
    try {
      isLoading.value = true;
      final resource = await fetchUserIdUsecase.call(email: email.value);
      if (resource.hasError) {
        throw resource.error.toString();
      }
      if (resource.data != null) {
        userEntity.value = null;
        userId = resource.data!;
      } else {
        throw Exception("sem dados");
      }
    } catch (e) {
      Resource.failed(error: Exception(e.toString()));
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchUserData() async {
    try {
      isLoading.value = true;
      final resource = await fetchUserDataUsecase.call(id: userId);
      if (resource.hasError) {
        throw resource.error.toString();
      }
      if (resource.data != null) {
        userEntity.value = resource.data;
        userEntity.refresh();
      } else {
        throw Exception("sem dados");
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
