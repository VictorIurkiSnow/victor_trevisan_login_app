import 'package:get_it/get_it.dart';
import 'package:victor_trevisan_login_app/core/adapter/remote_client_adapter.dart';
import 'package:victor_trevisan_login_app/features/home/data/datasource/home_page_datasource.dart';
import 'package:victor_trevisan_login_app/features/home/data/repository/home_page_repository_impl.dart';
import 'package:victor_trevisan_login_app/features/home/domain/repository/home_page_repository.dart';
import 'package:victor_trevisan_login_app/features/home/domain/usecase/fetch_user_data_usecase.dart';
import 'package:victor_trevisan_login_app/features/home/domain/usecase/fetch_user_id_usecase.dart';
import 'package:victor_trevisan_login_app/features/home/presentation/common/controller/home_page_controller.dart';
import 'package:victor_trevisan_login_app/features/login/presentation/controller/login_page_controller.dart';

class AppGetIt {
  static final instance = GetIt.instance;

  static void setUp() {
    ///[Clients & Adapters]
    _setupClientsAndAdapters();

    ///[Datasource]
    _setupDataSources();

    ///[Repositories]
    _setupRepositories();

    ///[Usecases]
    _setupUsecases();

    ///[Controllers]
    _setupControllers();
  }

  static void _setupClientsAndAdapters() {
    instance.registerSingleton<RemoteClientAdapter>(RemoteClientAdapterImpl());
  }

  static void _setupControllers() {
    instance.registerFactory<LoginPageController>(() => LoginPageController());
    instance
        .registerLazySingleton<HomePageController>(() => HomePageController());
  }

  static void _setupUsecases() {
    instance
        .registerFactory<FetchUserIdUsecase>(() => FetchUserIdUsecaseImpl());
    instance.registerFactory<FetchUserDataUsecase>(
        () => FetchUserDataUsecaseImpl());
  }

  static void _setupRepositories() {
    instance
        .registerFactory<HomePageRepository>(() => HomePageRepositoryImpl());
  }

  static void _setupDataSources() {
    instance
        .registerFactory<HomePageDatasource>(() => HomePageDatasourceImpl());
  }

 static void resetControllers() {
  // Remove o controlador de login
  if (instance.isRegistered<LoginPageController>()) {
    instance.unregister<LoginPageController>();
  }

  // Remove o controlador da home page
  if (instance.isRegistered<HomePageController>()) {
    instance.unregister<HomePageController>();
  }

  // Registra novamente os controladores após o reset
  _setupControllers();
}
}
