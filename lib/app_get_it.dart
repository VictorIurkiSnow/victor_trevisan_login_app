import 'package:get_it/get_it.dart';
import 'package:victor_trevisan_login_app/core/adapter/remote_client_adapter.dart';
import 'package:victor_trevisan_login_app/features/login/presentation/controller/login_page_controller.dart';

class AppGetIt {
  static final instance = GetIt.instance;

  static void setUp() {
    ///[Clients & Adapters]
    _setupClientsAndAdapters();

    ///[Datasource]
    // _setupDataSources();

    ///[Repositories]
    // _setupRepositories();

    ///[Usecases]
    // _setupUseCases();

    ///[Controllers]
    _setupControllers();
  }

  static void _setupClientsAndAdapters() {
    instance.registerSingleton<RemoteClientAdapter>(RemoteClientAdapterImpl());
  }

  static void _setupControllers() {
    instance.registerFactory<LoginPageController>(() => LoginPageController());
  }
}
