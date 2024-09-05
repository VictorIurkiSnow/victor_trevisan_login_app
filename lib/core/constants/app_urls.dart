class AppUrls {
  static const String login = 'https://reqres.in/api/login';
  static const String getId = 'https://reqres.in/api/register';
  static const String getUsers = 'https://reqres.in/api/users';
  static String getUserData({required String id}) =>
      'https://reqres.in/api/users/$id';
}
