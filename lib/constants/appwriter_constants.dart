class AppwriterConstants {
  static const String databaseId = '642d0acd67f4b3761ed1';
  static const String projectId = '642d07c8109cf04bc8ea';
  static const String endPoint = 'http://192.168.224.1/v1';

  static const String userCollection = '643503943aff5133a06f';
  static const String tweetsCollection = '643d9a7199df44ef48db';

  static const String imagesBucket = '644aa8c4c0839376a1b7';

  static String imageUrl(String imageId) =>
      '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId&mode=admin';
}
