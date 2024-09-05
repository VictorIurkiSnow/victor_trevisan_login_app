import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:get_it/get_it.dart';
import 'package:victor_trevisan_login_app/core/adapter/remote_client_adapter.dart';
import 'package:victor_trevisan_login_app/core/generic/resource.dart';
import 'package:victor_trevisan_login_app/features/home/data/datasource/home_page_datasource.dart';

class MockRemoteClientAdapter extends Mock implements RemoteClientAdapter {}

void main() {
  late HomePageDatasourceImpl datasource;
  late MockRemoteClientAdapter mockRemoteClientAdapter;

  setUp(() {
    mockRemoteClientAdapter = MockRemoteClientAdapter();
    GetIt.instance
        .registerSingleton<RemoteClientAdapter>(mockRemoteClientAdapter);
    datasource = HomePageDatasourceImpl();
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  group('fetchUserId', () {
    test('should return success when RemoteClientAdapter returns data',
        () async {
          
      // Arrange
      final mockResponse =
          Resource.success(data: {'id': 1}, error: Exception());
      when(() => mockRemoteClientAdapter.post(any(), any()))
          .thenAnswer((_) async => mockResponse);

      // Act
      final result = await datasource.fetchUserId(variables: {});

      // Assert
      expect(result, isA<Resource<Map<String, dynamic>?, Exception>>());
      expect(result.data, equals({'id': 1}));
      expect(result.error, isNull);
      verify(() => mockRemoteClientAdapter.post(any(), any())).called(1);
    });

    test('should return failed when RemoteClientAdapter throws an error',
        () async {
      // Arrange
      final mockResponse =
          Resource.failed(data: {"": null}, error: Exception('Error'));
      when(() => mockRemoteClientAdapter.post(any(), any()))
          .thenAnswer((_) async => mockResponse);

      // Act
      final result = await datasource.fetchUserId(variables: {});

      // Assert
      expect(result, isA<Resource<Map<String, dynamic>?, Exception>>());
      expect(result.data, isNull);
      expect(result.error, isA<Exception>());
      verify(() => mockRemoteClientAdapter.post(any(), any())).called(1);
    });
  });

  group('fetchUserData', () {
    test('should return success when RemoteClientAdapter returns data',
        () async {
      // Arrange
      final mockResponse =
          Resource.success(data: {'name': 'John Doe'}, error: Exception());
      when(() => mockRemoteClientAdapter.get(url: any(named: 'url')))
          .thenAnswer((_) async => mockResponse);

      // Act
      final result = await datasource.fetchUserData(variables: {'id': 123});

      // Assert
      expect(result, isA<Resource<Map<String, dynamic>, Exception>>());
      expect(result.data, equals({'name': 'John Doe'}));
      expect(result.error, isNull);
      verify(() => mockRemoteClientAdapter.get(url: any(named: 'url')))
          .called(1);
    });

    test('should return failed when RemoteClientAdapter throws an error',
        () async {
      // Arrange
      final mockResponse =
          Resource.failed(data: {"": null}, error: Exception('Error'));
      when(() => mockRemoteClientAdapter.get(url: any(named: 'url')))
          .thenAnswer((_) async => mockResponse);

      // Act
      final result = await datasource.fetchUserData(variables: {'id': 123});

      // Assert
      expect(result, isA<Resource<Map<String, dynamic>, Exception>>());
      expect(result.data, isNull);
      expect(result.error, isA<Exception>());
      verify(() => mockRemoteClientAdapter.get(url: any(named: 'url')))
          .called(1);
    });
  });
}
