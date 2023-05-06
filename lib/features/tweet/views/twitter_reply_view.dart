import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/features/tweet/widgets/tweet_card.dart';
import 'package:twitter/models/tweet_model.dart';

class TwitterReplyScreen extends ConsumerWidget {
   static route(Tweet tweet) => MaterialPageRoute(
        builder: (context) => TwitterReplyScreen(
          tweet: tweet,
        ),
      );
  final Tweet tweet;
  const TwitterReplyScreen({
    super.key,
    required this.tweet,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tweet'),
      ),
      body: Column(
        children: [
          TweetCard(tweet: tweet),
        ],
      ),
      bottomNavigationBar: TextField(
        decoration: InputDecoration(
          hintText: 'Tweet your reply',
        ),
      )
    );
  }
}
