import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/apis/storage_api.dart';
import 'package:twitter/apis/tweet_api.dart';
import 'package:twitter/apis/user_api.dart';
import 'package:twitter/core/utils.dart';
import 'package:twitter/models/tweet_model.dart';
import 'package:twitter/models/user_model.dart';

final userProfilControllerProvider =
    StateNotifierProvider<UserProfilController, bool>((ref) {
  return UserProfilController(
    tweetAPI: ref.watch(tweetAPIProvider),
    storageAPI: ref.watch(storageAPIProvider),
    userAPI: ref.watch(userAPIProvider),
  );
});

final getUserTweetsProvider = FutureProvider.family((ref, String uid) async {
  final userProfileController =
      ref.watch(userProfilControllerProvider.notifier);
  return userProfileController.getUserTweets(uid);
});

final getLatestUserProfileDataProvider = StreamProvider((ref) {
  final userAPI = ref.watch(userAPIProvider);
  return userAPI.getLatestUserProfileData();
});

class UserProfilController extends StateNotifier<bool> {
  final TweetAPI _tweetAPI;
  final StorageAPI _storageAPI;
  final UserAPI _userAPI;
  UserProfilController({
    required TweetAPI tweetAPI,
    required StorageAPI storageAPI,
    required UserAPI userAPI,
  })  : _tweetAPI = tweetAPI,
        _storageAPI = storageAPI,
        _userAPI = userAPI,
        super(false);

  Future<List<Tweet>> getUserTweets(String uid) async {
    final tweets = await _tweetAPI.getUserTweets(uid);
    return tweets.map((e) => Tweet.fromMap(e.data)).toList();
  }

  void updateUserProfile({
    required UserModel userModel,
    required BuildContext context,
    required File? bannerFile,
    required File? profileFile,
  }) async {
    state = true;
    if (bannerFile != null) {
      final bannerUrl = await _storageAPI.uploadImage([bannerFile]);
      userModel = userModel.copyWith(
        bannerPic: bannerUrl[0],
      );
    }

    if (profileFile != null) {
      final profileUrl = await _storageAPI.uploadImage([profileFile]);
      userModel = userModel.copyWith(
        profilePic: profileUrl[0],
      );
    }

    final res = await _userAPI.updateUserData(userModel);
    state = false;
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) => Navigator.pop(context),
    );
  }
}
