import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/apis/tweet_api.dart';
import 'package:twitter/models/tweet_model.dart';

final userProfilControllerProvider = StateNotifierProvider((ref) {
  return UserProfilController(
    tweetAPI: ref.watch(tweetAPIProvider),
  );
});

final getUserTweetsProvider = FutureProvider.family((ref, String uid) async {
  final userProfileController =
      ref.watch(userProfilControllerProvider.notifier);
  return userProfileController.getUserTweets(uid);
});

class UserProfilController extends StateNotifier<bool> {
  final TweetAPI _tweetAPI;
  UserProfilController({
    required TweetAPI tweetAPI,
  })  : _tweetAPI = tweetAPI,
        super(false);

  Future<List<Tweet>> getUserTweets(String uid) async {
    final tweets = await _tweetAPI.getUserTweets(uid);
    return tweets.map((e) => Tweet.fromMap(e.data)).toList();
  }
}
