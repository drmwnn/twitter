class AppwriteConstants {
  static const String databaseId = '642d0acd67f4b3761ed1';
  static const String projectId = '6458fdb21b4b5c726406';
  static const String endPoint = 'http://165.22.245.132/v1';

  static const String usersCollection = '643503943aff5133a06f';
  static const String tweetsCollection = '643d9a7199df44ef48db';
  static const String notificationsCollection = '64580c1c9a27f37abbef';

  static const String imagesBucket = '644aa8c4c0839376a1b7';

  static String imageUrl(String imageId) =>
      '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId&mode=admin';
}
