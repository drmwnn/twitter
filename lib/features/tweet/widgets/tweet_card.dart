import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/common/common.dart';
import 'package:twitter/features/auth/controller/auth_controller.dart';
import 'package:twitter/models/tweet_model.dart';
import 'package:twitter/theme/pallete.dart';
import 'package:timeago/timeago.dart' as timeago;
class TweetCard extends ConsumerWidget {
  final Tweet tweet;
  const TweetCard({
    super.key,
    required this.tweet,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userDetailsProvider(tweet.uid)).when(
          data: (user) {
            return Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(user.profilePic),
                        radius: 35,
                      ),
                    ),
                    Column(
                      children: [
                        //retweeted
                        Row(children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: Text(
                              user.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                          ),
                          Text(
                            '@${user.name} . ${timeago.format(
                              tweet.tweetedAt,
                              locale: 'en_short',
                              )}',
                            style: const TextStyle(
                              color: Pallete.greyColor,
                              fontSize: 17,
                            ),
                          ),
                        ])
                      ],
                    ),
                    //replied to
                    
                  ],
                ),
                
              ],
            );
          },
          error: (error, stackTrace) => ErrorText(
            error: error.toString(),
          ),
          loading: () => const Loader(),
        );
  }
}
